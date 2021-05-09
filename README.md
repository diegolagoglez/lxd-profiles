# LXD Profiles

Set of useful [LXD](https://linuxcontainers.org/lxd/) profiles.

**NOTICE**: Please, remember that some profiles are templates that must be edited before adding them to LXD.

## Profiles

* `autofs.yaml`: Profile to allow autofs tools to work properly.
* `docker.yaml`: Allow to run privileged Docker containers inside LXD.
* `kmem.yaml`: Profile to allow containers to access host's memory (read only).
* `macvlan.yaml`: Profile to add an ethernet interface to containers to get a public IP.
* `proxy.yaml`: Profile to set environment variables to set a Proxy Server.
* `selinux.yaml`: Profile to allow containers to access host's SELinux information.
* `x11-apps.yaml`: Profile to allow containers run X11 applications using host's display. 

## Install

In order to install a profile, run next commands:

```bash
lxc profile create **PROFILE_NAME**
lxc profile edit **PROFILE_NAME** < **PROFILE_FILE**.yaml
```

## Apply

There are two ways assingning profiles to a container:

```bash
lxc profile assign C P1,P2  # assigns P1 and P2 profiles to container C removing other ones
lxc profile add C P  # adds profile P to container C without removing the others
```

## Example output

```bash
user@host ~ $ lxc profile list
+--------------+---------+
|     NAME     | USED BY |
+--------------+---------+
| autofs       | 1       |
+--------------+---------+
| default      | 13      |
+--------------+---------+
| docker       | 0       |
+--------------+---------+
| proxy        | 10      |
+--------------+---------+
| kmem         | 2       |
+--------------+---------+
| macvlan      | 7       |
+--------------+---------+
| x11-apps     | 1       |
+--------------+---------+
user@host ~ $

```

