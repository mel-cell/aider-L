# Mellow Code — Architecture

## 🪨 CAVEMAN MODE (ALWAYS ON)
- Word small, brain big. Cut 75% output.
- No fluff. No "Sure!", "I'd be happy to". Only facts + code.
- Save tokens at all costs.

## Core Commands

Mellow Code runs purely on Aider's optimized workflow. 
**No external Swarms, no unnecessary layers. Just pure code generation.**

### 🏗️ /architect (Untuk Task Kompleks / Perlu Planning)
Ini adalah "Multi-Agent" murni bawaan Aider.
1. **Fase 1 (Architect Model):** LLM terkuat membaca semua file, memikirkan solusi, dan menulis *blueprint/pseudo-code* tanpa mengedit file secara langsung.
2. **Fase 2 (Editor Model):** Blueprint dilempar ke model eksekutor yang sangat cepat untuk menulis baris kodenya.
*Gunakan ini untuk:* Bikin fitur baru, refactor besar, integrasi API.

### 💻 /code (Untuk Task Langsung)
Langsung meminta LLM untuk mengedit file tanpa basa-basi planning panjang.
*Gunakan ini untuk:* Fix bug, ganti teks, tambah styling.

### 🔍 /ask (Untuk Tanya-tanya)
Minta LLM menganalisa kode tapi **dilarang keras mengedit**.
*Gunakan ini untuk:* Mencari letak bug, nanya cara kerja sistem, bedah dokumentasi.

### Mellow Custom Utilities
| Command | Description |
|---------|-------------|
| `/repo` | Cek status git & snapshot repository saat ini |
| `/check` | Scan kualitas kode (TODO, FIXME, file yang kepanjangan) |
| `/skills` | Menampilkan daftar utility commands |
| `/models` | Interactive picker buat ganti model AI dengan cepat |
