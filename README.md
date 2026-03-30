# checker-workspace

Local workspace for developing and testing:

- [Checker Framework](./checker-framework)
- [JDK](./jdk)
- [Randoop](./randoop)

This repository tracks those projects as git submodules and provides a
`devenv` setup for building them together.

## Repository layout

- `checker-framework/`: local Checker Framework checkout
- `jdk/`: local JDK checkout
- `randoop/`: local Randoop checkout
- `devenv.nix`: development environment and helper scripts
- `devenv.yaml`: `devenv` input configuration

## Getting started

Clone with submodules:

```bash
git clone --recurse-submodules https://github.com/taooceros/checker-workspace.git
cd checker-workspace
```

If you already cloned the repo:

```bash
git submodule update --init --recursive
```

Enter the development shell:

```bash
devenv shell
```

The shell config enables:

- Java with JDK 21
- Gradle
- `CHECKERFRAMEWORK` pointing at the local `checker-framework/` checkout

## Helper scripts

Inside `devenv shell`, these commands are available:

```bash
build-checker-framework
build-randoop
```

Default behavior:

- `build-checker-framework` runs `assemble`
- `build-randoop` runs `assemble` with `-PcfVersion=local`

You can also pass a Gradle task explicitly:

```bash
build-checker-framework test
build-randoop test
```

## Notes

- Local `devenv` and `direnv` artifacts are ignored by git.
- Submodule revisions are recorded in this repository, but each project is
  developed in its own checkout directory.
