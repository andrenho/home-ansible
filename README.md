# home-network

![Deploy (server)](https://github.com/andrenho/home-ansible/actions/workflows/main.yml/badge.svg)

Manages the network and computers/laptops of my home using ansible.

# Install instructions (PRODUCTION)

1. Create a file `~/.vault_pass.txt` containing the vault password.
1. Review inventory (`ansible/production`)
2. Review variables (`ansible/group_vars`)
  2.1. Encrypted strings can be created with `ansible-vault encrypt_string "MY_PASSWORD" --name index_name
  2.2. Encrypted files can be created with `ansible-vault encrypt MYFILE`
3. Run tests (see below)
4. Make sure all computers are on, with their correct IPs, with python installed and ssh running
5. Run `./ansible.sh`.

# Test running instruction

1. Run `./run_test_vm.sh start DIST` (where DIST is arch or raspberrypi) to start the VM.
  1.1. You'll get a lot of "Remote connection disconnect...", just wait.
  1.2. Type "yes" when it asks to connect.
2. Run `./run_test_vm.sh ansible DIST` to run ansible in that VM.
3. Test the VM.
4. Run `./run_test_vm.sh stop DIST` to destroy the VM.

# Inventory groups

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
