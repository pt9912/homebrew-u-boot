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
      url "https://github.com/pt9912/u-boot/releases/download/v0.12.0/u-boot-darwin-arm64"
      sha256 "278686194843edc551374a6fed381fc58fe564603665a93bc5516bdc08c3d131"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.12.0/u-boot-darwin-amd64"
      sha256 "3cb7123ccc46b1753249fd6b0ee0ae50db061fe50770e2c202d87484055ac935"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pt9912/u-boot/releases/download/v0.12.0/u-boot-linux-arm64"
      sha256 "9c4dffc4abf977b936ee750673db8cc4e8c1e19afcaf305ada31cd18e5177430"
    end
    on_intel do
      url "https://github.com/pt9912/u-boot/releases/download/v0.12.0/u-boot-linux-amd64"
      sha256 "b26e4a049de4bfa9c4138f9f5a22406adcd7631c0eb16951f2508837eff68eb4"
    end
  end

  def install
    bin.install Dir["u-boot-*"].first => "u-boot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/u-boot --version")
  end
end
