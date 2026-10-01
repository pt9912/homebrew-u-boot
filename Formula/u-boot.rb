# u-boot.rb — Homebrew-Formel-Skeleton (slice-v2-homebrew-formula, LH-OPEN-002,
# ADR-0016). Die Formel reist als Release-Asset desselben Tags: die vier
# markierten Platzhalter werden im publish-Workflow aus der SHA256SUMS des Tags
# befuellt (scripts/homebrew-formula-fill.sh); dieses Skeleton bleibt unveraendert.
# Vier Plattformen, nicht sechs: Homebrew traegt Windows nicht.
class UBoot < Formula
  desc "Bootstrapper fuer reproduzierbare Docker-/Devcontainer-Stacks"
  homepage "https://github.com/pt9912/u-boot"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.6.0/u-boot-darwin-arm64"
      sha256 "261e51e127aa020148dfcb67f0da35e5f49fea3b1c6b1c3b94cefe2e9405371e"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.6.0/u-boot-darwin-amd64"
      sha256 "6836a67f85daafe063614dbd519cfb9ca96f5e56ea724cfb9339d7bc5ef4962b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.6.0/u-boot-linux-arm64"
      sha256 "d96cc30d12f795e729f6393a470f34cf3f4435bedc376da722a86fee749b700e"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.6.0/u-boot-linux-amd64"
      sha256 "c311a68c979d569b8af2d94fc6dbc26e61de704c36f1b18bc43cafa7acd26765"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
