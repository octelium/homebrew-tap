class Cordium < Formula
  desc "Open-source sandbox platform with identity-based, secretless infrastructure access"
  homepage "https://octelium.com/cordium"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/cordium/releases/download/v0.14.0/cordium-darwin-amd64.tar.gz"
      sha256 "a7ffb3603fc2a8c0b2f84ceeae9aeb8479b88ecfb4354c333237480c04918016"
    end

    on_arm do
      url "https://github.com/octelium/cordium/releases/download/v0.14.0/cordium-darwin-arm64.tar.gz"
      sha256 "5a4377184066dfbecc03c3ebe708557d4e544f4094a2efdb0d0756f599a4a327"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/cordium/releases/download/v0.14.0/cordium-linux-amd64.tar.gz"
      sha256 "ae8eb7f7e76798055ad530d59045c4cc9ffe835a1621feef112ecc6871d0cda9"
    end

    on_arm do
      url "https://github.com/octelium/cordium/releases/download/v0.14.0/cordium-linux-arm64.tar.gz"
      sha256 "cdd6615bf55fe3341a6eb547d3df45c2b9e080942854f4b9d6ed578053d52c93"
    end
  end

  def install
    bin.install "cordium"

    generate_completions_from_executable(bin/"cordium", "completion")
  end

  test do
    system "#{bin}/cordium", "version"
  end
end