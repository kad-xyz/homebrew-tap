class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.5.0/spbstu-mcp_v0.5.0_darwin_arm64.tar.gz"
      sha256 "402f15b6d0391e97c936e3314ef2d304f30d451ebce17163c0b36168a2b1ea07"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.5.0/spbstu-mcp_v0.5.0_darwin_amd64.tar.gz"
      sha256 "485d5a491e4eda1958c071c498ffa587c0c444f3dd93597b4d4f2052bc94e26e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.5.0/spbstu-mcp_v0.5.0_linux_arm64.tar.gz"
      sha256 "d19eef4b45d4cde8e1002f21b0ea00bb0f465f55b82237693d7b18906dd434f3"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.5.0/spbstu-mcp_v0.5.0_linux_amd64.tar.gz"
      sha256 "f8ddbe1512c16c087ed05b10cd84570c5a623a63a5b4a94ee01eb2ac8c1bfa8c"
    end
  end

  def install
    bin.install "spbstu-mcp"
  end

  def caveats
    <<~EOS
      Store your university login first, then connect the server to Claude:
        security add-generic-password -s spbstu -a LOGIN@edu.spbstu.ru -T /usr/bin/security -w
        claude mcp add spbstu -s user -- #{opt_bin}/spbstu-mcp
      See https://github.com/kad-xyz/spbstu-mcp#quick-start
    EOS
  end

  test do
    assert_match "keychain-service", shell_output("#{bin}/spbstu-mcp -h 2>&1")
  end
end
