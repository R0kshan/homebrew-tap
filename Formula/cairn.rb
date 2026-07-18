# Homebrew formula — lives in the tap repo (R0kshan/homebrew-tap).
# The release workflow rewrites version, URLs and sha256 on every tag.
class Cairn < Formula
  desc "Architecture diagrams as code — typed views, semantic layout, overlap-free labels"
  homepage "https://github.com/R0kshan/cairn"
  version "1.0.0-RC01"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-arm64"
      sha256 "b9b9d590d14caee60b789dd0ffb3dcc21f868b9a4d89bd1af36dae44a3a79692"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-x64"
      sha256 "3ba5f952c8144c4f21f51d73a90a031598a48bf5d4f911984a5c4df9830049f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-arm64"
      sha256 "da65e16f953c1a32204a59aea55d86f99b41878033682d425aef52be1316f287"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-x64"
      sha256 "3713a55619151b3701d4b5a721d145ec36757e213829608e7fd9ede33a8f12c7"
    end
  end

  def install
    bin.install Dir["cairn-*"].first => "cairn"
  end

  test do
    system bin/"cairn", "explain", "E0203"
  end
end
