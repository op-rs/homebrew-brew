class kona-node < Formula
desc "OP Stack rollup node built in rust"
  homepage "https://github.com/op-rs/kona"
  url "https://github.com/op-rs/kona.git",
    tag:      "kona-node/v0.1.0-beta.5",
    revision: "8daa1ccf91e745d9df1a997f53bcaa076d2e4e2b"
  license "MIT"
  head "https://github.com/op-rs/kona.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/op-rs/homebrew-brew/releases/download/kona-node-v0.1.0-beta.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8ef1da3261d464fe0c991bdbdee35a12b631105ade6c290ec5d062a2828ae1cd"
    sha256 cellar: :any_skip_relocation, ventura:      "00a16de2b417987813b4cb5f6e78f16c30b086c944aa7c1ec482360c3253b506"
  end

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  def install
    features = []
    features.push("jemalloc") if Hardware::CPU.intel? || OS.mac?

    is_arm_linux = Hardware::CPU.arm? && OS.linux?
    features.push("asm-keccak") unless is_arm_linux

    cd "bin/node" do
      if features.any?
        system "cargo", "install", "--bin", "kona-node", "--profile", "release-perf",
          "--features", features.join(" "), *std_cargo_args
      else
        system "cargo", "install", "--bin", "kona-node", "--profile", "release-perf", *std_cargo_args
      end
    end
  end

  test do
    system "#{bin}/kona-node", "--help"
  end
end
