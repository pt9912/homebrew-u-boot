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
      url "https://github.com/pt9912/u-boot/releases/download/v0.14.0/u-boot-darwin-arm64"
      sha256 "d997f8b6e731661d6fee77d37b42ba7ff6fb3a88091f817018c6cb3f5998f248"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.14.0/u-boot-darwin-amd64"
      sha256 "0a8b2b80d4ca35d0c6f36741ca30e300c14ae7450ab4104673d6a96a322ab10a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.14.0/u-boot-linux-arm64"
      sha256 "97f166bc7b9b317804797e38041732b394be96fda571a7380f97e78492e3f994"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.14.0/u-boot-linux-amd64"
      sha256 "d95b7bf8f4c5af0fbe6009e3c00f1d4e428efcc044d58a0d3c8376743c6b6ddb"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
