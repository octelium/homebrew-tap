class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.45.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.45.0/octelium-darwin-amd64.tar.gz"
      sha256 "dcc509442657d13466b778c2cec60f9921ac9a57871fcd601680c669f4d5f959"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.45.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "3d05208327dbf39315e231e3dda10f2e43233bee0d1a83c5430b71e9ad965db5"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.45.0/octops-darwin-amd64.tar.gz"
        sha256 "1a4c5094fc89bd2fcc21a0366a12959b39faeff1b949420f11682367ed3c99a0"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.45.0/octelium-darwin-arm64.tar.gz"
      sha256 "2229b106f0b2f93fad2b320fcb6dd2d869e583391ca84d52a88f37ef3622366a"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.45.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "c6b0e22b1ce2feadf5aa652c38c0a6d1360632635002acc69372b637d7b90d8b"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.45.0/octops-darwin-arm64.tar.gz"
        sha256 "abecf4c97fca356e7694f8ab6ddb7b19c56829d630334d7f722e144edc778979"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.45.0/octelium-linux-amd64.tar.gz"
      sha256 "fbb2efbfc12994d3500cd44faa2c2f69b6d3dd02bca5dc11e41f3df8b7e42ebc"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.45.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "9a5827f3576346852fd9e120b636814d8f12ca22aceacbdd765adaad397c2b4d"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.45.0/octops-linux-amd64.tar.gz"
        sha256 "b6c2bcfa5c05f17a30f591078c0dbb2e5caf74883d59edbd2e990f6c5ae5fd1f"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.45.0/octelium-linux-arm64.tar.gz"
      sha256 "779bcb7c686f425da362d2809ac086b077eb285a37f327ee6a82fe819ffc5d9c"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.45.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "c17cecdd7a4efddee82f7e33b877949200b3a048f27b9cc47cac0acd4ccdb12e"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.45.0/octops-linux-arm64.tar.gz"
        sha256 "734a603c5071d4047a3d29be0603689876443d3300d8f2aba60fddd49f492b59"
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