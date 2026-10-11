class Cordium < Formula
  desc "Open-source sandbox platform with identity-based, secretless infrastructure access"
  homepage "https://octelium.com/cordium"
  version "0.17.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/cordium/releases/download/v0.17.0/cordium-darwin-amd64.tar.gz"
      sha256 "c9ec41a299bd9d010f4544c3971dd62829a6858311f72f8c6e4f5cfa4970d2fb"
    end

    on_arm do
      url "https://github.com/octelium/cordium/releases/download/v0.17.0/cordium-darwin-arm64.tar.gz"
      sha256 "98529ac76c4bd96b0562a0cf7244f454c7f43bf0e903c17b81221b0f101929e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/cordium/releases/download/v0.17.0/cordium-linux-amd64.tar.gz"
      sha256 "53aa9d6165d104a90657cab60891a0b2671a290c055130bc57108b1ab34218fe"
    end

    on_arm do
      url "https://github.com/octelium/cordium/releases/download/v0.17.0/cordium-linux-arm64.tar.gz"
      sha256 "33e556e5cc8d289f364ec9821cea9684b95858d6f1b9b036e9acff6e47ed2e22"
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