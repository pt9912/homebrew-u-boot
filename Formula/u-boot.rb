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
      url "https://github.com/pt9912/u-boot/releases/download/v0.13.0/u-boot-darwin-arm64"
      sha256 "a65ba6cf97948f25f51ea7e18337431075cc0c527dda496051918b9bb252e7c9"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.13.0/u-boot-darwin-amd64"
      sha256 "b25ca02ea059c12fd1653415658263edf0e9ebb9c492366ebb4d0fc5d590cf24"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.13.0/u-boot-linux-arm64"
      sha256 "03a72559b87be143481ae263cd3260fcac46ff7c3c938e9855577a0d8455a112"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.13.0/u-boot-linux-amd64"
      sha256 "7262c2167924b9a652dffca0b7f27d207aece95cf336fabddeef6ecfc2b2fa31"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
