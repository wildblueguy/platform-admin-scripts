# Wild Blue platform administration scripts 🖥️

*Recipes for various computer system modifications, generally enhancing security/privacy and maximizing platform capabilities*

> [!WARNING]
> The scripts presented herein are pre-release software and are presented as-is.

> [!NOTE]
> These scripts are published as an archive of common modifications and are *not* intended to be an exhaustive/enduring repository of platform techniques.

## Installation

### [Ubuntu scripts](ubuntu/platform-admin/)

#### (Any script with an example configuration)

- In the script's `/config` directory: `cp CONFIG_NAME.example CONFIG_NAME` and customize to your needs
- We try to ignore configurations generated from examples in this repo's `.gitignore`

#### `secure-sudo-dns.sh`

*Secure `sudo`, Netplan DNS, and ResolveD DNS on a fresh system*

- Set `$PLATFORM_ADMIN_DIR` and `$PRIMARY_NETPLAN_PATH` in `secure-sudo-dns.sh`
- Set the value of `mailto` in `/config/etc--sudoers.d--99-overrides`
- (It's assumed MSMTP is installed/configured elsewhere, e.g. by [Phoenix](https://github.com/wildblueguy/phoenix-for-linux-beta))
- (For Netplan DNS, drop-ins are confirmed to work, but the override behavior is insufficient to secure it)
- (The primary Netplan must be wholly replaced)
- Merge the contents of the file at `$PRIMARY_NETPLAN_PATH` into `/config/etc--netplan--PRIMARY.yaml`
- Set your desired nameservers (and override those provided by DHCP) in `/config/etc--netplan--PRIMARY.yaml`
- Set your desired nameservers in `/config/etc--systemd--resolved.conf`
- (A comprehensive set of secure public nameservers are suggested in the examples)
- Run the script, e.g. `. secure-sudo-dns.sh`
- Verify DNS settings with `netplan status` and `resolvectl`

### [Ubuntu scripts](ubuntu/platform-admin/) (to be run as `root`)

### Ubuntu scripts (specific to WSL)

### Windows scripts

## One-liner library

### Ubuntu

- Install Tailscale: `curl -fsSL https://tailscale.com/install.sh | sh`
- Query reverse dependencies of an installed APT package, i.e. what depends on it: `apt-cache rdepends --installed PACKAGE_NAME`

### Ubuntu (as `root`)

- Delete an `iptables` table `filter` rule: `iptables -D CHAIN LINE_NUMBER`
- Exclude incoming traffic on a particular interface from being forwarded (`iptables` firewall, if forwarding enabled in kernel): `iptables -I FORWARD 1 -i INTERFACE_NAME -j DROP`
- View all `iptables` rules, preferring CIDR addressing and showing I/O interfaces and line numbers: `iptables -L -t TABLE_NAME -nv --line-numbers`, where `TABLE_NAME` is `filter`, `nat`, `mangle`, `raw`, or `security`)
- View all `iptables` table `filter` rules: `iptables -L -nv --line-numbers`

### Ubuntu (on WSL)

### Windows

- Add a network route (args: destination subnet, subnet mask, gateway IP): `route add A.B.C.0 MASK 255.255.255.0 E.F.G.H`
- View routes: `route print`

## Manual administration

### Ubuntu

### Ubuntu (as `root`)

#### *Prevent lid switch on laptops from supsending the system*

- `vi /etc/systemd/logind.conf`
- Under `[Login]`, uncomment/add the following:

```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```

### Ubuntu (on WSL)

#### *Set the default user*

- `vi /etc/wsl.conf`
- Add the following:

```
[user]
default=NAME
```

### Windows

---

©2025 Wild Blue Ventures Inc.