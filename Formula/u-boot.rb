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
      url "https://github.com/pt9912/u-boot/releases/download/v0.10.0/u-boot-darwin-arm64"
      sha256 "9fa7b3b8eb218ac9161c03c2ae11eb2d4feb0078b827af8a0e53a1c0ee4c34ec"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.10.0/u-boot-darwin-amd64"
      sha256 "3b13008f31dd386ca18e43d0737d69dc605d41d99461db757b901e0c10290542"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.10.0/u-boot-linux-arm64"
      sha256 "66187f8e70a50b823c5ada328d9cd03845b8afdca613b7008f06b55b59ed75c9"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.10.0/u-boot-linux-amd64"
      sha256 "9d7c4c7ed01b813e0640c94bd54d0e11a12dcdf6a5c498c7dfb968c2184c7c71"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
