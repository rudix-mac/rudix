Convenient and transparent local/remote incremental mirror/backup

Rdiff-backup is a script, written in Python, that backs up one directory to another and is intended to be run periodically (nightly from cron for instance). The target directory ends up a copy of the source directory, but extra reverse diffs are stored in the target directory, so you can still recover files lost some time ago. The idea is to combine the best features of a mirror and an incremental backup.

Rdiff-backup can also operate in a bandwidth efficient manner over a pipe, like rsync. Thus you can use rdiff-backup and ssh to securely back a hard drive up to a remote location, and only the differences from the previous backup will be transmitted.

