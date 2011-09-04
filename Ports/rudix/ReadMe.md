Rudix Package Manager
=====================

About
-----

The `rudix` utility is a package manager therefore you can install, remove,
print information about packages and search files under the Rudix domain. It is possible to
verify the integrity of installed packages and to fix (repair) packages.

Every package has a unique identification (called package-id) and you may refer to Rudix packages
by using its full package-id or with its alias. For example,
`org.rudix.pkg.ccache` is a `package-id` and `ccache` is an alias for it.

Without any arguments provided, `rudix` prints a list of packages installed.

Usage
-----

    $ rudix -l			# list packages
    $ sudo rudix -i ctags	# install ctags
    $ sudo rudix -r gettext	# remove gettext
    $ rudix -s guile		# search for versions of guile
    $ rudix -S /usr/local/bin/	# list packages which contains /usr/local/bin

See `rudix(1)` manual page entry more information.
