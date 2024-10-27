#!/bin/bash
# Author: CryoByte33

# Create a hidden directory for the script, if not present
mkdir -p "$HOME/.cryo_utilities" &>/dev/null
cd "$HOME/.cryo_utilities" || exit 1

# Uninstall swap resizer if present
# Delete legacy install directory
rm -rf "$HOME/.swap_resizer" &>/dev/null

# Remove legacy Desktop icons
rm -rf ~/Desktop/SwapResizerUninstall.desktop &>/dev/null
rm -rf ~/Desktop/SwapResizer.desktop &>/dev/null

# Remove old binary
rm -f "$HOME/.cryo_utilities/cryo_utilities" &>/dev/null

# Download binary
wget https://github.com/FishPhd/steam-deck-utilities/releases/download/latest/cryo_utilities -O "$HOME/.cryo_utilities/cryo_utilities"

chmod +x "$HOME/.cryo_utilities/cryo_utilities"
# Remove old launcher
rm -f "$HOME/.cryo_utilities/launcher.sh" &>/dev/null

# Install launcher script
wget https://raw.githubusercontent.com/FishPhd/steam-deck-utilities/main/launcher.sh -O "$HOME/.cryo_utilities/launcher.sh"
chmod +x "$HOME/.cryo_utilities/launcher.sh"

# Remove old icon
rm -f "$HOME/.cryo_utilities/cryo-utilities.png" &>/dev/null

# Install Icon
wget https://raw.githubusercontent.com/FishPhd/steam-deck-utilities/main/cmd/cryoutilities/Icon.png -O "$HOME/.cryo_utilities/cryo-utilities.png"
xdg-icon-resource install cryo-utilities.png --size 64

# Create Desktop icons
rm -rf "$HOME"/Desktop/CryoUtilitiesUninstall.desktop 2>/dev/null
echo '#!/usr/bin/env xdg-open
[Desktop Entry]
Name=Uninstall CryoUtilities
Exec=curl https://raw.githubusercontent.com/FishPhd/steam-deck-utilities/main/uninstall.sh | bash -s --
Icon=delete
Terminal=false
Type=Application
StartupNotify=false' >"$HOME"/Desktop/CryoUtilitiesUninstall.desktop
chmod +x "$HOME"/Desktop/CryoUtilitiesUninstall.desktop

rm -rf "$HOME"/Desktop/CryoUtilities.desktop 2>/dev/null
echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Name=CryoUtilities
Exec=bash $HOME/.cryo_utilities/launcher.sh
Icon=cryo-utilities
Terminal=false
Type=Application
StartupNotify=false" >"$HOME"/Desktop/CryoUtilities.desktop
chmod +x "$HOME"/Desktop/CryoUtilities.desktop

rm -rf "$HOME"/Desktop/UpdateCryoUtilities.desktop 2>/dev/null
echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Name=Update CryoUtilities
Exec=curl https://raw.githubusercontent.com/FishPhd/steam-deck-utilities/main/install.sh | bash -s --
Icon=bittorrent-sync
Terminal=false
Type=Application
StartupNotify=false" >"$HOME"/Desktop/UpdateCryoUtilities.desktop
chmod +x "$HOME"/Desktop/UpdateCryoUtilities.desktop

# Create Start Menu Icons
rm -rf "$HOME"/.local/share/applications/CryoUtilitiesUninstall.desktop 2>/dev/null
echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Name=CryoUtilities - Uninstall
Exec=curl https://raw.githubusercontent.com/FishPhd/steam-deck-utilities/main/uninstall.sh | bash -s --
Icon=delete
Terminal=false
Type=Application
Categories=Utility
StartupNotify=false" >"$HOME"/.local/share/applications/CryoUtilitiesUninstall.desktop
chmod +x "$HOME"/.local/share/applications/CryoUtilitiesUninstall.desktop

rm -rf "$HOME"/.local/share/applications/CryoUtilities.desktop 2>/dev/null
echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Name=CryoUtilities
Exec=bash $HOME/.cryo_utilities/launcher.sh
Icon=cryo-utilities
Terminal=false
Type=Application
Categories=Utility
StartupNotify=false" >"$HOME"/.local/share/applications/CryoUtilities.desktop
chmod +x "$HOME"/.local/share/applications/CryoUtilities.desktop

rm -rf "$HOME"/.local/share/applications/UpdateCryoUtilities.desktop 2>/dev/null
echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Name=CryoUtilities - Update
Exec=curl https://raw.githubusercontent.com/FishPhd/steam-deck-utilities/main/install.sh | bash -s --
Icon=bittorrent-sync
Terminal=false
Type=Application
Categories=Utility
StartupNotify=false" >"$HOME"/.local/share/applications/UpdateCryoUtilities.desktop
chmod +x "$HOME"/.local/share/applications/UpdateCryoUtilities.desktop

update-desktop-database ~/.local/share/applications

zenity --info --text="Install/upgrade of CryoUtilities has been completed!" --width=300
