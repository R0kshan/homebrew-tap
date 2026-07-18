# Homebrew formula — lives in the tap repo (R0kshan/homebrew-tap).
# The release workflow rewrites version, URLs and sha256 on every tag.
class Cairn < Formula
  desc "Architecture diagrams as code — typed views, semantic layout, overlap-free labels"
  homepage "https://github.com/R0kshan/cairn"
  version "1.0.0-RC02"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-arm64"
      sha256 "e4d208409d7c9f107fc3f0b7f75351bf524429da60c2c9428a34a456a80ce1a6"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-x64"
      sha256 "e5ce9b502943eca9f675a18fc6e7dea77580a6d47295388106550c8bf500b810"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-arm64"
      sha256 "4bae8d342e0624f6880889cb30fa72ffc33f4c89169e09bea53948ecfcdf7b7a"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-x64"
      sha256 "cbd42f9a18ad045ab3c734128958a75a349c583528d4724e0457baa51cf61138"
    end
  end

  def install
    bin.install Dir["cairn-*"].first => "cairn"
  end

  test do
    system bin/"cairn", "explain", "E0203"
  end
end
