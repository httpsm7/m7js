# M7JS — JavaScript Secrets Hunter

```
███╗   ███╗███████╗     ██╗███████╗
████╗ ████║╚════██║    ███║██╔════╝
██╔████╔██║    ██╔╝    ╚██║███████╗
██║╚██╔╝██║   ██╔╝      ██║╚════██║
██║ ╚═╝ ██║   ██║       ██║███████║
╚═╝     ╚═╝   ╚═╝       ╚═╝╚══════╝
    JavaScript Secrets Hunter v1.0.0
```

> Advanced JavaScript file scanner for sensitive information — API keys, secrets, credentials, server IPs, and more. Built for Kali Linux.

---

## ⚡ One-Command Install (Kali Linux)

```bash
git clone https://github.com/yourusername/m7js
cd m7js
chmod +x install.sh
sudo ./install.sh
```

That's it. Now use `m7js` from anywhere.

---

## 🚀 Usage

```bash
# Scan a single URL
m7js -u https://target.com/app.js

# Scan a list of URLs from a file
m7js -f urls.txt

# Multi-threaded scan with custom output
m7js -f urls.txt -t 10 -o my_results.txt

# Deep scan — also crawl JS files embedded in HTML
m7js -u https://target.com --depth 2

# Disable colors (for piping / logging)
m7js -f urls.txt --no-color | tee scan.log
```

---

## 🎯 What It Detects

| Category | Examples |
|---|---|
| **Cloud Keys** | AWS Access Key, AWS Secret, GCP, Firebase |
| **Payment** | Stripe Secret/Publishable, PayPal, Square |
| **Communication** | Slack Token, Twilio, Telegram Bot, SendGrid |
| **Auth Tokens** | JWT, Bearer, OAuth, GitHub/GitLab Token |
| **Databases** | MongoDB URI, PostgreSQL, MySQL, Redis |
| **Infrastructure** | Internal IPs, S3 Buckets, GCP Buckets |
| **Secrets** | Passwords, API Keys, Private Keys, PGP |
| **Misc** | Email addresses, Credit Cards, SSN, Debug flags |

**50+ unique patterns** grouped by severity: `CRITICAL / HIGH / MEDIUM / LOW / INFO`

---

## 📋 Features

- ✅ Single URL scan (`-u`)
- ✅ Bulk URL scan from file (`-f`)
- ✅ Auto-extracts `.js` files linked inside HTML pages
- ✅ Multi-threaded scanning (`-t`)
- ✅ Crawl depth control (`--depth`)
- ✅ Severity-colored terminal output
- ✅ Full results saved to `.txt` file
- ✅ Error reporting per URL (HTTP errors, timeouts, DNS failures)
- ✅ Deduplication of findings
- ✅ Works on HTTPS with self-signed certs

---

## 📁 Output File

Results are automatically saved to `example<DDMMYYYY>.txt` (or custom with `-o`).

```
======================================================================
  M7JS - JavaScript Secrets Hunter
  Scan Date : 2025-01-15 14:32:10
======================================================================

URL: https://target.com/bundle.js
  Status: 200 | Content-Length: 84320 chars
  Findings: 3

  [CRITICAL] AWS Access Key
    Line    : 142
    Value   : AKIAIOSFODNN7EXAMPLE
    Context : const AWS_KEY = "AKIAIOSFODNN7EXAMPLE"

  [HIGH] JWT Token
    Line    : 891
    Value   : eyJhbGciOiJIUzI1NiIsInR5c...
    Context : headers.Authorization = "Bearer eyJhbGc..."
----------------------------------------------------------------------
Total Findings: 3
```

---

## 🔧 Options

| Flag | Description |
|---|---|
| `-u URL` | Scan a single URL |
| `-f FILE` | Scan URLs from file (one per line) |
| `-o FILE` | Custom output file |
| `-t N` | Threads for file mode (default: 5) |
| `--depth N` | HTML crawl depth (default: 1) |
| `--no-color` | Disable colored output |
| `-v` | Show version |

---

## 📦 Requirements

- Python 3.6+
- `colorama` (auto-installed by install.sh)

---

## ⚠️ Disclaimer

This tool is for **authorized security testing and educational purposes only**. Do not scan targets you don't have permission to test. The author is not responsible for misuse.

---

## 🐱 Author

Built with ❤️ for the security community.
```
        ~ m7js
```
