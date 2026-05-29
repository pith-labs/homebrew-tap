class Pith < Formula
  desc "AI-first input distillation engine and CLI"
  homepage "https://github.com/pith-labs/pith"
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
