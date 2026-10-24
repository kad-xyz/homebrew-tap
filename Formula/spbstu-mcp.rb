class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.0/spbstu-mcp_v0.13.0_darwin_arm64.tar.gz"
      sha256 "a42af1cbf46eed5d0c00c951ebde730e936b6f0e1c21214c9ffc5a875b80fc2a"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.0/spbstu-mcp_v0.13.0_darwin_amd64.tar.gz"
      sha256 "4f6b133e19bb1d6d7ed760aaf34a8afa802ce837acc965c113b3e87042b0b71a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.0/spbstu-mcp_v0.13.0_linux_arm64.tar.gz"
      sha256 "13e32d7ff194916b5ee868df9ba8b2197d2aa17490ef8ab4303a04479625344d"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.13.0/spbstu-mcp_v0.13.0_linux_amd64.tar.gz"
      sha256 "906d231e394e653f6255f88d93b831f3b5217aa261498db2188b9136e225eabf"
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
