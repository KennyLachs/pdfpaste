#!/bin/bash
# Quick installer for pdfpaste

set -e

echo "🔧 Installing pdfpaste..."

# Install PyObjC if needed
if ! python3 -c "from AppKit import NSPasteboard" 2>/dev/null; then
    echo "📦 Installing PyObjC..."
    pip3 install pyobjc-framework-Cocoa
else
    echo "✅ PyObjC already installed"
fi

# Make executable
chmod +x pdfpaste.py

# Ask where to install
echo ""
echo "Where do you want to install pdfpaste?"
echo "1) /usr/local/bin (system-wide, requires sudo)"
echo "2) ~/.local/bin (user only)"
echo "3) Skip (just create alias)"
read -p "Choice (1/2/3): " choice

case $choice in
    1)
        sudo cp pdfpaste.py /usr/local/bin/pdfpaste
        echo "✅ Installed to /usr/local/bin/pdfpaste"
        ;;
    2)
        mkdir -p ~/.local/bin
        cp pdfpaste.py ~/.local/bin/pdfpaste
        echo "✅ Installed to ~/.local/bin/pdfpaste"
        echo "💡 Make sure ~/.local/bin is in your PATH"
        ;;
    3)
        SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
        echo ""
        echo "Add this to your ~/.zshrc or ~/.bashrc:"
        echo "alias pdfpaste='python3 $SCRIPT_DIR/pdfpaste.py'"
        ;;
esac

echo ""
echo "🎉 Installation complete!"
echo "Usage: pdfpaste output.pdf"
