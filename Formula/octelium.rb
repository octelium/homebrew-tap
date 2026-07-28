class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.38.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.38.0/octelium-darwin-amd64.tar.gz"
      sha256 "c083cab4611f5ac7773d92e33a529445ef606606f30f12eb2a3b5e3f0636ab28"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.38.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "917d2dcdfa72adb325de753280cb5335c2fab66f225845050e8babb3890d7565"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.38.0/octops-darwin-amd64.tar.gz"
        sha256 "532d32f1478decacba6854a0ee105f0a7fb45ea64c412c2c26e0357dbe1cbd9a"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.38.0/octelium-darwin-arm64.tar.gz"
      sha256 "d221b6b0522daf680e3ca04f95b0f3053732b717881114cfa0a28d878e54a861"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.38.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "9415a0a993389b0e5e3e04cd2a17da28feea7b8ae5c65ad6b3a5f9fab4bc5b4d"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.38.0/octops-darwin-arm64.tar.gz"
        sha256 "2d608b09bb50523bb598417dbc862d7fca4043f2734f39b29adaac6b95731f3b"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.38.0/octelium-linux-amd64.tar.gz"
      sha256 "25da845eddb444ed20cdc4399a4538a57358649b45e9b0cb6a6ec46efb1ac5ee"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.38.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "a6d7fab4b64f3eaf7e99327263a909769e7d6b1c08dfecae42244e7a9c37c05a"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.38.0/octops-linux-amd64.tar.gz"
        sha256 "b41099a2ddca985cecb9e2fef875b3c04e52cdb573aeaea4c1ef49ec92a6dec2"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.38.0/octelium-linux-arm64.tar.gz"
      sha256 "1957e4f8a20f1a334f32a919dfc0efac1113999bce1477474a7ea620e3c5fc2c"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.38.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "a896ed4c90ba3a8ee3871fe6b7e4b95e840b4c6ca565c96fc698b2ddfe373b25"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.38.0/octops-linux-arm64.tar.gz"
        sha256 "9c4e41cef44c6eadeb3ca70e58fa02d94da074874fd331a7edbcc0beb3196884"
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