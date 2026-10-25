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
      url "https://github.com/pt9912/u-boot/releases/download/v0.16.0/u-boot-darwin-arm64"
      sha256 "b2d2b29d364ebfd8bf70c9c90a6270020098724720a98f4040c0783351a81543"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.16.0/u-boot-darwin-amd64"
      sha256 "55231403c7103174a0af0b0b900970e9d85c90b911aeeeee83a0560df42d26ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.16.0/u-boot-linux-arm64"
      sha256 "be2d68545dd93c34d54e5f40cc8af2997b1ff7c0e7068213ce2fcf514be07734"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.16.0/u-boot-linux-amd64"
      sha256 "99b66d5fac67fa4ef82e930ce08b3f504d5b27ca8728625bbb4bddbdf735c144"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
