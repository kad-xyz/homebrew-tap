class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.2/spbstu-mcp_v0.13.2_darwin_arm64.tar.gz"
      sha256 "413329ba8ed0e4cf6c798792597315dc91144052a084e657f3bd3d43ca2b3d83"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.2/spbstu-mcp_v0.13.2_darwin_amd64.tar.gz"
      sha256 "dbbcef72180d1c404e1664f485093c61950d9697e7fc815bf128693ce5d5308c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.2/spbstu-mcp_v0.13.2_linux_arm64.tar.gz"
      sha256 "7b54cb13985f38f32436e727bbbe95d0369b659a51bea8f4d92a6bfaeb765dc7"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.2/spbstu-mcp_v0.13.2_linux_amd64.tar.gz"
      sha256 "df09003c75d8362ff9ac261c9bf3fc8fb87d7f19744a88ae9660bc0943724e01"
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
