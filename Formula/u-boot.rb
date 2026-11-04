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
      url "https://github.com/pt9912/u-boot/releases/download/v0.22.0/u-boot-darwin-arm64"
      sha256 "f257ae1c1f3181838b9a06f4886b5358ff6513984ab5728713bf8340d00095c6"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.22.0/u-boot-darwin-amd64"
      sha256 "ca1d57496b6564687e0bf105f3e9dfdb15a30c8ea7383cb4fe85d74635a84579"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.22.0/u-boot-linux-arm64"
      sha256 "2d152675ca412cf7128860268694e19a123b54fd2d99d135cf847664348688f7"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.22.0/u-boot-linux-amd64"
      sha256 "75936809badc9192e399e17157090b125c810b18816790af30394da8a6c227ea"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
