# u-boot.rb — Homebrew-Formel-Skeleton (slice-v2-homebrew-formula, LH-OPEN-002,
# ADR-0016). Die Formel reist als Release-Asset desselben Tags: die vier
# markierten Platzhalter werden im publish-Workflow aus der SHA256SUMS des Tags
# befuellt (scripts/homebrew-formula-fill.sh); dieses Skeleton bleibt unveraendert.
# Vier Plattformen, nicht sechs: Homebrew traegt Windows nicht.
class UBoot < Formula
  desc "Bootstrapper fuer reproduzierbare Docker-/Devcontainer-Stacks"
  homepage "https://github.com/pt9912/u-boot"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.8.0/u-boot-darwin-arm64"
      sha256 "393f9250bf1a52720f4fa6713a01c6d5bd3427748313167e6988820dbbaee5a8"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.8.0/u-boot-darwin-amd64"
      sha256 "0c1ecd8bd40da86151d407546e5e3702a23ed6b1ec4fd4d440065ec47afbffcf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.8.0/u-boot-linux-arm64"
      sha256 "777b5fa72cb99ef778a8c9de24eec0238cca289fe4734af09743e260de158e2d"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.8.0/u-boot-linux-amd64"
      sha256 "4385080772f00def682c72d740eb8cbc68dfcb82c105601bf84eafe882c0e5ab"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
