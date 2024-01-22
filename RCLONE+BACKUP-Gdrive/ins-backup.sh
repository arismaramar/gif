#!/bin/bash
GITHUB_CMD="https://github.com/arismaramar/gif/raw/"
echo -e "${GREEN}backup-restore config${NC}"
wget -O /usr/bin/menu-backup "${GITHUB_CMD}main/RCLONE%2BBACKUP-Gdrive/menu-backup" >/dev/null 2>&1
chmod +x /usr/bin/menu-backup > /dev/null 2>&1
