# Homebrew Formula for Yaplot
# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Yaplot < Formula
  desc "Yet another plotter in 3D - easy 3D modeller and animator for visualizing simulation results"
  homepage "https://github.com/vitroid/Yaplot"
  url "https://github.com/vitroid/Yaplot/archive/master.tar.gz"
  sha256 "3ad0ed4dc9b18dcdb211bafd4f0be129404b638f5ef1ea1c6fc5bf840deda544"
  license "MIT"

  depends_on "gtk+3"
  depends_on "pkg-config" => :build
  depends_on "libpng"

  # Disable bottles since this is a third-party formula
  disable_bottles!

  def install
    # Generate common.h from template
    system "make", "gen_common", "PKGDATADIR=#{share}/yaplot", "BINDIR=#{bin}"
    
    # Build the program (but don't use the install target which may have issues)
    system "make", "yaplot", "PKGDATADIR=#{share}/yaplot", "BINDIR=#{bin}"
    
    # Install manually
    bin.install "yaplot"
    (share/"yaplot").install "yaplot.col", "help.yap"
  end

  test do
    # Test that yaplot binary exists and is executable
    assert_predicate bin/"yaplot", :exist?
    assert_predicate bin/"yaplot", :executable?
  end
end
