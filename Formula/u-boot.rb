# u-boot.rb — Homebrew-Formel-Skeleton (slice-v2-homebrew-formula, LH-OPEN-002,
# ADR-0016). Die Formel reist als Release-Asset desselben Tags: die markierten
# Platzhalter (Tag und vier Digests) werden im publish-Workflow aus der SHA256SUMS
# des Tags befuellt (scripts/homebrew-formula-fill.sh); dieses Skeleton bleibt
# unveraendert. Die Version steht nur in den URLs: Homebrew liest sie von dort,
# eine `version`-Zeile waere fuer `brew audit --strict` redundant.
# Vier Plattformen, nicht sechs: Homebrew traegt Windows nicht.
class UBoot < Formula
  desc "Bootstrapper for reproducible Docker and devcontainer stacks"
  homepage "https://github.com/pt9912/u-boot"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.21.0/u-boot-darwin-arm64"
      sha256 "11d18a992df6a0adb231361b52be761b27bbeb1432c37d6e5d99cd3db2a55a0c"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.21.0/u-boot-darwin-amd64"
      sha256 "73860eb4d38073f1f6ecab6b4f541fba77e968c848a547f05a8028fbe4d5d25d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.21.0/u-boot-linux-arm64"
      sha256 "0bdcf6683d8a9e636cfd404b05c80cce043ca750509a1b335e129eb11e08590f"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.21.0/u-boot-linux-amd64"
      sha256 "51c6d3997f69824a6f0e640b47d00f66e61049d9e2ea8803d55fe557c1fdd6f6"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
