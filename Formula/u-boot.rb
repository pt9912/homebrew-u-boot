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
      url "https://github.com/pt9912/u-boot/releases/download/v0.16.1/u-boot-darwin-arm64"
      sha256 "b3e8637a27aa4e00a1c799b6cd3edd259876cfc21ef8a674bd9d0e39b1177b84"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.16.1/u-boot-darwin-amd64"
      sha256 "227ac600752d13ad47b266e10f821562e072651f870d71a8057c6bb6e61f51a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.16.1/u-boot-linux-arm64"
      sha256 "058afcda837d1119890d8f6a42e42cbd306d2a5ce5c9cc7f7fb32fa3c1b4f62b"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.16.1/u-boot-linux-amd64"
      sha256 "2d0545c81fdcdc181e08bfbe378acde32a55f4b13c113bd9fa1295f0ea7c08a0"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
