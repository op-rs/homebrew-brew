## Brew Formulae for the Rust Team

Homebrew formulae and casks for various op-rs software.

### How do I install these formulae?

Either install directly using `brew install op-rs/brew/<formula>`, or add the tap first `brew tap op-rs/brew` and then use `brew install <formula>`.

### How do I update the formulae?

1. Open a PR, changing the tag and revision as appropriate (revision should point to the tagged commit)
2. Wait for CI to finish
3. Add the `pr-pull` label, which will do a bunch of housekeeping for you and merge the PR[^1]

[^1]: The PR will be closed
