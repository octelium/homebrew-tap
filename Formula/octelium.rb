class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.40.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.40.0/octelium-darwin-amd64.tar.gz"
      sha256 "8ec214cb13d1dd28b8ac73bfa1b46f2d1f9756d0a217e5fb685c1ff845634376"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.40.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "6bc7dbe137f87d1f02542f31aa12de993fa96f4de316f736f79f13831309d65a"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.40.0/octops-darwin-amd64.tar.gz"
        sha256 "8528df42e14f1e30daecfdfbafc26f98e468611d93143de465c1f02dbdc16bd7"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.40.0/octelium-darwin-arm64.tar.gz"
      sha256 "e7e7c62dc6a41dfa25da17ff469c11b4781683881fd9bd40212ef9663605a322"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.40.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "882b1aba9387c1b244c882bf0fcc25b05ba775d70a521e870288b8f664a22e7b"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.40.0/octops-darwin-arm64.tar.gz"
        sha256 "1d556ebe65af768ded9b3b2a12cfcf371b03f0f67089e206ebfbb00dfb48ec0c"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.40.0/octelium-linux-amd64.tar.gz"
      sha256 "c29c951dfae11924a5f16e9cf2c11584e96516e437c1ce11f85c0e8df73df91a"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.40.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "e96392f2d1c07df692cf102df33eba7c19222f25a7d8688d4a3cb31d2a1fd438"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.40.0/octops-linux-amd64.tar.gz"
        sha256 "1d91104bc27c9227470925f8fac84fcab66ef4a6c6c89610f6c9e82104e6f9b5"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.40.0/octelium-linux-arm64.tar.gz"
      sha256 "2694a77b758b6607ec025ac08082cce7863be4143ec56271ce5cffd1da46ca8c"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.40.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "7d45e91b8ccd659b4f71b898597738c64a072cab32f130feb8088a25da4a6f80"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.40.0/octops-linux-arm64.tar.gz"
        sha256 "e5d28a1fa095bfa3952c0113bce79383beb6e710c6fc4cf29011e5c71fc86d42"
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