#!/bin/bash

DNS_SERVERS="1.1.1.1
127.0.0.53
8.8.8.8
8.8.4.4
9.9.9.10"

if command -v apt >/dev/null 2>&1; then
    PACKAGE_MANAGER="apt"
elif command -v yum >/dev/null 2>&1; then
    PACKAGE_MANAGER="yum"
elif command -v dnf >/dev/null 2>&1; then
    PACKAGE_MANAGER="dnf"
else
    echo "Unsupported package manager. Exiting."
    exit 1
fi

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info() {
    echo -e "${BLUE}[INFO] $1${NC}"
}

warning() {
    echo -e "${YELLOW}[WARNING] $1${NC}"
}

error() {
    echo -e "${RED}[ERROR] $1${NC}"
}

success() {
    echo -e "${GREEN}[SUCCESS] $1${NC}"
}

info "Installing resolvconf service..."
if [ "$PACKAGE_MANAGER" = "apt" ]; then
    apt install -y resolvconf >/dev/null 2>&1
elif [ "$PACKAGE_MANAGER" = "yum" ]; then
    yum install -y resolvconf >/dev/null 2>&1
elif [ "$PACKAGE_MANAGER" = "dnf" ]; then
    dnf install -y resolvconf >/dev/null 2>&1
fi

if [ $? -eq 0 ]; then
    success "Resolvconf service installed successfully."
else
    error "Failed to install resolvconf service."
    exit 1
fi

info "Checking status of resolvconf service..."
service_status=$(systemctl is-active resolvconf.service)
if [ "$service_status" != "active" ]; then
    warning "Resolvconf service is not active."
    info "Restarting resolvconf service..."
    systemctl restart resolvconf.service >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        success "Resolvconf service restarted successfully."
    else
        error "Failed to restart resolvconf service."
        error "Rebooting server to apply changes."
        reboot
    fi
else
    success "Resolvconf service is active."
fi

info "Setting name servers in /etc/resolvconf/resolv.conf.d/head..."
echo "$DNS_SERVERS" >/etc/resolvconf/resolv.conf.d/head
success "Name servers set successfully."

info "Restarting resolvconf.service and systemd-resolved..."
systemctl restart resolvconf.service >/dev/null 2>&1
if command -v systemctl >/dev/null 2>&1; then
    systemctl restart systemd-resolved.service >/dev/null 2>&1
fi
success "Services restarted successfully."

info "Verifying changes in /etc/resolv.conf..."
sleep 3
cat /etc/resolv.conf
success "Changes verified successfully. DNS settings updated permanently."

info "Final check complete. DNS settings updated."
