# Homebrew formula — lives in the tap repo (R0kshan/homebrew-tap).
# The release workflow rewrites version, URLs and sha256 on every tag.
class Cairn < Formula
  desc "Architecture diagrams as code — typed views, semantic layout, no label overlap"
  homepage "https://github.com/R0kshan/cairn"
  version "1.0.0-RC16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-arm64"
      sha256 "f2d206778975d46cf93ffed2db25d6aff225bcbd9f061b8ccc9dcebf7a19cbc5"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-darwin-x64"
      sha256 "4dc12fefc96302b35377239085e42f42451245ba7ecaaaddfa9ddf8545d80182"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-arm64"
      sha256 "f62f4887670bb5f3b4bc434b280be7c6299b173f40eae365db2504b6caa36feb"
    end
    on_intel do
      url "https://github.com/R0kshan/cairn/releases/download/v#{version}/cairn-#{version}-linux-x64"
      sha256 "356ef3625f03eac99df277d9e9a254113b2ca151b81e6295ea64c3ac0fba241a"
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
    url "https://github.com/R0kshan/cairn/releases/download/v1.0.0-RC16/cairn-1.0.0-RC16-licenses.tar.gz"
    sha256 "43d5b8eda88114095fcf98d5006d75e641ce9d2e4eccff6f458e60ee36aa9771"
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
