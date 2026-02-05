# TimeTrakR

> Timesheet maker with commit tagging and version tracking

[![GitHub](https://img.shields.io/badge/GitHub-tmdev012-181717?logo=github)](https://github.com/tmdev012/timetrakr)
[![Version](https://img.shields.io/badge/Version-1.0.0-blue)]()
[![License](https://img.shields.io/badge/License-MIT-green)]()

---

## Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Commit Tag Format](#commit-tag-format)
- [Versioning Rules](#versioning-rules)
- [Installation](#installation)
- [Usage](#usage)
- [Tech Stack](#tech-stack)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

TimeTrakR is a timesheet automation tool that tracks work sessions via Git commits. Each commit is tagged with semantic versioning, issue references, and logged to `timesheet.csv` for audit trails.

## Architecture

```
timetrakr/
├── README.md              # Project documentation
├── CHANGELOG.md           # Version history
├── .gitignore             # Git ignore rules
├── .env.example           # Environment template
├── timesheet.csv          # Commit audit trail
├── bashrc-mobi.txt        # Mobile shell config
├── project_push.sh        # Push automation
├── project_validate.sh    # Validation script
│
├── scripts/
│   ├── git-aliases.sh     # Git shortcuts
│   ├── smart-push.sh      # Intelligent commits
│   └── termux-sync.sh     # Cross-device sync
│
├── ollama-termux/         # Termux integration
│
├── db/
│   └── .gitkeep           # SQLite placeholder
│
├── docs/
│   └── diagrams/
│       └── .gitkeep       # SVG placeholder
│
├── backups/
│   └── .gitkeep           # Tree snapshots
│
└── logs/
    └── .gitkeep           # Runtime logs
```

## Commit Tag Format

Each commit message follows this structure:

```
version | issue-number | commit-message | repo | affected-files
```

### Example
```
1.0.1 | #12 | Added telemetry dashboard | timetrakr | index.html, dashboard.js
```

## Versioning Rules

- **Semantic Versioning:** MAJOR.MINOR.PATCH
- Start at `1.0.0`
- Increment PATCH for small changes (1.0.1, 1.0.2, ...)
- After 1.0.99, bump MINOR -> 1.1.0
- Increment MAJOR only for breaking changes

### Tracking
- All commits logged in `timesheet.csv` with timestamp + tag
- GitHub commit history mirrors the same tags
- Cross-reference by commit hash if needed

## Installation

### Quick Install
```bash
git clone https://github.com/tmdev012/timetrakr.git
cd timetrakr
bash scripts/git-aliases.sh  # Install git shortcuts
```

### Manual Setup
```bash
git clone https://github.com/tmdev012/timetrakr.git
cd timetrakr
cp .env.example .env
```

## Usage

### Workflow
1. Stage changes:
   ```bash
   git add .
   ```
2. Run pipeline:
   ```bash
   tsheet "#issue-number" "commit message"
   ```
3. The script auto-generates:
   - Next semantic version
   - Full commit tag
   - Log entry in timesheet.csv
   - Push to GitHub

### Notes
- Always reference an issue number (#12) for traceability
- Keep commit messages short but descriptive
- `timesheet.csv` is the audit trail; README is the rulebook

## Tech Stack

| Component | Technology |
|-----------|------------|
| Shell     | Bash       |
| Database  | SQLite     |
| VCS       | Git        |
| Tracking  | CSV        |

## Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing`)
5. Open Pull Request

## License

MIT License - see [LICENSE](LICENSE) for details.

---

## Credits
- **Author:** [tmdev012](https://github.com/tmdev012)
- **AI Assistant:** Claude Opus 4.5
