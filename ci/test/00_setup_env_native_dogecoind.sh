#!/usr/bin/env bash
#
# Copyright (c) 2019-2020 The Bitcoin Core developers
# Copyright (c) 2021 The Dogecoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8

export CONTAINER_NAME=ci_native_dogecoind
export DOCKER_NAME_TAG=ubuntu:18.04  # Check that bionic can compile our c++17 and run our functional tests in python3
export PACKAGES="bc python3-zmq"
export DEP_OPTS="NO_QT=1 NO_UPNP=1 DEBUG=1"
export TEST_RUNNER_EXTRA=""
export RUN_UNIT_TESTS_SEQUENTIAL="true"
export RUN_UNIT_TESTS="true"
export GOAL="install"
export BITCOIN_CONFIG="--enable-zmq --enable-glibc-back-compat --enable-reduce-exports CPPFLAGS=-DDEBUG_LOCKORDER"
