# NAME

**apppauser-daemon** - daemon that launches the users's applications

**apppauser-launch** - utility that creates services for the desired programs

**apppauser-signal** - utility that can control the created services

# SYNOPSIS

**apppauser-daemon**

**apppauser-launch** CMD [...]

**apppauser-signal** SERVICE [COMMAND]

# DESCRIPTION

The AppPauser utilities can launch and send signals to applications that are
launched through them. They make use of the **runsvdir(8)** and **sv(8)**
utilities, which are part of **runit(8)**'s service supervision utilities.

## DAEMON

The **apppauser-daemon** utility will create a monitoring directory that will be
used for service supervision and enable all the functionality used here.

## LAUNCHING APPLICATIONS

The **apppauser-launch** utility is used to launch an arbitrary program by
creating a service for it. It will pass any command line arguments to the
program, as well as its current environment and location. If the *KEEPALIVE*
environment variable is set, this command will only exit when the service exits
as well. This option is useful for launching games from an application like
Steam, for example.

It will set the command as the service's name, unless the *SERVICE* environment
variable is set, in which case it will use its value.

## CONTROLLING APPLICATIONS

The **apppauser-signal** utility is a wrapper around **sv(8)**, and can use the
same **COMMANDS** it does. Its main usefulness comes from the **pause**,
**cont**, **term** and **once** commands. **pause** and **cont** allow you to
pause and resume execution of the service, while **term** allows you to
terminate it. **once** is useful for restarting a service if it has been
launched with **apppauser-launch** already, but is not running for some reason.
If no command is specified, this utility toggles the state of the program
between *running* and *paused*.

# ENVIRONMENT

*XDG_RUNTIME_DIR*: the directory where the supervision directory will be created.

*APPPAUSER*: the name of the supervision directory.

# AUTHOR

Érico Nogueira <ericonr@disroot.org>
