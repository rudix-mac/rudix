Library that implements the rsync remote-delta algorithm

Librsync implements the rolling-checksum algorithm of remote file synchronization that was popularized by the rsync utility and is used in rproxy. This algorithm transfers the differences between 2 files without needing both files on the same system.