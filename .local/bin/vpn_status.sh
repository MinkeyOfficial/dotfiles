#!/bin/bash

# Ujisti se, že VPN_NAME je přesný název z nmcli connection show
VPN_NAME="o-vpn-mint-p01-TCP4-9001-op3708@oict.cz-config"

# Kontrola, zda je připojení aktivní
if nmcli connection show --active | grep -q "$VPN_NAME"; then
    # VPN je aktivní: vrať JSON s ikonou zámku a třídou 'vpn_on'
    echo '{"text": " 🔒", "tooltip": "VPN: Připojeno", "class": "vpn_on"}'
else
    # VPN je neaktivní: vrať JSON s ikonou klíče a třídou 'vpn_off'
    echo '{"text": " 🔑", "tooltip": "VPN: Odpojeno", "class": "vpn_off"}'
fi
