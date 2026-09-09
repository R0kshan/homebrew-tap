# Homebrew formula — lives in the tap repo (R0kshan/homebrew-tap).
# The release workflow rewrites version, URLs and sha256 on every tag.
class Cairn < Formula
  desc "Architecture diagrams as code — typed views, semantic layout, no label overlap"
  homepage "https://github.com/R0kshan/cairn"
  version "1.0.0-RC15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-arm64"
      sha256 "51ec7ef283ecd91e93291283c4dd144489eb84300931a93ebd7908c714360e8b"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-x64"
      sha256 "494522699f07725a23f30247a8d59b72ec60454fae38024952fbe349c1783aed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-arm64"
      sha256 "ea547324251f5fe352058439375eb65a5c01926fb8e4f8737cba5d72394a78ac"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-x64"
      sha256 "259cc2a6b6a22531d387e4d75f66063aee7cf5114b5d7d9527b316c9fb1272af"
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
    url "https://github.com/R0kshan/cairn/releases/download/v1.0.0-RC15/cairn-1.0.0-RC15-licenses.tar.gz"
    sha256 "c405c5af05f290098668e690e8430be1733aa6f1d23bae3e9d85f2444613a54f"
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
