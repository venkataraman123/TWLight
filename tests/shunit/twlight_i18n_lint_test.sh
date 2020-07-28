#!/usr/bin/env bash

shopt -s expand_aliases

testBadPyNewlines() {
    start=1
    end=6
    for ((i=$start; i<=$end; i++))
    do
        file=${TWLIGHT_HOME}/tests/shunit/data/bad_i18n_newline_$i.py
        assertFalse "${file} should cause an error." "perl ${TWLIGHT_HOME}/bin/twlight_i18n_lint.pl ${file}"
    done
}

testGoodPy() {
    start=1
    end=2
    for ((i=$start; i<=$end; i++))
    do
        file=${TWLIGHT_HOME}/tests/shunit/data/good_i18n_$i.py
        assertTrue "${file} should not cause an error." "perl ${TWLIGHT_HOME}/bin/twlight_i18n_lint.pl ${file}" ||:
    done
}

testBadPyComments() {
    start=1
    end=2
    for ((i=$start; i<=$end; i++))
    do
        file=${TWLIGHT_HOME}/tests/shunit/data/bad_i18n_comment_$i.py
        assertFalse "${file} should cause an error." "perl ${TWLIGHT_HOME}/bin/twlight_i18n_lint.pl ${file}"
    done
}

. ${TWLIGHT_HOME}/tests/shunit/shunit2
