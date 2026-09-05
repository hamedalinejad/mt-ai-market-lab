#!/usr/bin/env python3
"""Document validation gates for mt-ai-market-lab."""
from __future__ import annotations

import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DOCS = ROOT / "docs"

PLACEHOLDER_RE = re.compile(
    r"\b(TBD|TODO|FIXME|PLACEHOLDER|lorem ipsum)\b",
    re.IGNORECASE,
)


def frontmatter(text: str) -> dict[str, str]:
    if not text.startswith("---"):
        return {}
    end = text.find("\n---", 3)
    if end == -1:
        return {}
    fm = text[3:end]
    out: dict[str, str] = {}
    for line in fm.splitlines():
        if ":" in line:
            k, v = line.split(":", 1)
            out[k.strip()] = v.strip()
    return out


def main() -> int:
    errors: list[str] = []
    warnings: list[str] = []
    ids: list[str] = []
    id_to_path: dict[str, Path] = {}
    path_meta: dict[Path, dict[str, str]] = {}

    for p in sorted(DOCS.rglob("*.md")):
        text = p.read_text(encoding="utf-8", errors="replace")
        meta = frontmatter(text)
        path_meta[p] = meta
        doc_id = meta.get("id")
        if not doc_id:
            errors.append(f"MISSING_ID {p.relative_to(ROOT)}")
            continue
        ids.append(doc_id)
        if doc_id in id_to_path:
            errors.append(f"DUPLICATE_ID {doc_id} :: {id_to_path[doc_id]} and {p.relative_to(ROOT)}")
        else:
            id_to_path[doc_id] = p.relative_to(ROOT)

        status = meta.get("status", "")
        # P0-01: approved binding must not contain placeholders
        if status == "approved":
            if len(text) < 200:
                errors.append(f"APPROVED_TOO_SHORT {p.relative_to(ROOT)}")
            # allow mention of TBD only when stating the prohibition
            body = text
            # strip code fences that discuss the policy phrase
            for m in PLACEHOLDER_RE.finditer(body):
                # context window
                start = max(0, m.start() - 80)
                ctx = body[start : m.end() + 80].lower()
                if "prohibited" in ctx or "must not" in ctx or "no-placeholder" in ctx or "not contain" in ctx:
                    continue
                if "tbd / todo" in ctx or "tbd/todo" in ctx:
                    continue
                errors.append(f"APPROVED_HAS_PLACEHOLDER {p.relative_to(ROOT)} :: {m.group(0)}")
                break  # one per file is enough signal

        # depends_on reference check
        dep = meta.get("depends_on", "")
        if dep and dep not in ("[]", ""):
            # parse list-like ['A', 'B']
            for ref in re.findall(r"['\"]?([A-Za-z0-9_-]+)['\"]?", dep):
                if ref in ("depends_on",) or not ref.startswith(("DOC-", "ADR-")):
                    continue
                # will validate after full id set

    for i, n in Counter(ids).items():
        if n > 1:
            errors.append(f"DUPLICATE_ID_COUNT {i} x{n}")

    # second pass depends_on
    known = set(ids)
    for p, meta in path_meta.items():
        dep = meta.get("depends_on", "")
        if not dep or dep in ("[]", ""):
            continue
        for ref in re.findall(r"(DOC-[A-Za-z0-9_-]+|ADR-\d+)", dep):
            if ref not in known:
                # ADR ids in decisions may be ADR-0001 style
                if ref.startswith("ADR-") and any(ref in x or x.endswith(ref.replace("ADR-", "ADR-")) for x in known):
                    continue
                if ref not in known:
                    warnings.append(f"MISSING_DEPENDS_ON_TARGET {p.relative_to(ROOT)} -> {ref}")

    for w in warnings:
        print("WARN", w)
    if errors:
        print("\n".join(errors))
        return 1
    print(f"OK {len(ids)} ids, unique; placeholder gate on approved docs")
    return 0


if __name__ == "__main__":
    sys.exit(main())
