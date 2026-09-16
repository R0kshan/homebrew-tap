# Homebrew formula — lives in the tap repo (R0kshan/homebrew-tap).
# The release workflow rewrites version, URLs and sha256 on every tag.
class Cairn < Formula
  desc "Architecture diagrams as code — typed views, semantic layout, no label overlap"
  homepage "https://github.com/R0kshan/cairn"
  version "1.0.0-RC17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-arm64"
      sha256 "e7dc1be526da156755e502cb49500ce8f771e17d01b8202e74303b48a12c3a54"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-x64"
      sha256 "24d6dc9c6fad9cf9ee44db199202bd920cbc6129e8b80591b28a0e91613f6349"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-arm64"
      sha256 "69224bf5abdde7ae99c85c3963a31a38662374db6dad4387ba1d91fa12f5e1b8"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-x64"
      sha256 "b9547ee11ed4982d40d86cc11821aeee1899d3dc6da3f67ad25804642a85bd69"
    end
  end

  # The binary inlines elkjs (EPL-2.0) and the Simple Icons artwork, and
  # `bun build --compile` embeds the Bun runtime — which statically links
  # JavaScriptCore, LGPL-2.1 in part. So the notices are not optional extras:
  # EPL-2.0 §3.1(b) wants a copy of the Agreement alongside each copy of the
  # program, LGPL-2.1 §6 wants the relink offer, and six vendored icons carry
  # terms that require attribution.
  #
  # One tarball rather than a resource per text, so adding a licence never means
  # editing this formula. Rendered with its checksum by
  # scripts/render-packaging.mjs, from the same checksums file as the binaries.
  resource "licenses" do
    url "https://github.com/R0kshan/cairn/releases/download/v1.0.0-RC17/cairn-1.0.0-RC17-licenses.tar.gz"
    sha256 "5f9b41100f4be3cb233a89bef17734f89f8ad9bfd5ffb9620ccdb95db5429332"
  end

  def install
    bin.install Dir["cairn-*"].first => "cairn"
    # The archive is flat — LICENSE, THIRD-PARTY-NOTICES.md and licenses/ — so
    # `brew list cairn` shows the notices under share/doc/cairn.
    # `cairn version --licenses` prints the short form from inside the binary
    # either way.
    resource("licenses").stage { doc.install Dir["*"] }
  end

  test do
    system bin/"cairn", "explain", "E0203"
  end
end
