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
      url "https://github.com/pt9912/u-boot/releases/download/v0.13.1/u-boot-darwin-arm64"
      sha256 "adc7a963e597f8dce0a6d0765fb899542fd0034b20c93d65a4961b1813a10be6"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.13.1/u-boot-darwin-amd64"
      sha256 "e7c7fa07483ff40e313f337c5ab6dc13c0e3eb34a4dde886690dd774a21cccb4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.13.1/u-boot-linux-arm64"
      sha256 "91b41a69f2a81550346c48fc3790974280a18e1198e792de04ed814a5668ba68"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.13.1/u-boot-linux-amd64"
      sha256 "9728f23b9a0af3e3d4d9fa2ffde0650910033fdefc951c1b9ee453d630b53f44"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
