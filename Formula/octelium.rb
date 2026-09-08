class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.42.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.42.0/octelium-darwin-amd64.tar.gz"
      sha256 "5032d3fc08612170868ca4e8f040c8789fc6c075a2d8a73f7095acd1e7520d52"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.42.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "014ffa346cabc280ac2e35923ad983a3059bc71c920cb0cf63882315bfceb720"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.42.0/octops-darwin-amd64.tar.gz"
        sha256 "e8a69e03075bedbddcb121f0a479a08b0e37f85bf59c0da9851172967baf776f"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.42.0/octelium-darwin-arm64.tar.gz"
      sha256 "8457e59a4f857368968034a761ab1ff3449ca35107996c298f4366cbeb266edd"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.42.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "31aef9652aa68319256f44d2dc76410dda39f3ff4e40cdbfb105133cd7fafeef"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.42.0/octops-darwin-arm64.tar.gz"
        sha256 "66372c6fcf2fda98a472285480f87548be49e9be5d59c67e26b726481b090f53"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.42.0/octelium-linux-amd64.tar.gz"
      sha256 "90c210490d1b54fad555f5998f3d2a847a0b675f7a4e6891c58417d271168cf0"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.42.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "b903b5347bc7620edab8acb199d08cb1328af7f8ecc777b9b21eb12906a5511a"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.42.0/octops-linux-amd64.tar.gz"
        sha256 "15a702adfe48eaa258b87da3341a810e70c3e18339897d2d8c551192a078a8e0"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.42.0/octelium-linux-arm64.tar.gz"
      sha256 "06b1c193f40e64adf5a0c672a9203eaefc8f950ac07e715311092e904ca281ab"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.42.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "2f2d552cec59ca1d7d5588c8c68f7f7369e9e506e5eb53d262cac0829b24cf5b"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.42.0/octops-linux-arm64.tar.gz"
        sha256 "6904838de4f4d2b84e0c8344cedffb38188cf8a43678d3cc4dede7203cfb4dac"
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