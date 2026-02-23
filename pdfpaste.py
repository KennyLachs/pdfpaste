#!/usr/bin/env python3
"""
pdfpaste - Save PDF from macOS clipboard to file
Supports ChemDraw and other applications that copy PDFs to clipboard.
"""

import sys
import os

try:
    from AppKit import NSPasteboard, NSPDFPboardType
except ImportError:
    print("Error: PyObjC not installed.")
    print("Install with: pip3 install pyobjc-framework-Cocoa")
    sys.exit(1)

# Default directory for PDFs (can be customized)
DEFAULT_DIR = os.path.expanduser("~/Desktop")

# Cache clipboard data immediately on startup (before argument parsing)
# This prevents clipboard from being overwritten while typing filename
pb = NSPasteboard.generalPasteboard()
pdf_types = ["com.adobe.pdf", NSPDFPboardType, "Apple PDF pasteboard type"]
CACHED_PDF_DATA = None
CACHED_PDF_TYPE = None

for pdf_type in pdf_types:
    data = pb.dataForType_(pdf_type)
    if data:
        CACHED_PDF_DATA = data
        CACHED_PDF_TYPE = pdf_type
        break


def save_pdf_from_clipboard(output_path="output.pdf"):
    """Save PDF from clipboard using cached data"""
    
    if CACHED_PDF_DATA:
        success = CACHED_PDF_DATA.writeToFile_atomically_(output_path, True)
        if success:
            file_size = os.path.getsize(output_path)
            print(f"✅ PDF saved: {output_path} ({file_size} bytes)")
            print(f"   Type: {CACHED_PDF_TYPE}")
            return True
        else:
            print(f"❌ Error writing file: {output_path}")
            return False
    else:
        print("❌ No PDF found in clipboard")
        print("   Available types:")
        for t in pb.types():
            print(f"   - {t}")
        return False


if __name__ == "__main__":
    output_file = sys.argv[1] if len(sys.argv) > 1 else "output.pdf"
    
    # If only filename (no path), use default directory
    if not os.path.dirname(output_file):
        output_file = os.path.join(DEFAULT_DIR, output_file)
    
    # Automatically append .pdf if missing
    if not output_file.lower().endswith('.pdf'):
        output_file += '.pdf'
    
    save_pdf_from_clipboard(output_file)
