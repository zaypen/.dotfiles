setupRamDisk() {
    info "Setting up RAM disk..."
    ln -s -f "$(realpath .init-ramdisk)" /usr/local/bin/init-ramdisk
    cat <<-EOF > ~/Library/LaunchAgents/io.github.zaypen.ramdisk.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>io.github.zaypen.ramdisk</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/usr/local/bin/init-ramdisk</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
EOF
    info "Loading RAM disk agent..."
    launchctl load -w ~/Library/LaunchAgents/io.github.zaypen.ramdisk.plist
}
