#!/bin/bash

# Build script for HostSwitch macOS Menu Bar app
echo "Building HostSwitch Menu Bar Utility..."

# Compile the Swift app
swiftc -parse-as-library -o HostSwitch.app/Contents/MacOS/HostSwitch main.swift HostSwitch.swift \
    -framework SwiftUI \
    -framework Foundation \
    -framework AppKit \
    -target x86_64-apple-macos11.0

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo "📁 Menu bar app created at: HostSwitch.app"
    echo ""
    echo "To run the app:"
    echo "  open HostSwitch.app"
    echo ""
    echo "📋 Usage:"
    echo "  • The app will appear in your menu bar with a network icon"
    echo "  • Click the icon to view and toggle hosts entries"
    echo "  • Only manages entries in the dedicated section marked with:"
    echo "    ####### HostSwitchStart"
    echo "    ####### HostSwitchEnd"
    echo ""
    echo "🔒 Note: The app will request administrator privileges when modifying /etc/hosts"
    echo "      This is required by macOS for system file security"
    echo ""
    echo "📋 Usage:"
    echo "  1. Click the network icon in your menu bar"
    echo "  2. Toggle host entries on/off or add new ones"
    echo "  3. Enter your password when prompted"
    echo "  4. Changes are applied immediately"
else
    echo "❌ Build failed!"
    exit 1
fi