# Cetak Biru (Blueprint): Membangun CLI AI Agent Kustom Berbasis Aider

Dokumen ini ditulis sebagai panduan dan *roadmap* bagi Senvada dan agen AI (Gemini/Antigravity) untuk merombak *source code* Aider menjadi asisten CLI *Multi-Agent* pribadi yang sepenuhnya bisa dikustomisasi, hemat token (Caveman style), dan paham *flow* GitHub.

---

## 1. Tujuan Kita (Our Goals)
Tujuan utama dari *fork* repositori ini adalah:
1.  **Mengubah Interface (Tampilan):** Menghilangkan UI bawaan Aider yang mungkin terasa "berisik" dan menggantinya dengan tampilan terminal CLI yang sesuai selera pribadi (lebih bersih, kustom logo, dan warna).
2.  **Menerapkan Gaya "Caveman":** Memaksa agen AI untuk selalu memberikan respons singkat, *to-the-point*, dan murni kode (tanpa basa-basi) dengan mengedit *prompt default* Aider untuk menghemat token API.
3.  **Memaksimalkan Multi-Agent & GitHub Flow:** Mengoptimalkan mode Architect (`--architect`) agar AI pertama bisa membaca dan merencanakan *logic* (termasuk *flow* riwayat GitHub yang sudah ada), sementara AI kedua hanya mengeksekusi kode di *file system*.

---

## 2. Kebutuhan Kita (What We Need to Build/Edit)
Untuk mencapai tujuan di atas, kita akan fokus mengedit bagian-bagian spesifik dari *raw code* ini:
*   **Kustomisasi UI/Terminal:** Kita perlu mengedit sistem Input/Output menggunakan *library* `rich` yang dipakai Aider.
*   **Modifikasi Prompt Dasar:** Kita butuh menanamkan "Caveman Prompt" secara permanen (hardcoded) ke dalam sistem pesan Aider sehingga kita tidak perlu mengetiknya berulang kali.
*   **Otomatisasi Instalasi Lokal:** Kita butuh mengatur agar *source code* ini berjalan secara lokal di komputer (*Editable Install*) menggunakan `pip install -e .`.

---

## 3. Struktur Folder Penting (Folder Structure Guide)
Setelah menganalisis *raw code* Aider, ini adalah peta folder dan file yang menjadi target operasi kita:

*   **`aider/main.py`**
    *   *Fungsi:* Ini adalah gerbang utama (Entry Point). Saat kamu mengetik `aider` di terminal, file ini yang pertama kali berjalan.
    *   *Target Kita:* Di sini kita bisa menambahkan sapaan awal (*welcome message*), logo ASCII kustom, atau mengubah *default arguments*.
*   **`aider/io.py`**
    *   *Fungsi:* Mengatur semua Tampilan Terminal (Input dari user dan Output/warna teks dari AI).
    *   *Target Kita:* Ini adalah file **paling krusial** untuk mengubah *interface*. Kita akan mengedit ini untuk membuat tampilannya lebih *clean* dan sesuai seleramu.
*   **`aider/prompts.py`** & **`aider/coders/`**
    *   *Fungsi:* Menyimpan "Otak" (System Prompts) dari masing-masing Agen (Architect, Editor, dll).
    *   *Target Kita:* Menyelipkan instruksi *Caveman* (menghemat token) ke dalam instruksi dasar mereka.
*   **`aider/repomap.py`** & **`aider/repo.py`**
    *   *Fungsi:* Bertugas membaca *flow* Git/GitHub kamu (melihat komit, membuat peta file).
    *   *Target Kita:* (Opsional) Jika kita ingin mengubah cara dia membaca direktori atau Git.
*   **`pyproject.toml`** & **`requirements.txt`**
    *   *Fungsi:* Mengatur dependensi. Jika kita butuh *library* tambahan untuk UI, kita tambahkan di sini.

---

## 4. Langkah Selanjutnya (Next Execution Plan)
1.  **Setup Environment:** Jalankan `pip install -e .` di folder ini agar komputermu membaca *source code* lokal ini sebagai aplikasi `aider` utama.
2.  **Operasi UI Pertama:** Kita akan mulai membedah file `aider/io.py` dan `aider/main.py` untuk membuktikan bahwa kita bisa merombak tampilan *interface*-nya.
3.  **Operasi Prompt (The Caveman):** Kita akan mengedit file *prompts* agar AI langsung hemat token dari sananya.
