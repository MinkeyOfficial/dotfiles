#!/bin/bash

VPN_NAME="o-vpn-mint-p01-TCP4-9001-op3708@oict.cz-config" # POZOR: POUŽIJ PŘESNÝ NÁZEV

STATUS=$(nmcli connection show --active | grep -c "$VPN_NAME")

if [ "$STATUS" -eq 1 ]; then
    # VPN je aktivní, odpoj ji
    nmcli connection down "$VPN_NAME"
    if [ $? -eq 0 ]; then
        echo "VPN: Odpojeno."
    else
        echo "VPN: Chyba při odpojení."
    fi
else
    # VPN je neaktivní, připoj ji
    nmcli connection up "$VPN_NAME"
    
    # Zkontrolujeme exit code
    if [ $? -eq 0 ]; then
        echo "VPN: Připojeno."
    else
        # Pokud nmcli selže (jako u tebe kvůli chybějícímu secretu),
        # dáme čas NetworkManageru, aby si heslo vyzvedl z Keyringu
        sleep 2
        # A zkontrolujeme aktivní spojení znovu
        if nmcli connection show --active | grep -q "$VPN_NAME"; then
            echo "VPN: Připojeno (s varováním)."
        else
            echo "VPN: Chyba při připojení (chybí heslo?)."
        fi
    fi
fi
