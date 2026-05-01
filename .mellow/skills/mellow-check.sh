#!/bin/bash
# Mellow Check Skill
# Analisis kode cepat dan sederhana

echo -e "\033[1;33m🔍 Mellow Code Quality Check\033[0m"
echo -e "\033[0;90m----------------------------\033[0m"

# 1. Mencari TODO/FIXME
echo -e "❯ \033[1;36mPending Tasks:\033[0m"
grep -rnE "TODO|FIXME" . --exclude-dir={.git,.mellow,node_modules,venv} | head -n 5 || echo "   None found."

# 2. Mencari file yang terlalu panjang (> 500 baris)
echo -e "\n❯ \033[1;36mLarge Files (>500 lines):\033[0m"
find . -maxdepth 3 -name "*.py" -not -path "*/.*" | xargs wc -l | sort -nr | awk '$1 > 500 {print "   "$2" ("$1" lines)"}' | head -n 5

# 3. Cek file besar yang belum masuk gitignore
echo -e "\n❯ \033[1;36mUntracked Large Objects:\033[0m"
find . -size +1M -not -path "*/.*" || echo "   All clean."

echo -e "\033[0;90m----------------------------\033[0m"
