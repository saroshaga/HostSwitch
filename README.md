# HostSwitch - macOS Menu Bar Utility

![macOS](https://img.shields.io/badge/macOS-11.0+-blue)
![Swift](https://img.shields.io/badge/Swift-5.5+-orange)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Framework-green)

A macOS menu bar utility for managing entries in the `/etc/hosts` file with quick access from the top toolbar.

<img width="368" height="343" alt="Screenshot 2025-11-13 at 10 22 21 PM" src="https://github.com/user-attachments/assets/6da96fad-9d3a-496b-8753-88d6b91b67e7" />


*Clean, intuitive interface showing host entries with toggle controls and status indicators.*

## Features

- 🔝 **Menu bar integration** - Always accessible from the top toolbar
- 📋 **Safe section management** - Only manages entries in marked sections, never touches system hosts
- 🔄 **Quick toggle** - Enable/disable hosts with one click
- ➕ **Add new entries** - Built-in form for adding new host mappings
- 🔒 **Secure operation** - Requests admin privileges when saving changes
- 🛡️ **System protection** - Cannot remove or modify hosts outside its managed section
- 🖥️ **Native macOS interface** - Built with SwiftUI for perfect integration

## How it Works

The app manages a dedicated section in your `/etc/hosts` file marked with:
```
####### HostsManagerStart
# Your managed entries go here
####### HostsManagerEnd
```

**Key benefits:**
- **Safe**: Only modifies the designated section, leaving system entries untouched
- **Clean**: Preserves existing hosts file structure and comments
- **Isolated**: Your managed entries are clearly separated from system/manual entries

## Building and Running

1. **Build the app:**
   ```bash
   ./build_hostswitch.sh
   ```

2. **Run the app:**
   ```bash
   open HostSwitch.app
   ```

3. **Look for the network icon** in your menu bar and click it

## Auto-Start on Login (Optional)

To have HostSwitch start automatically when you log in:

1. Open **System Settings** (or **System Preferences** on older macOS)
2. Navigate to **General** → **Login Items & Extensions**
3. Click **+** next to "Open at Login" 
4. Browse to and select **HostSwitch.app**
5. HostSwitch will now start automatically when you log in

The app runs silently in the menu bar and will be ready whenever you need it.

## Initial Setup

If you don't have a managed section yet, the app will create one automatically when you add your first entry. Or manually add it:

```bash
sudo echo '' >> /etc/hosts
sudo echo '####### HostsManagerStart' >> /etc/hosts  
sudo echo '####### HostsManagerEnd' >> /etc/hosts
```

*Note: The section markers remain as "HostsManagerStart/End" for compatibility with existing installations.*

## Usage

1. **Click the network icon** in your menu bar
2. **View current entries** - See all managed hosts with their status
3. **Toggle entries** - Click the circle to enable/disable any host
4. **Add new entries** - Click "Add Host" to create new mappings
5. **Refresh** - Click refresh to reload from the file

## Example Managed Section

Your `/etc/hosts` file will look like:
```
# System entries remain untouched
127.0.0.1	localhost
255.255.255.255	broadcasthost
::1             localhost

####### HostsManagerStart
192.168.1.100	dev.mysite.com
# 10.0.0.50	staging.mysite.com # Test server
####### HostsManagerEnd
```

## Security Notes

- **Safe operation**: Only modifies the designated section between markers
- **System protection**: Cannot remove or modify hosts outside its managed section
- **Admin privileges**: Required by macOS for any /etc/hosts modifications
- **Atomic changes**: Either all succeed or none are applied
- **Preservation**: All system entries (localhost, broadcasthost) and manual entries are always preserved
- **Clear feedback**: Status messages show when admin privileges are being requested

## Requirements

- macOS 11.0 or later
- Administrator access for modifying `/etc/hosts`
