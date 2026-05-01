#!/bin/bash
# Mellow Code Global Wrapper

# 1. Cek keamanan: Hanya user 'senvada' dan 'mel' yang boleh pakai
if [ "$USER" != "senvada" ] && [ "$USER" != "mel" ]; then
    echo "🔒 Akses Ditolak: Mellow Code ini private. Hanya 'senvada' dan 'mel' yang diizinkan."
    exit 1
fi

# 2. Load API Keys dari .env ke environment sementara (aman, tidak bocor ke terminal luar)
set -o allexport
source /home/senvada/aider/.env
set +o allexport

# 3. Bikin folder global untuk menyimpan semua history secara terpusat
mkdir -p ~/.aigen_history

# 4. Generate nama file unik berdasarkan path folder project saat ini (mengubah / jadi _)
PROJECT_PATH=$(pwd | tr '/' '_')

# 5. Jalankan Aider dari Virtual Environment dengan argumen history yang dialihkan ke global
/home/senvada/aider/.venv/bin/aider \
  --chat-history-file ~/.aigen_history/chat${PROJECT_PATH}.md \
  --input-history-file ~/.aigen_history/input${PROJECT_PATH}.md \
  --llm-history-file ~/.aigen_history/llm${PROJECT_PATH}.md \
  "$@"
