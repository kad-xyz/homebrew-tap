class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.4.0/spbstu-mcp_v0.4.0_darwin_arm64.tar.gz"
      sha256 "5f620bdc4a3daa319ac0729aab9723268b9fdf3110163fdb198055b3e5e8e25a"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.4.0/spbstu-mcp_v0.4.0_darwin_amd64.tar.gz"
      sha256 "df10b4ba1be0db623be1d2156237001d338a8c91c509ba6976fb4e12addee5d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.4.0/spbstu-mcp_v0.4.0_linux_arm64.tar.gz"
      sha256 "ecf572e9191a1595e5bef208be45165d2351d48c4e105347e691faf91a3d6b01"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.4.0/spbstu-mcp_v0.4.0_linux_amd64.tar.gz"
      sha256 "30ba6145a2f77c7c040dd41b83147fb7a2490c10d3f63fa629ec026f683acb95"
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
