class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.11.0/spbstu-mcp_v0.11.0_darwin_arm64.tar.gz"
      sha256 "4184bf8790af8fc6772b8a2c5d166fbaaa36123bd73c207f239a7ebf57de4c72"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.11.0/spbstu-mcp_v0.11.0_darwin_amd64.tar.gz"
      sha256 "92eb5a3390e6a3e479e4ea20eebb5b41a833c4aafbd68cca2b34b4d8e8aae442"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.11.0/spbstu-mcp_v0.11.0_linux_arm64.tar.gz"
      sha256 "b9ffabd87e0270f678d11e0dad11f6f58cd222cd16517d4d8c55a405204e5377"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.11.0/spbstu-mcp_v0.11.0_linux_amd64.tar.gz"
      sha256 "d6497a1a937da428b06af9d8b3572f42eb26f83d28bc08adcfc155832cdd1e76"
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
