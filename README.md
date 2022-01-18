# home-network
Manages the network and computers/laptops of my home using ansible.


# Computer profiles
- Server: installs a home server. Configures DNS and several other services. Requires a second disk for data (roles: base, server)
- User: installs and configure a user-friendly operating system, with game support and development tools (roles: base, user, games, developer)
- Terminal: install just enough to connect and use a remote machine, or a web browser (roles: base, terminal)
- Programmer: install tools to develop and program ICs from a Pi Zero (roles: base, programmer)
- RetroGaming: installs a bunch of emulators and games, to run directly on TV (roles: base, games, retro-init)
