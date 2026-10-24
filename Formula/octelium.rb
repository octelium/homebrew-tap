class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.47.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.47.0/octelium-darwin-amd64.tar.gz"
      sha256 "0343727ae141336c363b93d1ed265b23005125633a4530a7c0ae8054894495e7"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.47.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "24740cb1989a0e81b735f6cc06080ee5c3d132a3ab4f1dba2946a4cd33216e1a"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.47.0/octops-darwin-amd64.tar.gz"
        sha256 "546ae6b6f29e2d8f0106c331952247fe4373e3efecc4e49b25b8f3dbb569e5b8"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.47.0/octelium-darwin-arm64.tar.gz"
      sha256 "f4f245f3b71826236683df35732ab45f3f444c04611bff4b58d7fc6571d0b077"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.47.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "98d6438719a94f655350c3f5fbfe3dcaf5634b6dfa146991b559f27f06cdb27e"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.47.0/octops-darwin-arm64.tar.gz"
        sha256 "315df9f154c533ee372fa1fe5729c1829513bfd339464cac6b19bc2933844621"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.47.0/octelium-linux-amd64.tar.gz"
      sha256 "b7c5c5d73c09b624aef37cd323426c07ab0ee8afe5a0b808284ee4b672a924b9"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.47.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "bb983d536ce33ef495d78bed29b7a27d5223644cf87ce9d5bc0d79637341cbbe"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.47.0/octops-linux-amd64.tar.gz"
        sha256 "8b90f0a16b63d37ad95ef6d157e83600738b8f56741616e34e38e7057f7ec2ab"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.47.0/octelium-linux-arm64.tar.gz"
      sha256 "d44e687831ed2a0488779a4b2a14e4932e132fda6b9d2ded5c07029a9d05f92f"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.47.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "e283f9ca26755410e3414556b6d80693e61ca26599ab3ebfffd21b8bd95bd08a"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.47.0/octops-linux-arm64.tar.gz"
        sha256 "1449b16f14213aa8822dbc87cbf00eae2a27b80931fa2303c1e2032803288bb5"
      end
    end
  end

  def install
    bin.install "octelium"
    resource("octeliumctl").stage { bin.install "octeliumctl" }
    resource("octops").stage { bin.install "octops" }

    generate_completions_from_executable(bin/"octelium", "completion")
    generate_completions_from_executable(bin/"octeliumctl", "completion")
    generate_completions_from_executable(bin/"octops", "completion")
  end

  test do
    system "#{bin}/octelium", "version"
    system "#{bin}/octeliumctl", "version"
    system "#{bin}/octops", "version"
  end
end