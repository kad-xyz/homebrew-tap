class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.8.0/spbstu-mcp_v0.8.0_darwin_arm64.tar.gz"
      sha256 "5f4fb1218e4413e0a6ce6bb5be9946823c40b25b4fbc1b3ec80b0b50c50b0a5a"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.8.0/spbstu-mcp_v0.8.0_darwin_amd64.tar.gz"
      sha256 "1282e49162a21cf68601836dcb394c6d929d17e7c372f9b1a9db86134c95b133"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.8.0/spbstu-mcp_v0.8.0_linux_arm64.tar.gz"
      sha256 "01be27a03bee36e1539b72f27d124abf1b57fe552fd58e66c2d10dfc1357bc29"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.8.0/spbstu-mcp_v0.8.0_linux_amd64.tar.gz"
      sha256 "bc0564ddcf5cab7a8daf612c235d3c37096a2063f58f0269ac4297c0b55fcc71"
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
