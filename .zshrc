export PATH="/Users/foxnne/.bin:$PATH"
export PATH="/opt/homebrew/opt/anyzig/bin:$PATH"
# export PATH="/Users/foxnne/Library/Application Support/Cursor/User/globalStorage/ziglang.vscode-zig/zig/aarch64-macos-0.16.0:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/foxnne/.bun/_bun" ] && source "/Users/foxnne/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
