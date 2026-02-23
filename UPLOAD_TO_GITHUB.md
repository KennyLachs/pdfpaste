# How to Upload to GitHub

## Quick Steps:

1. **Go to GitHub** (https://github.com)
   - Click "+" → "New repository"
   - Name: `pdfpaste`
   - Description: "Save PDF from macOS clipboard - useful for ChemDraw"
   - Make it **Public**
   - **Don't** check "Initialize with README" (we already have one)
   - Click "Create repository"

2. **In Terminal** (from this directory):

```bash
cd ~/pdfpaste-repo

# Add GitHub as remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/pdfpaste.git

# Push to GitHub
git push -u origin main
```

3. **Done!** Your repository is now live at:
   `https://github.com/YOUR_USERNAME/pdfpaste`

## Alternative: Using GitHub Desktop

1. Download GitHub Desktop (https://desktop.github.com)
2. Open GitHub Desktop
3. File → Add Local Repository → Choose `~/pdfpaste-repo`
4. Click "Publish repository" → Make it Public → Publish

## What's Included:

- ✅ `pdfpaste.py` - Main script
- ✅ `README.md` - Documentation
- ✅ `LICENSE` - MIT License
- ✅ `install.sh` - Easy installer
- ✅ `.gitignore` - Git ignore rules

## After Upload:

Others can install with:
```bash
git clone https://github.com/YOUR_USERNAME/pdfpaste.git
cd pdfpaste
./install.sh
```

Or one-liner:
```bash
curl -O https://raw.githubusercontent.com/YOUR_USERNAME/pdfpaste/main/pdfpaste.py
pip3 install pyobjc-framework-Cocoa
chmod +x pdfpaste.py
```
