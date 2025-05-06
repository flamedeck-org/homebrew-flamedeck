# Formula/flamedeck-upload.rb
class FlamedeckUpload < Formula
    desc "CLI tool for uploading trace files to Flamedeck"
    homepage "https://github.com/flamedeck-org/flamedeck" 
    version "0.0.1-cli"
    #sha256 "" # We'll add architecture-specific sha256 below
  
    # Define URLs and checksums for different architectures
    on_intel do
        url "https://github.com/flamedeck-org/flamedeck/releases/download/v0.0.1-cli/flamedeck-upload-macos-x64"
        sha256 "a9912a1b7e9eaa62fc2c86a33f626302545251f115870bf160d0925862513b6d"
    end
  
    on_arm do
        url "https://github.com/flamedeck-org/flamedeck/releases/download/v0.0.1-cli/flamedeck-upload-macos-arm64"
        sha256 "7040cbb775922a1e83f47371d8bf4eaeab4fab0e94fc59fce34e3e0b4b8bc4e9"
    end
  
    def install
        # Since the download URL points directly to the binary based on architecture,
        # we just need to install it. The name `cli-rust` might be the actual filename
        # if that's how it's downloaded, adjust if needed.
        # The `bin.install` command moves the downloaded file into Homebrew's bin directory
        # and the `=> "flamedeck-upload"` part renames it to the desired command name.
  
        if Hardware::CPU.intel?
            bin.install "flamedeck-upload-macos-x64" => "flamedeck-upload"
        elsif Hardware::CPU.arm?
            bin.install "flamedeck-upload-macos-arm64" => "flamedeck-upload"
        end
    end
  
    test do
        # Simple test to check if the command runs and shows help or version
        system "#{bin}/flamedeck-upload", "--version"
    end
end