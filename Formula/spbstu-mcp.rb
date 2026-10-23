class SpbstuMcp < Formula
  desc "MCP server for SPbPU students: dl.spbstu.ru, university mail, openedu.ru, timetable"
  homepage "https://github.com/kad-xyz/spbstu-mcp"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.12.0/spbstu-mcp_v0.12.0_darwin_arm64.tar.gz"
      sha256 "29662e7c4bd140e516617551db3c8fb665ac599e226ae534097e075a35c171bf"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.12.0/spbstu-mcp_v0.12.0_darwin_amd64.tar.gz"
      sha256 "9679c678283f0630701dfdf3c8e94f7e6007b6a1b21bebc34eddda71cffa533b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.12.0/spbstu-mcp_v0.12.0_linux_arm64.tar.gz"
      sha256 "db7fd15cf05a604b416e7b35fbdac64a6b95ede852e409766c818aa40e9ea67e"
    end
    on_intel do
      url "https://github.com/kad-xyz/spbstu-mcp/releases/download/v0.12.0/spbstu-mcp_v0.12.0_linux_amd64.tar.gz"
      sha256 "8fdcb0b1e5cfacae11a431e6d344777837153147de195488cb252b7437d70bd8"
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
