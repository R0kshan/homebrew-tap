# Homebrew formula — lives in the tap repo (R0kshan/homebrew-tap).
# The release workflow rewrites version, URLs and sha256 on every tag.
class Cairn < Formula
  desc "Architecture diagrams as code — typed views, semantic layout, no label overlap"
  homepage "https://github.com/R0kshan/cairn"
  version "1.0.0-RC14"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-arm64"
      sha256 "1851b463a47dfaa2b6209cf3f500ba5acd5b740305668c8bb65a621fa1417dbd"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-x64"
      sha256 "fbfd310789bc9f9a8385f068789151e8653876f1ee2c49a36ba1ba0a8f790548"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-arm64"
      sha256 "2c481cf0412ef16179c2d44ba9fe4ab285c20a0d7254adea003cfc86e59ab112"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-x64"
      sha256 "e75df250e4203bf140dce0e17a3fe630f7e06664bb297aa65c337c674911fd95"
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
    url "https://github.com/R0kshan/cairn/releases/download/v1.0.0-RC14/cairn-1.0.0-RC14-licenses.tar.gz"
    sha256 "2d6d23b70a5a96e9d9ef9007c7a2781facebeccab4319d4d2b06314dc662f5c5"
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
