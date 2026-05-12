class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.32.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.32.0/octelium-darwin-amd64.tar.gz"
      sha256 "b0fe30f53f50cc28d520530cc99ee930fe3ced39cf11f7e81c8dcd72514f46c4"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.32.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "1f4db026f4ef4e7b14dd04b1f663df3a458c867326b79ee13c0ad038d0fdf142"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.32.0/octops-darwin-amd64.tar.gz"
        sha256 "11efecd2f7cd9a410f94d2c7e1e66cd4315949e52720e4df93d117cd6fbc7161"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.32.0/octelium-darwin-arm64.tar.gz"
      sha256 "d78f74eb595e410f5d79ad8989d296bb8d584486e697e191b2f64cb6d042c914"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.32.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "c0c21bc361f9a765e6e7e02dcff94816acd202df3d448142811c0d212dcbdb0e"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.32.0/octops-darwin-arm64.tar.gz"
        sha256 "d6a7622b186a6846d66e7d5e2e45050a8aad7aceb5bc82ca65311b05255293cc"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.32.0/octelium-linux-amd64.tar.gz"
      sha256 "c6ff875bbaa1a635068d004b07b1409b9dff10b6950e5c948ab221d5bd793f31"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.32.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "708687e228d3ccd658b3a6453e73aab32a443ba39394eb9d50f6a643a8d2161e"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.32.0/octops-linux-amd64.tar.gz"
        sha256 "c42efe0191f0ed72ad89254ba1f065a39647255d59857a652379ed8cc94b5eff"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.32.0/octelium-linux-arm64.tar.gz"
      sha256 "242a7b50f995dd9746849d1210376afeb29a56a85c85b06e922d2958a963d970"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.32.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "d7746a59cc39473d2302a31f5e276dcdd3d1978e5bbe3656cccc331f372e3a90"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.32.0/octops-linux-arm64.tar.gz"
        sha256 "ee13829d01100f96517148165cd16993616b62853b83f8fcdf19cfb53b723b15"
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