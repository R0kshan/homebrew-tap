# Homebrew formula — lives in the tap repo (R0kshan/homebrew-tap).
# The release workflow rewrites version, URLs and sha256 on every tag.
class Cairn < Formula
  desc "Architecture diagrams as code — typed views, semantic layout, overlap-free labels"
  homepage "https://github.com/R0kshan/cairn"
  version "1.0.0-RC05"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-arm64"
      sha256 "f84f9523fc1ade7df9f7d807b1f9ff714789d0b370ae8dabfa96ab7c3fec4e78"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-x64"
      sha256 "1428e36b4cb6d400ee67372ab1dd66b4b34f5cdeca5b3394bd3e432c8ae00858"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-arm64"
      sha256 "5c6dae3f9b129e003e8cc70b9aa7afadcca32488b13ba0d1b3f5fcc9ae49b468"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-x64"
      sha256 "91c42d518d7375ace40345d76da2643c67d2153634173f7f4a87d258393ea7fd"
    end
  end

  def install
    bin.install Dir["cairn-*"].first => "cairn"
  end

  test do
    system bin/"cairn", "explain", "E0203"
  end
end
