# Creating a Homebrew Tap for pdfpaste

## What is a Homebrew Tap?

A tap is a third-party repository that allows users to install your formula with `brew install`.

## Steps to Create Your Tap

### 1. Create a Tap Repository on GitHub

1. Go to GitHub.com
2. Create a **new repository** named: `homebrew-pdfpaste`
   - ⚠️ **Must** start with `homebrew-`
   - Example: If your username is `johndoe`, create `homebrew-pdfpaste`
3. Make it **Public**
4. Initialize with README

### 2. Add the Formula to Your Tap

```bash
# Clone your tap repository
git clone https://github.com/YOUR_USERNAME/homebrew-pdfpaste.git
cd homebrew-pdfpaste

# Copy the formula
cp ~/pdfpaste-repo/Formula/pdfpaste.rb ./pdfpaste.rb

# Edit the formula - update YOUR_USERNAME and SHA256
# (see step 3 below for getting SHA256)

# Commit and push
git add pdfpaste.rb
git commit -m "Add pdfpaste formula"
git push
```

### 3. Create a Release and Get SHA256

First, push your main pdfpaste repository:

```bash
cd ~/pdfpaste-repo
git remote add origin https://github.com/YOUR_USERNAME/pdfpaste.git
git push -u origin main

# Create a tag
git tag v1.0.0
git push origin v1.0.0
```

Then on GitHub:
1. Go to your pdfpaste repository
2. Releases → Create a new release
3. Tag: `v1.0.0`
4. Title: `v1.0.0 - Initial Release`
5. Publish release

Get the SHA256:
```bash
curl -L https://github.com/YOUR_USERNAME/pdfpaste/archive/refs/tags/v1.0.0.tar.gz | shasum -a 256
```

### 4. Update the Formula

Edit `pdfpaste.rb` in your `homebrew-pdfpaste` repository:

```ruby
class Pdfpaste < Formula
  desc "Save PDF from macOS clipboard to file (ChemDraw support)"
  homepage "https://github.com/YOUR_USERNAME/pdfpaste"
  url "https://github.com/YOUR_USERNAME/pdfpaste/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PUT_ACTUAL_SHA256_HERE"  # ← Update this!
  license "MIT"
  # ... rest of formula
end
```

Commit and push the update.

### 5. Users Can Now Install!

```bash
# Add your tap
brew tap YOUR_USERNAME/pdfpaste

# Install
brew install pdfpaste

# Done! Now they can use:
pdfpaste structure.pdf
```

## One-Line Install for Users

After setup, users can install with just:

```bash
brew install YOUR_USERNAME/pdfpaste/pdfpaste
```

Or:
```bash
brew tap YOUR_USERNAME/pdfpaste
brew install pdfpaste
```

## Updating the Formula Later

When you release a new version:

1. Create new tag in pdfpaste repo: `git tag v1.1.0 && git push origin v1.1.0`
2. Get new SHA256
3. Update `pdfpaste.rb` in homebrew-pdfpaste repo:
   - Change `url` version
   - Update `sha256`
4. Users update with: `brew upgrade pdfpaste`

## Example: Complete Setup

If your GitHub username is `chemist123`:

```bash
# Main repo
https://github.com/chemist123/pdfpaste

# Tap repo  
https://github.com/chemist123/homebrew-pdfpaste

# Users install with:
brew tap chemist123/pdfpaste
brew install pdfpaste
```

## Alternative: Submit to Homebrew Core

For official Homebrew inclusion (appears in `brew search`):
- Formula must be popular/well-maintained
- Submit PR to https://github.com/Homebrew/homebrew-core
- More strict requirements

For personal/niche tools, a tap is better!
