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
      url "https://github.com/pt9912/u-boot/releases/download/v0.15.1/u-boot-darwin-arm64"
      sha256 "3f84b129de0775978e9941664633353b2fbfcf2f554df1542dc6fdb0f0987562"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.15.1/u-boot-darwin-amd64"
      sha256 "41c6ce35500621363fbfc5294962b77c7b7bfe9bceff2c9da6e337b20b504cf5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.15.1/u-boot-linux-arm64"
      sha256 "9e59bf85fec0c3d95d8a1f9ec42991a96fa026c96bc1644ed08cce852816c58f"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.15.1/u-boot-linux-amd64"
      sha256 "76503fe3f6f8938994226a86d281ffb73d2b3a564ad0cbe02f38c61df46e47db"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
