# buster-mode

buster-mode is a minor mode for emacs to speed up development when writing tests
with [Buster.js](http://busterjs.org).

A work in progress. You can watch us livecode it on http://emacsrocks.com

## Keybinding

All keybindings in buster-mode start with `C-c C-b` and then a two-letter mnemonic shortcut.

* `td`: toggle-deferred will toggle // in the name of the current test.
* `tf`: toggle-focus-rocket will toggle => in the name of the current test.
* `ra`: run-all-tests

## Development

To fetch the test dependencies:

    $ cd /path/to/buster-mode
    $ git submodule init
    $ git submodule update

Run the tests with:

    $ ./util/ecukes/ecukes features
