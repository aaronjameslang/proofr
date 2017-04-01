# git-hook-commit-message-cbeams [![Build Status](https://travis-ci.org/aaronjameslang/git-hook-commit-message-cbeams.svg)](https://travis-ci.org/aaronjameslang/git-hook-commit-message-cbeams)
Git hook to check conformance to http://chris.beams.io/posts/git-commit/

## The seven rules of a great git commit message

 1. Separate subject from body with a blank line
 2. Limit the subject line to 50 characters
 3. Capitalize the subject line
 4. Do not end the subject line with a period
 5. Use the imperative mood in the subject line
 6. Wrap the body at 72 characters
 7. Use the body to explain _what_ and _why_ vs. _how_

## Compatibility

Please contribute by testing on your platform if it's not listed below!

### Confirmed :thumbsup:

  - Mac OSX, travis CI
  - Debian, travis CI

### Unsupported :no_entry_sign:

  - Windows

### Unknown :grey_question:

  - Other *nixes, *BSDs, etc.

## Contribution

If you don't see your platform in the compatibility list above, please run the tests and let us know how you get on.

### Design Decisions

  - The tests were originally written using `roundup`, however this dependency was dropped to make it easier for users to run the tests on their machines
