class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.46.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.46.0/octelium-darwin-amd64.tar.gz"
      sha256 "8eb6222eff54297e5cbb7c11c2394b962970d07e836ff20461474c3e169e73bb"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.46.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "52d4617046f5ecafb0a5c005a512443dd82e9bd042bb7cc283187129c64642f8"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.46.0/octops-darwin-amd64.tar.gz"
        sha256 "df94139dd5f2ad19555e842985377b793c2f7ab1826a6e97dac6a98c7e3669fe"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.46.0/octelium-darwin-arm64.tar.gz"
      sha256 "9ca52dab986114322edd0b3f9ca200eb274597a8f901311683fdd959b047b67d"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.46.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "90e3fa7984c6a772ab57b9395ea07a2d89f83b187218861ae14ebea79e78e3b6"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.46.0/octops-darwin-arm64.tar.gz"
        sha256 "1a662ec3056f2f5f243e26945aaa360882fca7c69bd881ea094d0d975d21d062"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.46.0/octelium-linux-amd64.tar.gz"
      sha256 "80b7b95ffa41c72e125084921e24b528ca8206a9f3b292269dbebcec5bbe4ebc"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.46.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "969ea935fb79572cf0a15f4c2740267a7a1ab5785815b9adef2083f71410e78c"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.46.0/octops-linux-amd64.tar.gz"
        sha256 "ca128fff1507811c14af44f1ac10b380d7d47e23fa498bc1f96a97d09bdd0ec2"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.46.0/octelium-linux-arm64.tar.gz"
      sha256 "3e96341874002a555aed05ddf592b8594a43d471826992557369545dea004ad5"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.46.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "3f04ff25f3c2d58bbcd9319d082d0d43c7998bd910591d21ef2c39d27e40dd53"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.46.0/octops-linux-arm64.tar.gz"
        sha256 "45d4d308f8b830dd9352170af898b0edf61e6d61f894a0e3d7a4432165ab92b8"
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