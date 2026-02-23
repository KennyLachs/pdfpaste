# pdfpaste

Save PDF from macOS clipboard to file. Particularly useful for ChemDraw and other chemistry applications.

## Features

- 🎨 **ChemDraw Support** - Saves ChemDraw structures copied as PDF
- 📋 **Multiple PDF Formats** - Supports various PDF clipboard types
- 🚀 **Fast & Simple** - One command to save clipboard as PDF
- 🔧 **Customizable** - Set default output directory
- ✅ **Auto .pdf Extension** - Automatically adds `.pdf` if you forget

## Installation

### Requirements

- macOS
- Python 3.6+
- PyObjC (for clipboard access)

### Method 1: Homebrew (Recommended)

```bash
# Add the tap
brew tap YOUR_USERNAME/pdfpaste

# Install
brew install pdfpaste

# Done! Use it:
pdfpaste structure.pdf
```

### Method 2: Direct Install

```bash
# 1. Download pdfpaste.py
curl -O https://raw.githubusercontent.com/YOUR_USERNAME/pdfpaste/main/pdfpaste.py

# 2. Install PyObjC
pip3 install pyobjc-framework-Cocoa

# 3. Make executable (optional)
chmod +x pdfpaste.py

# 4. Move to PATH (optional)
sudo mv pdfpaste.py /usr/local/bin/pdfpaste
```

### Method 3: Quick Installer

```bash
git clone https://github.com/YOUR_USERNAME/pdfpaste.git
cd pdfpaste
./install.sh
```

### Quick Setup with Alias

Add to your `~/.zshrc` or `~/.bashrc`:

```bash
alias pdfpaste="python3 /path/to/pdfpaste.py"
```

Then reload:
```bash
source ~/.zshrc
```

## Usage

### Basic Usage

```bash
# Copy a structure in ChemDraw (Cmd+C), then:
python3 pdfpaste.py output.pdf
```

### With Alias

```bash
# Copy structure, then:
pdfpaste structure1.pdf

# Or without .pdf extension (automatically added):
pdfpaste structure1
```

### Custom Default Directory

Edit `DEFAULT_DIR` in `pdfpaste.py`:

```python
DEFAULT_DIR = os.path.expanduser("~/Desktop/MyProject")
```

Now you can use just the filename:
```bash
pdfpaste structure1    # Saves to ~/Desktop/MyProject/structure1.pdf
```

## Use Cases

- **Chemistry Research**: Export ChemDraw structures as PDFs for LaTeX documents
- **Scientific Writing**: Quick PDF export from various applications
- **Batch Processing**: Quickly save multiple structures with simple filenames

## How It Works

1. **Immediate Caching**: Clipboard data is cached when the script starts
2. **Multiple Format Support**: Tries `com.adobe.pdf`, `Apple PDF pasteboard type`, and others
3. **Smart Paths**: Automatically handles relative paths and file extensions

## Troubleshooting

### "No PDF found in clipboard"

Make sure you:
1. Select your structure/content in the source application
2. Copy it (Cmd+C)
3. **Immediately** run pdfpaste (don't copy anything else first)

### "Error: PyObjC not installed"

Install PyObjC:
```bash
pip3 install pyobjc-framework-Cocoa
```

### Wrong content in PDF

The clipboard was likely overwritten. Make sure you run `pdfpaste` immediately after copying, without copying anything else in between.

## License

MIT License - See LICENSE file

## Contributing

Pull requests welcome! Feel free to open issues for bugs or feature requests.

## Author

Created for streamlining chemistry workflow with ChemDraw and LaTeX.
