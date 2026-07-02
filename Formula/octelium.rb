class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.37.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.37.0/octelium-darwin-amd64.tar.gz"
      sha256 "ecd2172681483b971c7687e07b9c922d19efa266ec2b67af880c964befd31445"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.37.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "2816bd1adc0b7516250a0a8e4cdc93d7b501b38ced1f8128da1a2dfff35f4c4a"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.37.0/octops-darwin-amd64.tar.gz"
        sha256 "408d13203cfbd911f04d1cf5558172f011c38f4db34d50a1ab5427cb747ad288"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.37.0/octelium-darwin-arm64.tar.gz"
      sha256 "fb329534bfba500b9042c710a66e3d26a99164b59ab1a56ea0b55ed9633e7e4b"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.37.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "a2629aff783810a7ee87ff8873f0176f7818090d4aa776fdefb8a3a2c142e820"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.37.0/octops-darwin-arm64.tar.gz"
        sha256 "6ef4fa6b51728dffd52c3c2cd73403ed9793c652dba877c603ef3ca1cc031146"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.37.0/octelium-linux-amd64.tar.gz"
      sha256 "a33b48b25a8208aad8778ae91209efb7a751e8c5bf7a22d2f167e7ac49f44940"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.37.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "a836e7b1f16cff55430038d2b96ef50823a3b205f06e947e7943385747610c64"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.37.0/octops-linux-amd64.tar.gz"
        sha256 "22ce8a11685332383eddd8f6e89bf7fe5a43f1b63a547cca5d7c6e5ab0eb417d"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.37.0/octelium-linux-arm64.tar.gz"
      sha256 "1dcfa70d7612119f6cbf86d4230861af9eba94a66a9c056a9a253528c6707d35"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.37.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "1d19d835c87470a3c719bb68ef1c85a3ab6817fd748b13c89195303b4b619da8"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.37.0/octops-linux-arm64.tar.gz"
        sha256 "770c4b875eaabf0c8cffd77573a4cbc9f9d50cf763281f9b0628cdb982f14b95"
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