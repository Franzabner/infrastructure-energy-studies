#!/usr/bin/env python3
"""Synthetic placeholder runner for public-safe energy study examples."""

from __future__ import annotations

import json
from pathlib import Path


def main() -> None:
    root = Path(__file__).resolve().parents[1]
    states_path = root / "inputs" / "synthetic" / "energy_control_states.json"
    payload = json.loads(states_path.read_text(encoding="utf-8"))
    print("status:", payload["status"])
    print("boundary:", payload["boundary"])


if __name__ == "__main__":
    main()
