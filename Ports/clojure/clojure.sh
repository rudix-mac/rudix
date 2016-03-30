#!/bin/sh
exec java -cp @LIBDIR@/clojure-@VERSION@/clojure-@VERSION@.jar \
    clojure.main "$@"
