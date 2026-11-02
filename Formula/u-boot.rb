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
      url "https://github.com/pt9912/u-boot/releases/download/v0.19.0/u-boot-darwin-arm64"
      sha256 "c08ab8800535a0bdc705094a93673e7db8cf1b620a32f24ef8925b06972d9a08"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.19.0/u-boot-darwin-amd64"
      sha256 "354ab04c2bbe704ec3bd2ee88d83b34e9a1e64e864b10ca2c5d7eca2d660b216"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.19.0/u-boot-linux-arm64"
      sha256 "e4ba08f1f2de20b16b123e4434e4fe74798316219d20091421ac2e1e749b67cd"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.19.0/u-boot-linux-amd64"
      sha256 "928648b738fcb3aa3e3ee5d508a49a1e08b258a59b442612b152d20af99fec19"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
