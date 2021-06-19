#!/usr/bin/env bash
#
# Copyright (c) 2018-2020 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

export LC_ALL=C.UTF-8

if [[ $HOST = *-mingw32 ]]; then
  BEGIN_FOLD wrap-wine
  # Generate all binaries, so that they can be wrapped
  DOCKER_EXEC make $MAKEJOBS -C src/secp256k1 VERBOSE=1
  DOCKER_EXEC make $MAKEJOBS -C src/univalue VERBOSE=1
  DOCKER_EXEC "${BASE_ROOT_DIR}/ci/test/wrap-wine.sh"
  END_FOLD
fi

if [ -n "$QEMU_USER_CMD" ]; then
  BEGIN_FOLD wrap-qemu
  # Generate all binaries, so that they can be wrapped
  DOCKER_EXEC make $MAKEJOBS -C src/secp256k1 VERBOSE=1
  DOCKER_EXEC make $MAKEJOBS -C src/univalue VERBOSE=1
  DOCKER_EXEC "${BASE_ROOT_DIR}/ci/test/wrap-qemu.sh"
  END_FOLD
fi

if [ -n "$USE_VALGRIND" ]; then
  BEGIN_FOLD wrap-valgrind
  DOCKER_EXEC "${BASE_ROOT_DIR}/ci/test/wrap-valgrind.sh"
  END_FOLD
fi

if [ "$RUN_UNIT_TESTS" = "true" ]; then
  BEGIN_FOLD unit-tests
  DOCKER_EXEC ${TEST_RUNNER_ENV} DIR_UNIT_TEST_DATA=${DIR_UNIT_TEST_DATA} LD_LIBRARY_PATH=$DEPENDS_DIR/$HOST/lib make $MAKEJOBS check VERBOSE=1
  END_FOLD
fi

if [ "$RUN_UNIT_TESTS_SEQUENTIAL" = "true" ]; then
  BEGIN_FOLD unit-tests-seq
  DOCKER_EXEC ${TEST_RUNNER_ENV} DIR_UNIT_TEST_DATA=${DIR_UNIT_TEST_DATA} LD_LIBRARY_PATH=$DEPENDS_DIR/$HOST/lib "${BASE_BUILD_DIR}/dogecoin-*/src/test/test_dogecoin*" --catch_system_errors=no -l test_suite
  END_FOLD
fi

if [ "$RUN_FUNCTIONAL_TESTS" = "true" ]; then
  BEGIN_FOLD functional-tests
  DOCKER_EXEC LD_LIBRARY_PATH=$DEPENDS_DIR/$HOST/lib ${TEST_RUNNER_ENV} qa/pull-tester/rpc-tests.py
  END_FOLD
fi
