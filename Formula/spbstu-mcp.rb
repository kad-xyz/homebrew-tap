class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.2.0/spbstu-mcp_v0.2.0_darwin_arm64.tar.gz"
      sha256 "9c5d818ca754319c15662fd4e6ae7363825d8e3ac0702c154fc8fcec7abfebc7"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.2.0/spbstu-mcp_v0.2.0_darwin_amd64.tar.gz"
      sha256 "50a2e8bef94fb3162493862379e90b410d6ce48d13e632b56bd813af29d5fbc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.2.0/spbstu-mcp_v0.2.0_linux_arm64.tar.gz"
      sha256 "4de057db3f3d170049195ae6113fcac42e8aca3e2b628975ed79463e1d3913c5"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.2.0/spbstu-mcp_v0.2.0_linux_amd64.tar.gz"
      sha256 "ec8968f3b6ba645ef3645941e9c547d6ecf2afac49ac7ecbab877086a1d74e4a"
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
