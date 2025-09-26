# Homebrew Formula for Yaplot
# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class Yaplot < Formula
  desc "Yet another plotter in 3D - easy 3D modeller and animator for visualizing simulation results"
  homepage "https://github.com/vitroid/Yaplot"
  url "https://github.com/vitroid/Yaplot/archive/v4.1.3.tar.gz"
  sha256 "ecbc312cbcc0ac55a30444f3f8bf52faa9fa159409a6295c786fa528c72397fe"
  license "MIT"

  depends_on "gtk+3"
  depends_on "pkg-config" => :build
  depends_on "libpng"

  # No pre-built bottles available for this third-party formula

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
