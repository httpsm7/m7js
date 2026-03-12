#!/bin/bash
# ============================================================
#  M7JS - One-Command Installer for Kali Linux
#  Usage: chmod +x install.sh && sudo ./install.sh
# ============================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

TOOL_NAME="m7js"
INSTALL_DIR="/usr/local/bin"
SCRIPT_PATH="$(pwd)/m7js"

echo -e "${RED}"
echo "███╗   ███╗███████╗     ██╗███████╗"
echo "████╗ ████║╚════██║    ███║██╔════╝"
echo "██╔████╔██║    ██╔╝    ╚██║███████╗"
echo "██║╚██╔╝██║   ██╔╝      ██║╚════██║"
echo "██║ ╚═╝ ██║   ██║       ██║███████║"
echo "╚═╝     ╚═╝   ╚═╝       ╚═╝╚══════╝"
echo -e "${YELLOW}  JavaScript Secrets Hunter - Installer${NC}"
echo ""

# Check root
if [[ $EUID -ne 0 ]]; then
   echo -e "${RED}[!] Run as root: sudo ./install.sh${NC}"
   exit 1
fi

echo -e "${CYAN}[*] Checking Python3...${NC}"
if ! command -v python3 &>/dev/null; then
    echo -e "${RED}[!] Python3 not found. Installing...${NC}"
    apt-get install -y python3 python3-pip
fi
echo -e "${GREEN}[✓] Python3 OK${NC}"

echo -e "${CYAN}[*] Installing dependencies...${NC}"
pip3 install colorama --break-system-packages 2>/dev/null || pip3 install colorama
echo -e "${GREEN}[✓] Dependencies installed${NC}"

echo -e "${CYAN}[*] Installing m7js to ${INSTALL_DIR}...${NC}"
if [[ ! -f "$SCRIPT_PATH" ]]; then
    echo -e "${RED}[!] m7js script not found in current directory!${NC}"
    exit 1
fi

cp "$SCRIPT_PATH" "$INSTALL_DIR/m7js"
chmod +x "$INSTALL_DIR/m7js"

# Make sure it's Python script
sed -i '1s|^|#!/usr/bin/env python3\n|' "$INSTALL_DIR/m7js" 2>/dev/null || true
head -1 "$INSTALL_DIR/m7js" | grep -q "python3" || sed -i '1s|^|#!/usr/bin/env python3\n|' "$INSTALL_DIR/m7js"

echo -e "${GREEN}[✓] Installed to ${INSTALL_DIR}/m7js${NC}"

echo ""
echo -e "${GREEN}╔══════════════════════════════════════╗"
echo -e "║   M7JS installed successfully!       ║"
echo -e "╚══════════════════════════════════════╝${NC}"
echo ""
echo -e "${YELLOW}Usage Examples:${NC}"
echo -e "  ${CYAN}m7js -u https://example.com/app.js${NC}"
echo -e "  ${CYAN}m7js -f urls.txt${NC}"
echo -e "  ${CYAN}m7js -f urls.txt -t 10 --depth 2${NC}"
echo -e "  ${CYAN}m7js -u https://example.com/app.js -o results.txt${NC}"
echo -e "  ${CYAN}m7js --help${NC}"
echo ""
