class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.6.0/spbstu-mcp_v0.6.0_darwin_arm64.tar.gz"
      sha256 "1609a0be5f8f911fca5891ed4938918ae648db3d402243e2715475888914b758"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.6.0/spbstu-mcp_v0.6.0_darwin_amd64.tar.gz"
      sha256 "4df895e433b5bf8df844c7ba5833ba4ca660278924d62f6e3fa333d7c501e527"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.6.0/spbstu-mcp_v0.6.0_linux_arm64.tar.gz"
      sha256 "54e6c5c8543ca52d9370819059189fce04748102c4243c666a6b220e77d210ba"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.6.0/spbstu-mcp_v0.6.0_linux_amd64.tar.gz"
      sha256 "a1ed718d461587c545a7e7a548d8902b708c21a47ceaf058a949435d060f7686"
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
