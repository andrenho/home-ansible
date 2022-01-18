# home-network
Manages the network and computers/laptops of my home using ansible.

# Computer roles

- Base: base system (gcc / network tools / X / browser), dotfiles, configure SSH keys
- Server: installs homeserver and initialize at startup. Restore backup optional. Requres second disk.
- Workstation: X, office, all the goodies
- Developer: all development tools
- Terminal: install terminal tools (mosh, vnc, etc)
- Programmer: avr-gcc, avrdude, some basic dev tools, logic
- Games: EmulationStatus, several emulators, USB gamepad support, native games, steam. Restore ROMs from backup (?). Maybe initialize ES on startup.

# Computer profiles
- Server: installs a home server. Configures DNS and several other services. Requires a second disk for data (roles: base, server)
- User: installs and configure a user-friendly operating system, with game support and development tools (roles: base, workstation, games, developer)
- Terminal: install just enough to connect and use a remote machine, or a web browser (roles: base, terminal)
- Programmer: install tools to develop and program ICs from a Pi Zero (roles: base, programmer)
- RetroGaming: installs a bunch of emulators and games, to run directly on TV (roles: base, games)
