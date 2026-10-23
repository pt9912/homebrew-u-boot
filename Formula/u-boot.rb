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
      url "https://github.com/pt9912/u-boot/releases/download/v0.15.0/u-boot-darwin-arm64"
      sha256 "5099df1b4ef4ae5bda674baa37485d0459b04f69a8871c62a22f81dd631cfabc"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.15.0/u-boot-darwin-amd64"
      sha256 "94a820d8be5d0bab620a05b6fa206cd0d47e5ce0179d62f86769042f08a51cd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.15.0/u-boot-linux-arm64"
      sha256 "5b7883ccc71461e6672ce3be11194f830d6aa4ee5b26b0620d3ad8d8e4e2537f"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.15.0/u-boot-linux-amd64"
      sha256 "88f5a08e8ee422b8c01d7a166ba63fed913815c52ddfe5cd0084945a3467666d"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
