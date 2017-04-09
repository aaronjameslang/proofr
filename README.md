# proofr [![Build Status](https://travis-ci.org/aaronjameslang/proofr.svg)](https://travis-ci.org/aaronjameslang/proofr)
Git hook to check conformance to http://chris.beams.io/posts/git-commit/

## The seven rules of a great git commit message

 1. Separate subject from body with a blank line
 2. Limit the subject line to 50 characters
 3. Capitalize the subject line
 4. Do not end the subject line with a period
 5. Use the imperative mood in the subject line
 6. Wrap the body at 72 characters
 7. Use the body to explain _what_ and _why_ vs. _how_

## What `proofr` does

If you write a good commit message, you won't even know it's there.

If you write a poor commit message, the commit will fail and you'll receive feedback:

```
$: git commit --allow-empty --message 'fixed it.'
Capitalize the subject line
Do not end the subject line with a period
Use the imperative mood in the subject line
$:
```

## Installation

### [Homebrew](https://brew.sh/)/[Linuxbrew](http://linuxbrew.sh/)

`brew install `[`aaronjameslang/tap/proofr`](https://github.com/aaronjameslang/homebrew-tap/blob/master/Formula/proofr.rb)

### [Composer](https://getcomposer.org/)/[Packagist](https://packagist.org/packages/aaronjameslang/proofr)

`composer [global] require `[`aaronjameslang/proofr`](https://packagist.org/packages/aaronjameslang/proofr)

## Setup

`cd my-project && proofr setup`

This will add `proofr` to the `commit-msg` of your project. For background see http://githooks.com

## Compatibility

Should work on most *nixes, including GNU/Linux, Mac OSX, and [Windows Subsystem for Linux](https://msdn.microsoft.com/en-gb/commandline/wsl/install_guide)

If you are unsure of compatibilty with your system, run `make` or `test.sh`. If your system is incompatible, please open an issue.

## Contribution

Suggestions, bug reports and pull requests are all welcome. Please open an issue and get feedback before beginning a pull request.

### Design Decisions

  - The tests were originally written using `roundup`, however this dependency was dropped to make it easier for users to run the tests on their machines
