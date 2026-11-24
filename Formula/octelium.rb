class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.52.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.52.0/octelium-darwin-amd64.tar.gz"
      sha256 "c25b4ce80d4b7de6e26fb0ea7a8f343d3db21312aa156ff226d604216238f279"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.52.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "eef7f511b489d2c72868010a5b920d8954ed31a342cd2571eb8dc3018e9859bb"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.52.0/octops-darwin-amd64.tar.gz"
        sha256 "1a902c4eb1d75759d7d07d351bb11cb1ad25da734b55b58f45917982f51803dd"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.52.0/octelium-darwin-arm64.tar.gz"
      sha256 "9207e04969bb686ca1929d33ab09590b54d0b52a0ecee82d27051712bf59dee7"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.52.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "b5af4ee3311c979d54baa859edcd0c451affd3ff751910639b0f7029445f5d14"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.52.0/octops-darwin-arm64.tar.gz"
        sha256 "d323af11c7894e359942a8f5d0cbf4d3b394494b11e5a99d7d5c50e251a6076a"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.52.0/octelium-linux-amd64.tar.gz"
      sha256 "e4ed3a0844a4b720ce6277fe594acad3b81e04ffe8e7c75abfc9927993ca95d9"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.52.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "736613948dc994b81a8101b37c6266b0e8807935befec3e647867bf408aa2ba2"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.52.0/octops-linux-amd64.tar.gz"
        sha256 "03b01425f0c8dc32ecdfd21d423db2d3abcba6ad49b1427df933d178911fc6c6"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.52.0/octelium-linux-arm64.tar.gz"
      sha256 "40c0a80f818e7dfc86f52b3223cb075e0d4f060a18f351cf9fae8afd0d8c0815"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.52.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "c8cdfb7254b1d193ae790fb0ea2719ef6e56f9f531d426a64c90ee5a7c909fa3"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.52.0/octops-linux-arm64.tar.gz"
        sha256 "80bd9fa08db9d05f2e0ee1bc1abf65a6cba9c41ea7fcf8db617b2f95b6a2c5c7"
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