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
      url "https://github.com/pt9912/u-boot/releases/download/v0.17.0/u-boot-darwin-arm64"
      sha256 "9e19f116d91cc104429f26abca3301c8a020b50feae41746e8b59acefed3473e"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.17.0/u-boot-darwin-amd64"
      sha256 "0e6596d168bd92832b4b179e945ce0551ec033047ec024499aeb924d35804f2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.17.0/u-boot-linux-arm64"
      sha256 "c22921fc0b4f3d20b05268e77efd1ec70cc9ccaed33bba680c7c3934092e9975"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.17.0/u-boot-linux-amd64"
      sha256 "70d0127b9422f80b4eeb932330d1169b036c41dd8af1c8b58a23e67ba075d8a0"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
