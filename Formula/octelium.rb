class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.29.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.29.0/octelium-darwin-amd64.tar.gz"
      sha256 "938a122dfaa5765cfaa5be5cd7350f0b098d2dd9e8e178e38895acbb9a981f16"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.29.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "d62c00328abb0acc0626a0784dc65c2dddef77eefa60704e02a9c754ec128274"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.29.0/octops-darwin-amd64.tar.gz"
        sha256 "b04882155e32db30e461540bda2a78fb9633c7c7ba7de1171e19a7516336b284"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.29.0/octelium-darwin-arm64.tar.gz"
      sha256 "2555028d49d4f76d11670fbf0b2a5462b791b8df7c6dd585e9bab183d8711c5e"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.29.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "0c04793e366b8ae8b5ab51bc5f0d07f8c6dc94a67f0bf7cc4680eef8481b8fcc"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.29.0/octops-darwin-arm64.tar.gz"
        sha256 "b3e0b2885db9fdab2712e4ca3bc1435c6c10aa223d23556a1753486fbc230fa3"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.29.0/octelium-linux-amd64.tar.gz"
      sha256 "995a28a49554c55fdbf1b82a225f309994018c52abe780fb2ef264e4f48147ab"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.29.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "4eb7e1041f7acb1c57f3da7869235ccb8005c076950b59f79a9d80849c24dbae"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.29.0/octops-linux-amd64.tar.gz"
        sha256 "e52dd60912f90f6f909499e0003a23f89300ecac933b0bb0816088bdf61e5f78"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.29.0/octelium-linux-arm64.tar.gz"
      sha256 "612170a7f3b504c6dff36b06bc286a706900881d50c8d4d9f653081cd18aa019"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.29.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "5b95d6838eebe983a85fb96b4aa3785da163562b026950e6d5a87cfb6cfce450"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.29.0/octops-linux-arm64.tar.gz"
        sha256 "119f271fe39e0953fdaaee4bc2e82316593aa4985ad17a3486e22e3ac908afd0"
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