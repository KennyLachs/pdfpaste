class Pdfpaste < Formula
  desc "Save PDF from macOS clipboard to file (ChemDraw support)"
  homepage "https://github.com/YOUR_USERNAME/pdfpaste"
  url "https://github.com/YOUR_USERNAME/pdfpaste/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"
  license "MIT"

  depends_on :macos
  depends_on "python@3"

  def install
    # Install PyObjC if not available
    system "pip3", "install", "--quiet", "pyobjc-framework-Cocoa" rescue nil
    
    # Install the script
    bin.install "pdfpaste.py" => "pdfpaste"
  end

  def caveats
    <<~EOS
      pdfpaste requires PyObjC. If it's not installed, run:
        pip3 install pyobjc-framework-Cocoa

      Usage:
        pdfpaste output.pdf
        pdfpaste structure    # .pdf added automatically

      To customize default directory, edit:
        #{bin}/pdfpaste
    EOS
  end

  test do
    system "#{bin}/pdfpaste", "--help"
  end
end
