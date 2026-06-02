class Octelium < Formula
  desc "Octelium CLI suite: octelium, octeliumctl, and octops"
  homepage "https://octelium.com"
  version "0.35.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.35.0/octelium-darwin-amd64.tar.gz"
      sha256 "f2bdb26fa24c9592eee3d33c4e6dac443d87bfe86066ad731b3dedea5b06dc85"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.35.0/octeliumctl-darwin-amd64.tar.gz"
        sha256 "2eec525f918a165e2850d30ac9e7dccfe1cd25aab4e6c8a2a0d20e4b47e7576c"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.35.0/octops-darwin-amd64.tar.gz"
        sha256 "0eeb6459be729bcd4d29385d897ffed0c83b98f155b1711093232c8ae56e8760"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.35.0/octelium-darwin-arm64.tar.gz"
      sha256 "e03808a19a204e76f657fa40b62860a9c2ac9e20eef5bb08cb1c117aee713ba8"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.35.0/octeliumctl-darwin-arm64.tar.gz"
        sha256 "6ab99bbb59e67aa0030f6233cb27f2da88e877f5fca2fd8e02f2eb46165252f3"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.35.0/octops-darwin-arm64.tar.gz"
        sha256 "77154508cb05250f1f41b22dd4ec7cb805d239b79f32fca83ffd949ebced14e6"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/octelium/octelium/releases/download/v0.35.0/octelium-linux-amd64.tar.gz"
      sha256 "bcf55709c49f8972f350ec1c4810c7ccf43550a89ab322c8b10f2153864914e5"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.35.0/octeliumctl-linux-amd64.tar.gz"
        sha256 "d46e57fc5f34c0462a2eb0357fc32329b5f66f15d4edff6dbb694c51c9dd6eac"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.35.0/octops-linux-amd64.tar.gz"
        sha256 "a177bc123889dac8f598cc79a402503d540769087f810b4e60d66a6e869d64c1"
      end
    end

    on_arm do
      url "https://github.com/octelium/octelium/releases/download/v0.35.0/octelium-linux-arm64.tar.gz"
      sha256 "d818eee02513d9190a94cd2195b5df674264d6ad260c38ca64402b95c2ea573f"

      resource "octeliumctl" do
        url "https://github.com/octelium/octelium/releases/download/v0.35.0/octeliumctl-linux-arm64.tar.gz"
        sha256 "8de5cd959ecb50594b92e0cba03c7473aa24b6348ed018ba69a51decb6b86e99"
      end

      resource "octops" do
        url "https://github.com/octelium/octelium/releases/download/v0.35.0/octops-linux-arm64.tar.gz"
        sha256 "1819cc2067e7d9d9a69f93c492b9cc88dfadceb7dbdf77b28aee315b194d5bfe"
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