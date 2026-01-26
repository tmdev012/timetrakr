#!/bin/bash
# project_validate.sh - Phase 0 Foundation Validator
echo "🔍 PHASE 0: VANILLA TERMUX VALIDATION"
echo "======================================"

echo "1. CORE TOOLS"
git --version 2>/dev/null && echo "  ✅ Git" || echo "  ❌ Git"
python3 --version 2>/dev/null && echo "  ✅ Python3" || echo "  ❌ Python3"
pip --version 2>/dev/null && echo "  ✅ pip" || echo "  ❌ pip"
curl --version 2>/dev/null && echo "  ✅ curl" || echo "  ❌ curl"

echo ""
echo "2. SSH & GIT IDENTITY"
if ssh -T git@github.com 2>&1 | grep -q "authenticated"; then
    echo "  ✅ SSH to GitHub: OK"
else
    echo "  ❌ SSH to GitHub: FAILED"
fi
git config --get user.name >/dev/null && echo "  ✅ Git user.name set" || echo "  ❌ Git user.name"
git config --get user.email >/dev/null && echo "  ✅ Git user.email set" || echo "  ❌ Git user.email"

echo ""
echo "3. PROJECT REPOSITORY"
if [ -d .git ]; then
    echo "  ✅ Inside Git repo"
    echo "  Branch: $(git branch --show-current 2>/dev/null || echo 'detached')"
    REMOTE=$(git remote get-url origin 2>/dev/null)
    if [[ $REMOTE == git@github.com:* ]]; then
        echo "  ✅ Remote 'origin' is SSH."
    else
        echo "  ⚠️  Remote: $REMOTE"
    fi
else
    echo "  ❌ Not a Git repository root."
fi

echo ""
echo "4. SELENIUM READINESS (Key Automation)"
if python3 -c "import selenium" 2>/dev/null; then
    echo "  ✅ Selenium Python package: INSTALLED"
    # Check for webdriver-manager
    if python3 -c "import webdriver_manager" 2>/dev/null; then
        echo "  ✅ webdriver-manager: INSTALLED"
    else
        echo "  ❌ webdriver-manager: NOT INSTALLED. Run: pip install webdriver-manager"
    fi
else
    echo "  ❌ Selenium: NOT INSTALLED. Run: pip install selenium"
fi

echo ""
echo "5. RESOURCES"
if [ -f $HOME/swapfile ]; then
    echo "  ✅ Swap file exists."
else
    echo "  ⚠️  No swap file. Consider creating one for stability."
fi

echo ""
echo "======================================"
echo "VALIDATION COMPLETE."
echo "Address any ❌ items before proceeding to Phase 1."
