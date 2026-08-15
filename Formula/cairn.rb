# Homebrew formula — lives in the tap repo (R0kshan/homebrew-tap).
# The release workflow rewrites version, URLs and sha256 on every tag.
class Cairn < Formula
  desc "Architecture diagrams as code — typed views, semantic layout, overlap-free labels"
  homepage "https://github.com/R0kshan/cairn"
  version "1.0.0-RC12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-arm64"
      sha256 "b9da53d5e66c294bfd635040fc078beb2f45a795b57f4668c3a0e0ff303c293e"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-x64"
      sha256 "b379ad785b1465ba280fabd1de8e8bdacf1393b540c3fc5aa0f7bcb1e3ef5ae6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-arm64"
      sha256 "1dc96156913473090aaca8cbbe21d696fceb088b65ac232b4ec4427444d5c324"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-x64"
      sha256 "07b9a65469de0ea167240136ad4fb6221bb44fa55f1c98119606bf9e5ad36623"
    end
  end

  def install
    bin.install Dir["cairn-*"].first => "cairn"
  end

  test do
    system bin/"cairn", "explain", "E0203"
  end
end
