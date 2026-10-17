# u-boot.rb — Homebrew-Formel-Skeleton (slice-v2-homebrew-formula, LH-OPEN-002,
# ADR-0016). Die Formel reist als Release-Asset desselben Tags: die vier
# markierten Platzhalter werden im publish-Workflow aus der SHA256SUMS des Tags
# befuellt (scripts/homebrew-formula-fill.sh); dieses Skeleton bleibt unveraendert.
# Vier Plattformen, nicht sechs: Homebrew traegt Windows nicht.
class UBoot < Formula
  desc "Bootstrapper fuer reproduzierbare Docker-/Devcontainer-Stacks"
  homepage "https://github.com/pt9912/u-boot"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.9.0/u-boot-darwin-arm64"
      sha256 "7d1330a4f6692024c31479b7b64d51f36f8a373f89604dbe2e4329ee66895e0f"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.9.0/u-boot-darwin-amd64"
      sha256 "9687e4ca3a085433a8a14801cbc47b9950b0aa931af2d67d805cbfe739c77809"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.9.0/u-boot-linux-arm64"
      sha256 "15f934b098b5ae1a080097d473796c0d62a293cf104716b9ae34e9c185a2360e"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.9.0/u-boot-linux-amd64"
      sha256 "340ebde1c61492b679417e0c0cb65519f61df4df075bb0107ee9cad011f31de4"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
