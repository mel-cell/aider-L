#!/bin/bash
# Mellow Status Skill
# Memberikan ringkasan estetis tentang repository

echo -e "\033[1;37m🌊 Mellow Code Snapshot\033[0m"
echo -e "\033[0;90m──────────────────────────────────────────────────\033[0m"

# 1. Project Identity
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "N/A")
remote=$(git remote get-url origin 2>/dev/null || echo "No remote")
echo -e "\033[1;32mPROJECT \033[0m| \033[1m$branch\033[0m @ $remote"

# 2. Changes Detail
echo -e "\n\033[1;33mCHANGES \033[0m|"
changes=$(git status --short)
if [ -z "$changes" ]; then
    echo -e "   \033[0;90mNo pending changes. Repository is clean.\033[0m"
else
    echo "$changes" | awk '{print "   • \033[0;97m"$2"\033[0m [\033[0;33m"$1"\033[0m]"}'
fi

# 3. Recent History
echo -e "\n\033[1;34mHISTORY \033[0m| Last 3 Commits"
git log -n 3 --format="   • %C(yellow)%h%C(reset) %s %C(dim white)(%cr)%C(reset)" 2>/dev/null || echo "   No history found."

# 4. Swarm Health
echo -e "\n\033[1;35mSWARM   \033[0m| Agent Status"
if pgrep -f "ruflo" > /dev/null; then
    echo -e "   ✅ \033[1;32mRUFLO Daemon is Active\033[0m"
else
    echo -e "   ❌ \033[1;31mRUFLO Daemon is Offline\033[0m"
fi

echo -e "\033[0;90m──────────────────────────────────────────────────\033[0m"
