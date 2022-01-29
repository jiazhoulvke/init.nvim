-- Intelligently navigate tmux panes and Vim splits using the same keys. This
-- also supports SSH tunnels where Vim is running on a remote host.
local use = require("packer").use
use "sunaku/tmux-navigate"
