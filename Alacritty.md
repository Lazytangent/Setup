# Building Alacritty for M1

Because the Homebrew version of Alacritty is still the Intel version, we have to
build Alacritty on an M1 to have Alacritty run in Arm by default.

To do so, start by cloning the alacritty repository:

```sh
git clone git@github.com:alacritty/alacritty.git
```

Then, `cd` into the local repo.

```sh
cd alacritty
```

Now, make sure that `rustup` is up to date:

```sh
rustup override set stable
rustup update stable
```

Then, run the command to make the app:

```sh
make app
```

You can then find the newly built application in `./target/release/osx`. Be sure
to do a quick check of the application to make sure that it isn't an Intel-based
one.

Remove the existing version, if any.

```sh
rm -r /Applications/Alacritty.app
```

If it all looks good, you can copy that version of Alacritty to your
Applications folder.

```sh
cp -r target/release/osx/Alacritty.app /Applications/
```

## Updating this version of Alacritty

Since we've built it ourselves, we'll also need to manage updating the
application as time passes. This just means:

1. Pull down whatever changes whenever an update is released, or whenever the
   repo has updated.
2. Make sure that `rustup` is up to date
3. Clean out the old version of the build
4. Make a new version with the new code
5. Check it first
6. Copy it into Applications

## Post Build

### Terminfo

If the following command doesn't error out, then the terminfo for Alacritty is
already installed.

```sh
infocmp alacritty
```

If it hasn't been installed yet, then install it globally with the following
command:

```sh
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
```

### Manual Page

```sh
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
```
