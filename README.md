# Hosts Manager - macOS Menu Bar Utility

A macOS menu bar utility for managing entries in the `/etc/hosts` file with quick access from the top toolbar.

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
   ./build_hosts_manager.sh
   ```

2. **Run the app:**
   ```bash
   open HostsManager.app
   ```

3. **Look for the network icon** in your menu bar and click it

## Initial Setup

If you don't have a managed section yet, the app will create one automatically when you add your first entry. Or manually add it:

```bash
sudo echo '' >> /etc/hosts
sudo echo '####### HostsManagerStart' >> /etc/hosts  
sudo echo '####### HostsManagerEnd' >> /etc/hosts
```

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