class Pith < Formula
  desc "AI-first input distillation engine and CLI"
  homepage "https://github.com/pith-labs/pith"
  url "https://github.com/pith-labs/pith/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "b3435e376b065bae0ec9a481243897f9e8fd290ef1743eef3f6584d85e72b9db"
  license "MIT"

  head "https://github.com/pith-labs/pith.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/pith-cli")
  end

  test do
    output = shell_output("#{bin}/pith q 'Explain token optimization' --plain")
    assert_match "m:Q", output
  end
end
