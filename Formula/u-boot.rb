# u-boot.rb — Homebrew-Formel-Skeleton (slice-v2-homebrew-formula, LH-OPEN-002,
# ADR-0016). Die Formel reist als Release-Asset desselben Tags: die vier
# markierten Platzhalter werden im publish-Workflow aus der SHA256SUMS des Tags
# befuellt (scripts/homebrew-formula-fill.sh); dieses Skeleton bleibt unveraendert.
# Vier Plattformen, nicht sechs: Homebrew traegt Windows nicht.
class UBoot < Formula
  desc "Bootstrapper fuer reproduzierbare Docker-/Devcontainer-Stacks"
  homepage "https://github.com/pt9912/u-boot"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.8.1/u-boot-darwin-arm64"
      sha256 "411bda09258ba404eaab9a05173827e096db476defc8b1fa186dc05464df0fb1"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.8.1/u-boot-darwin-amd64"
      sha256 "33c057cb78e5f40ca0a025f5911e97bb0f5c880692f13196057a6bef34ca6502"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.8.1/u-boot-linux-arm64"
      sha256 "971a970a22b57d8e2c22b1df575a81135f0b241b751a8de12bb2059fd249f36c"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.8.1/u-boot-linux-amd64"
      sha256 "e8888e063af2993f2ad01deda9a6f23929a60341d5567de4b8e41f1905b99afe"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
