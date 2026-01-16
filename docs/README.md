# Documentation

This repository uses the Tech of Our Own documentation structure with lightweight RFCs and ADRs.

## Structure

```
docs/
├── rfcs/          # Pre-decisional exploration and proposals
└── decisions/     # Architecture Decision Records (ADRs)
```

## When to use what

- **RFCs (`rfcs/`)** — explore ideas or proposals before deciding; capture options, trade-offs, and open questions.
- **ADRs (`decisions/`)** — record a decision that was made, with context, rationale, consequences, and links to any originating RFC.

## Flow

```
Problem or Idea
    ↓
RFC (exploration) → Discussion → Decision
    ↓                              ↓
Implementation               ADR (record)
```
