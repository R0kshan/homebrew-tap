# Homebrew formula — lives in the tap repo (R0kshan/homebrew-tap).
# The release workflow rewrites version, URLs and sha256 on every tag.
class Cairn < Formula
  desc "Architecture diagrams as code — typed views, semantic layout, overlap-free labels"
  homepage "https://github.com/R0kshan/cairn"
  version "1.0.0-RC09"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-arm64"
      sha256 "d685e781f29a1435f28b180dbd467648b6120ef346300d99612160787fb1cfac"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-x64"
      sha256 "41cb6c1fa944a752c6255da66eac29b46f36ba89da947c3eb3bee67636b6cc8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-arm64"
      sha256 "6ab4f32d85f075e6dc39afb7d7f48632b717808b2df53050ff1887f377d7265c"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-x64"
      sha256 "1ad67ac818d86e4a1d0df719b5e555dffc9c32e9f70d5b39ae81197fdbd2627e"
    end
  end

  def install
    bin.install Dir["cairn-*"].first => "cairn"
  end

  test do
    system bin/"cairn", "explain", "E0203"
  end
end
