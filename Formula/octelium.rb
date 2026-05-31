class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.34.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.34.0/octelium-darwin-amd64.tar.gz"
      sha256 "353798ec3778650c76fcb41f27e72d71e9626d266a29540110629a3647fc0d3f"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.34.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "2995b26b0941f5f3c1040b8fa9b700e94fbf50d13079ab6ed87a48abeaa54753"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.34.0/octops-darwin-amd64.tar.gz"
        sha256 "10e873f5e41231fc8c34c9c0829eeb4b3632bb077cd4b95b5bf264cabf6fa132"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.34.0/octelium-darwin-arm64.tar.gz"
      sha256 "aef723369edbe326787df8ade2bea82ab5b86ee774fb5381b14defac63d27979"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.34.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "45ac47aeb24d6b4369a3ba8e65c40129367a83eba2f23046dee873260ad7b80f"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.34.0/octops-darwin-arm64.tar.gz"
        sha256 "383ad2cda566132818228252da2ad850e465f9cf1388d1b080da007fd35a1b8a"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.34.0/octelium-linux-amd64.tar.gz"
      sha256 "63e7de1cd88a61f85c3017f502c0a2ed160ba7587366f8f4b6fa3ec0a4c5f275"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.34.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "587df3c4b6e583eab6dbe8e48191e405f00d7e7ced1e682df4340f8127f509c1"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.34.0/octops-linux-amd64.tar.gz"
        sha256 "81f64d1c88522cabe6680dd70ab51c9a77b3656093eb9d65ba048f3eb7d4ae7f"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.34.0/octelium-linux-arm64.tar.gz"
      sha256 "d375dd187985636efb5ad5afb54b743897c42e1cac57d2bc7923b0c078aeee48"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.34.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "529ae5b236c5a67df0b104b4cf2e1efff2d9a17223a7b0c0bdc7eba35e60684c"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.34.0/octops-linux-arm64.tar.gz"
        sha256 "89b1375c24e445367ecf219142f525f66717964dee0ef5f1bf3dbc578044a4d6"
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