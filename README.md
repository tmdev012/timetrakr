# TimeTrakR – Version Tracking Guide

This document defines the commit tagging and versioning process for the **TimeTrakR** repository.

---

## 🔖 Commit Tag Format

Each commit message must follow this structure:

version | issue-number | commit-message | repo | affected-files

### Example
1.0.1 | #12 | Added telemetry dashboard | timetrakr | index.html, dashboard.js

---

## 📈 Versioning Rules

- Semantic Versioning: MAJOR.MINOR.PATCH
- Start at 1.0.0
- Increment PATCH for small changes (1.0.1, 1.0.2, …)
- After 1.0.99, bump MINOR → 1.1.0
- Increment MAJOR only for breaking changes

---

## 🗂️ Tracking

- All commits are logged in timesheet.csv with timestamp + tag
- GitHub commit history mirrors the same tags
- Cross-reference by commit hash if needed

---

## ✅ Workflow

1. Stage changes:
   git add .
2. Run pipeline:
   tsheet "#issue-number" "commit message"
3. The script auto-generates:
   - Next semantic version
   - Full commit tag
   - Log entry in timesheet.csv
   - Push to GitHub

---

## 📌 Notes

- Always reference an issue number (#12) for traceability
- Keep commit messages short but descriptive
- timesheet.csv is the audit trail; README is the rulebook
