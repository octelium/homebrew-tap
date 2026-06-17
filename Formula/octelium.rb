class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.36.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.36.0/octelium-darwin-amd64.tar.gz"
      sha256 "ea110c76eea65f43fa6aa4154fba8c4d340359e89dbf300cc233aa272ec82f78"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.36.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "9b07dfa9845b3b308e1e96ae554aa5db8d7c92423df1f97f33e45cbd25036981"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.36.0/octops-darwin-amd64.tar.gz"
        sha256 "094536a386c474fade57d5b1463e1b6c5c62b899c4228f93c754b8d013210f1b"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.36.0/octelium-darwin-arm64.tar.gz"
      sha256 "cc502cf69be841bebd9d0ceb63a5183adbf0e7bde1bef01cb8cd240cafbfda05"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.36.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "5ab731e7dfa4b7e3ca5013c5a87323736e6c23de9aa064c8004952f1c682f604"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.36.0/octops-darwin-arm64.tar.gz"
        sha256 "3a197a318dbb0973c1f4f04382837008c41838a1baa570b2144f662b481d860c"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.36.0/octelium-linux-amd64.tar.gz"
      sha256 "91fce0cd7b9c6233de5b875e1216232103b40a97f4f24e78e5f4bade5e823cf6"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.36.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "19c13d09afe9929c565d5dc22e2ba7dc389f2dc21c97ec5c9b0b4a46116b7f65"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.36.0/octops-linux-amd64.tar.gz"
        sha256 "d0646134efd3036d30043c44cefa247846097cb8304631d7c9aa3d3cda77d716"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.36.0/octelium-linux-arm64.tar.gz"
      sha256 "29f8bacf098ea74ec6daa1325073b0fb83b2c5a0a4ebde62cba3784c8f0f54ee"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.36.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "970e2b1fdcba27007df1aa1b06dbb07a0c8c74300311d26e4333fd25e8c232b3"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.36.0/octops-linux-arm64.tar.gz"
        sha256 "d6760439383fa0d4277b20e21061c84a0b1ae29aadd23997cad79c7ac5fff6f3"
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