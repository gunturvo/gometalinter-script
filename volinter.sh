#!/bin/bash
#continue when error
#set +e
#break when error
set -e

GometalinterVariable=(
#    "vetshadow"
#    "vet"
#    "gochecknoglobals"
#    "gochecknoinits"
#    "gofmt"
#    "goimports"
#    "gosimple"
#    "lll"
#    "misspell"
#    "staticcheck"
#    "test"
#    "testify"
#    "unused"
    ##########
    "deadcode"
    "dupl"
    "errcheck"
    "goconst"
    "gocyclo"
    "golint"
    "gosec"
    "gotype"
    "gotypex"
    "ineffassign"
    "interfacer"
    "maligned"
    "megacheck"
    "nakedret"
    "safesql"
    "structcheck"
    "unconvert"
    "unparam"
    "varcheck"
)


Directory=(
    "src/flight"
)

arrayGometalinterVariable=${#GometalinterVariable[@]}
arrayDirectory=${#Directory[@]}

for ((k=0; k<arrayDirectory; k++));
do
    for ((i=0; i<arrayGometalinterVariable; i++));
    do
        echo "Currently linter running in ${Directory[$k]} == ${GometalinterVariable[$i]}"
        gometalinter -j 1 --disable-all --enable="${GometalinterVariable[$i]}" "${Directory[$k]}"/ 2>&1
        sleep 1
        wait
    done
done
