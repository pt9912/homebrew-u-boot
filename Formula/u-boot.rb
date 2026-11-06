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
      url "https://github.com/pt9912/u-boot/releases/download/v0.24.0/u-boot-darwin-arm64"
      sha256 "3fd0a2e070f948b9884f573a341cd9cfd247a589d42b55794de38a142d2fa79f"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.24.0/u-boot-darwin-amd64"
      sha256 "1f3680747a37f3037423ff4a50e775587b39751b5a8f2a69fea242692b3ec032"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.24.0/u-boot-linux-arm64"
      sha256 "e4d065dc89b9e40858289393750c626ba922b09d267b1e4629e0e2e9804b4709"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.24.0/u-boot-linux-amd64"
      sha256 "ca6f7eb09ce9cdee8473bf7bfb3a8584399967cfee5dae3cbc660601f552fff0"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
