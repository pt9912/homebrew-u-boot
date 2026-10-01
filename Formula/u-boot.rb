# u-boot.rb — Homebrew-Formel-Skeleton (slice-v2-homebrew-formula, LH-OPEN-002,
# ADR-0016). Die Formel reist als Release-Asset desselben Tags: die vier
# markierten Platzhalter werden im publish-Workflow aus der SHA256SUMS des Tags
# befuellt (scripts/homebrew-formula-fill.sh); dieses Skeleton bleibt unveraendert.
# Vier Plattformen, nicht sechs: Homebrew traegt Windows nicht.
class UBoot < Formula
  desc "Bootstrapper fuer reproduzierbare Docker-/Devcontainer-Stacks"
  homepage "https://github.com/pt9912/u-boot"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.7.0/u-boot-darwin-arm64"
      sha256 "978643db836bca3bea5484141a507e455378c715d7590408993b0dabdfaec941"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.7.0/u-boot-darwin-amd64"
      sha256 "8b6f2c93d777ecb2b137ec2379db5fcb8cf00d103d3e4faac8c124eb6cd8bfa7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.7.0/u-boot-linux-arm64"
      sha256 "193a94c70d01cba825026380b1ea904324f4c62ddd7e9ac74693204d91c1eda1"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.7.0/u-boot-linux-amd64"
      sha256 "258f8048ddf6d911df281b19b5a3a8a0b8a65cf6db0be3ac1e8e231dab00ce0b"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
