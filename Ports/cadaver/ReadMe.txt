In order to build cadaver, please remove the following packages:

  * expat -- should use the native expat, can't succeed with --with-expat=/usr
  * readline -- should use native libedit instead
  * neon -- should use the one from the sources, maybe it's possible to disable
    the check with configure, but didn't try.

Then install a static version of gettext and build cadaver.

  $ make WITH_STATIC_NLS=1
