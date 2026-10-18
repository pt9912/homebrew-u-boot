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
      url "https://github.com/pt9912/u-boot/releases/download/v0.11.0/u-boot-darwin-arm64"
      sha256 "7f7f03f769cd90b6b78638e08f47c11510d24ccde0771e93d91624a771204d60"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.11.0/u-boot-darwin-amd64"
      sha256 "4bb50c5f3ab1446182e8b7a3c4602b5e9955c09647de23c61fa63ffdf07deeb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.11.0/u-boot-linux-arm64"
      sha256 "d434eb37af07f4936a94729f7ce94f6ce0ce269aea58b7f8d8b0a7b723780b82"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.11.0/u-boot-linux-amd64"
      sha256 "72663da0c087de8f8b705dd9b1f9104e92407b43099dca0a99515cfc9623c5c1"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
