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

## Installation

### Composer/Packagist

`composer [global] require `[`aaronjameslang/proofr`](https://packagist.org/packages/aaronjameslang/proofr)

## Compatibility

Should work on most *nixes, including GNU/Linux, Mac OSX, and [Windows Subsystem for Linux](https://msdn.microsoft.com/en-gb/commandline/wsl/install_guide)

If you are unsure of compatibilty with your system, run `make` or `test.sh`. If your system is incompatible, please open an issue.

## Contribution

Suggestions, bug reports and pull requests are all welcome. Please open an issue and get feedback before beginning a pull request.

### Design Decisions

  - The tests were originally written using `roundup`, however this dependency was dropped to make it easier for users to run the tests on their machines
