class Cordium < Formula
  desc "Open-source sandbox platform with identity-based, secretless infrastructure access"
  homepage "https://octelium.com/cordium"
  version "0.12.4"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/cordium/releases/download/v0.12.4/cordium-darwin-amd64.tar.gz"
      sha256 "7be5ee0a8ceed4cdb6717466bae9e20a495cb467571d28aeccd31e6f11a53c4b"
    end

    on_arm do
      url "https://github.com/octelium/cordium/releases/download/v0.12.4/cordium-darwin-arm64.tar.gz"
      sha256 "8274560e66588959b77e86959da6e970badcad6733f404ba92b4ed3a2d47f9f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/cordium/releases/download/v0.12.4/cordium-linux-amd64.tar.gz"
      sha256 "e0f06b86c5d48dfcc44a31524583d583c72c3ccd8469076ca7ab63fb0a7f641b"
    end

    on_arm do
      url "https://github.com/octelium/cordium/releases/download/v0.12.4/cordium-linux-arm64.tar.gz"
      sha256 "a46405688cfbfe26c1fe24c3e58c394b878688aa36f8130c8ce58ccb85901b6a"
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