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
      url "https://github.com/pt9912/u-boot/releases/download/v0.23.0/u-boot-darwin-arm64"
      sha256 "c9aaffbde7746627c1904347b8f9cb9539c14d4e76420385c62e5a4ccfc1fcd0"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.23.0/u-boot-darwin-amd64"
      sha256 "aa8470668d3e010715b077f0fa27ea0d97fb23021685c84aca0b9cb0613778d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.23.0/u-boot-linux-arm64"
      sha256 "6c03e273d6ea286b4e9a78ea77b05ffeaeb1e1fa1e464c4baa0a4d4d86b20343"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.23.0/u-boot-linux-amd64"
      sha256 "336c6d0a97b00db7aee91c0e936189e50f810dba02be186101a65804993b5b55"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
