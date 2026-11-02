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
      url "https://github.com/pt9912/u-boot/releases/download/v0.18.0/u-boot-darwin-arm64"
      sha256 "16d996d777d66fbc01e420624f69fbe0b98e4389e0d7c99b52544b0db65f088d"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.18.0/u-boot-darwin-amd64"
      sha256 "0dacc30658ea63d0be7d9f0e3dafd37b7f6fc953fbdaad6eebf701c7e50f3dff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.18.0/u-boot-linux-arm64"
      sha256 "e4ccad0d7b49c1a1469226dbf071e6f938e09a7ba85239d7e607746e3c824ff4"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.18.0/u-boot-linux-amd64"
      sha256 "fe1b1af33845ce0f7106fbcf5a31c771007599cbd1bd3309ded4fd666671ff9b"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
