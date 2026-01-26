#!/bin/bash
# project_push.sh - Validated push workflow for timetrakr
echo "🚀 Running timetrakr push workflow..."

# 1. Run project validation (silently, check exit code)
if ./project_validate.sh > /dev/null 2>&1; then
    echo "  ✅ Environment validation passed."
else
    echo "  ❌ Validation failed. Fix issues before pushing."
    exit 1
fi

# 2. Execute the Git pipeline
git add .
git commit -m "work: $(date +"%Y-%m-%d %H:%M")"
git push origin main

echo "✅ Project push complete."
