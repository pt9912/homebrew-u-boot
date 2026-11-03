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
      url "https://github.com/pt9912/u-boot/releases/download/v0.20.0/u-boot-darwin-arm64"
      sha256 "042f4085ccff26846e950886a95afd76dcd41e4508a3b924d8972d427adc6fba"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.20.0/u-boot-darwin-amd64"
      sha256 "331c37b0e7fa5b63f29e22123387a8a38a9ab430aae15b055f7a66f4d56038d0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.20.0/u-boot-linux-arm64"
      sha256 "5b0fa24794fa44dc2b0c03c8ee89043baef0bf3f4fb910933c7a212a6ec76482"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.20.0/u-boot-linux-amd64"
      sha256 "f6dddd7b1c452040905275a64654f7ed8418b0adc3a8e554f9fcbc1dea2f3571"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
