class Cordium < Formula
  desc "Open-source sandbox platform with identity-based, secretless infrastructure access"
  homepage "https://octelium.com/cordium"
  version "0.13.1"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/cordium/releases/download/v0.13.1/cordium-darwin-amd64.tar.gz"
      sha256 "450ac1c212032ad8b0ca563277358b922f93655ae3d0c7c7937f5576374ad464"
    end

    on_arm do
      url "https://github.com/octelium/cordium/releases/download/v0.13.1/cordium-darwin-arm64.tar.gz"
      sha256 "780c3a780a212a93b2fb0a6e38f3793fcc303ccf5ab9abf5239d8b17a009e212"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/cordium/releases/download/v0.13.1/cordium-linux-amd64.tar.gz"
      sha256 "a11c6516d8a437d39b97111d4842bf5d3b7d72580ed1676dd6d3ffcb0ff2b0fc"
    end

    on_arm do
      url "https://github.com/octelium/cordium/releases/download/v0.13.1/cordium-linux-arm64.tar.gz"
      sha256 "b1cc9848fd813196eaad1de6132a4fdc047e022a0fc74f2dd6b1374d29fd5d24"
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