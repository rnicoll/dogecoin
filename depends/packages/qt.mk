PACKAGE=qt
$(package)_version=5.15.2
$(package)_download_path=https://download.qt.io/archive/qt/5.15/$($(package)_version)/submodules
$(package)_suffix=everywhere-src-$($(package)_version).tar.xz
$(package)_file_name=qtbase-$($(package)_suffix)
$(package)_sha256_hash=909fad2591ee367993a75d7e2ea50ad4db332f05e1c38dd7a5a274e156a4e0f8
$(package)_dependencies=openssl zlib
$(package)_linux_dependencies=freetype fontconfig libxcb libX11 xproto libXext
$(package)_build_subdir=qtbase
$(package)_qt_libs=corelib network widgets gui plugins testlib printsupport
$(package)_patches=fix_qt_pkgconfig.patch mac-qmake.conf fix_no_printer.patch no-xlib.patch
$(package)_patches+= fix_android_qmake_conf.patch fix_android_jni_static.patch dont_hardcode_pwd.patch
$(package)_patches+= drop_lrelease_dependency.patch no_sdk_version_check.patch
$(package)_patches+= fix_lib_paths.patch fix_android_pch.patch
$(package)_patches+= qtbase-moc-ignore-gcc-macro.patch fix_limits_header.patch

$(package)_qttranslations_file_name=qttranslations-$($(package)_suffix)
$(package)_qttranslations_sha256_hash=d5788e86257b21d5323f1efd94376a213e091d1e5e03b45a95dd052b5f570db8


$(package)_qttools_file_name=qttools-$($(package)_suffix)
$(package)_qttools_sha256_hash=c189d0ce1ff7c739db9a3ace52ac3e24cb8fd6dbf234e49f075249b38f43c1cc

$(package)_extra_sources  = $($(package)_qttranslations_file_name)
$(package)_extra_sources += $($(package)_qttools_file_name)

define $(package)_set_vars
$(package)_config_opts_release = -release
$(package)_config_opts_debug = -debug
$(package)_config_opts += -bindir $(build_prefix)/bin
$(package)_config_opts += -c++std c++11
$(package)_config_opts += -confirm-license
$(package)_config_opts += -dbus-runtime
$(package)_config_opts += -hostprefix $(build_prefix)
$(package)_config_opts += -no-alsa
$(package)_config_opts += -no-audio-backend
$(package)_config_opts += -no-cups
$(package)_config_opts += -no-egl
$(package)_config_opts += -no-eglfs
$(package)_config_opts += -no-feature-style-windowsmobile
$(package)_config_opts += -no-feature-style-windowsce
$(package)_config_opts += -no-freetype
$(package)_config_opts += -no-gif
$(package)_config_opts += -no-glib
$(package)_config_opts += -no-gstreamer
$(package)_config_opts += -no-icu
$(package)_config_opts += -no-iconv
$(package)_config_opts += -no-kms
$(package)_config_opts += -no-linuxfb
$(package)_config_opts += -no-libudev
$(package)_config_opts += -no-mitshm
$(package)_config_opts += -no-mtdev
$(package)_config_opts += -no-pulseaudio
$(package)_config_opts += -no-openvg
$(package)_config_opts += -no-reduce-relocations
$(package)_config_opts += -no-qml-debug
$(package)_config_opts += -no-sql-db2
$(package)_config_opts += -no-sql-ibase
$(package)_config_opts += -no-sql-oci
$(package)_config_opts += -no-sql-tds
$(package)_config_opts += -no-sql-mysql
$(package)_config_opts += -no-sql-odbc
$(package)_config_opts += -no-sql-psql
$(package)_config_opts += -no-sql-sqlite
$(package)_config_opts += -no-sql-sqlite2
$(package)_config_opts += -no-use-gold-linker
$(package)_config_opts += -no-xinput2
$(package)_config_opts += -no-xrender
$(package)_config_opts += -nomake examples
$(package)_config_opts += -nomake tests
$(package)_config_opts += -opensource
$(package)_config_opts += -openssl-linked
$(package)_config_opts += -optimized-qmake
$(package)_config_opts += -pch
$(package)_config_opts += -pkg-config
$(package)_config_opts += -prefix $(host_prefix)
$(package)_config_opts += -qt-libpng
$(package)_config_opts += -qt-libjpeg
$(package)_config_opts += -qt-pcre
$(package)_config_opts += -system-zlib
$(package)_config_opts += -reduce-exports
$(package)_config_opts += -static
$(package)_config_opts += -silent
$(package)_config_opts += -v

ifneq ($(build_os),darwin)
$(package)_config_opts_darwin = -xplatform macx-clang-linux
$(package)_config_opts_darwin += -device-option MAC_SDK_PATH=$(OSX_SDK)
$(package)_config_opts_darwin += -device-option MAC_SDK_VERSION=$(OSX_SDK_VERSION)
$(package)_config_opts_darwin += -device-option CROSS_COMPILE="$(host)-"
$(package)_config_opts_darwin += -device-option MAC_MIN_VERSION=$(OSX_MIN_VERSION)
$(package)_config_opts_darwin += -device-option MAC_TARGET=$(host)
$(package)_config_opts_darwin += -device-option MAC_LD64_VERSION=$(LD64_VERSION)
endif

$(package)_config_opts_linux  = -qt-xkbcommon
$(package)_config_opts_linux += -qt-xcb
$(package)_config_opts_linux += -system-freetype
$(package)_config_opts_linux += -no-sm
$(package)_config_opts_linux += -fontconfig
$(package)_config_opts_linux += -no-opengl
$(package)_config_opts_arm_linux  = -platform linux-g++ -xplatform $(host)
$(package)_config_opts_i686_linux  = -xplatform linux-g++-32
$(package)_config_opts_mingw32  = -no-opengl -xplatform win32-g++ -device-option CROSS_COMPILE="$(host)-"
$(package)_build_env  = QT_RCC_TEST=1
endef

define $(package)_fetch_cmds
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_download_file),$($(package)_file_name),$($(package)_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qttranslations_file_name),$($(package)_qttranslations_file_name),$($(package)_qttranslations_sha256_hash)) && \
$(call fetch_file,$(package),$($(package)_download_path),$($(package)_qttools_file_name),$($(package)_qttools_file_name),$($(package)_qttools_sha256_hash))
endef

define $(package)_extract_cmds
  mkdir -p $($(package)_extract_dir) && \
  echo "$($(package)_sha256_hash)  $($(package)_source)" > $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qttranslations_sha256_hash)  $($(package)_source_dir)/$($(package)_qttranslations_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  echo "$($(package)_qttools_sha256_hash)  $($(package)_source_dir)/$($(package)_qttools_file_name)" >> $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  $(build_SHA256SUM) -c $($(package)_extract_dir)/.$($(package)_file_name).hash && \
  mkdir qtbase && \
  tar --no-same-owner --strip-components=1 -xf $($(package)_source) -C qtbase && \
  mkdir qttranslations && \
  tar --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qttranslations_file_name) -C qttranslations && \
  mkdir qttools && \
  tar --no-same-owner --strip-components=1 -xf $($(package)_source_dir)/$($(package)_qttools_file_name) -C qttools
endef

# Preprocessing steps work as follows:
#
# 1. Apply our patches to the extracted source. See each patch for more info.
#
# 2. Point to lrelease in qttools/bin/lrelease; otherwise Qt will look for it in
# $(host)/native/bin/lrelease and not find it.
#
# 3. Create a macOS-Clang-Linux mkspec using our mac-qmake.conf.
#
# 4. After making a copy of the mkspec for the linux-arm-gnueabi host, named
# bitcoin-linux-g++, replace instances of linux-arm-gnueabi with $(host). This
# way we can generically support hosts like riscv64-linux-gnu, which Qt doesn't
# ship a mkspec for. See it's usage in config_opts_* above.
#
# 5. Put our C, CXX and LD FLAGS into gcc-base.conf. Only used for non-host builds.
#
# 6. Do similar for the win32-g++ mkspec.
#
# 7. In clang.conf, swap out clang & clang++, for our compiler + flags. See #17466.
#
# 8. Adjust a regex in toolchain.prf, to accommodate Guix's usage of
# CROSS_LIBRARY_PATH. See #15277.
define $(package)_preprocess_cmds
  patch -p1 -i $($(package)_patch_dir)/drop_lrelease_dependency.patch && \
  patch -p1 -i $($(package)_patch_dir)/dont_hardcode_pwd.patch && \
  patch -p1 -i $($(package)_patch_dir)/fix_qt_pkgconfig.patch && \
  patch -p1 -i $($(package)_patch_dir)/fix_no_printer.patch && \
  patch -p1 -i $($(package)_patch_dir)/fix_android_qmake_conf.patch && \
  patch -p1 -i $($(package)_patch_dir)/fix_android_jni_static.patch && \
  patch -p1 -i $($(package)_patch_dir)/fix_android_pch.patch && \
  patch -p1 -i $($(package)_patch_dir)/no-xlib.patch && \
  patch -p1 -i $($(package)_patch_dir)/no_sdk_version_check.patch && \
  patch -p1 -i $($(package)_patch_dir)/fix_lib_paths.patch && \
  patch -p1 -i $($(package)_patch_dir)/qtbase-moc-ignore-gcc-macro.patch && \
  patch -p1 -i $($(package)_patch_dir)/fix_limits_header.patch && \
  sed -i.old "s|updateqm.commands = \$$$$\$$$$LRELEASE|updateqm.commands = $($(package)_extract_dir)/qttools/bin/lrelease|" qttranslations/translations/translations.pro && \
  mkdir -p qtbase/mkspecs/macx-clang-linux &&\
  cp -f qtbase/mkspecs/macx-clang/qplatformdefs.h qtbase/mkspecs/macx-clang-linux/ &&\
  cp -f $($(package)_patch_dir)/mac-qmake.conf qtbase/mkspecs/macx-clang-linux/qmake.conf && \
  cp -r qtbase/mkspecs/linux-arm-gnueabi-g++ qtbase/mkspecs/bitcoin-linux-g++ && \
  sed -i.old "s/arm-linux-gnueabi-/$(host)-/g" qtbase/mkspecs/bitcoin-linux-g++/qmake.conf && \
  echo "!host_build: QMAKE_CFLAGS     += $($(package)_cflags) $($(package)_cppflags)" >> qtbase/mkspecs/common/gcc-base.conf && \
  echo "!host_build: QMAKE_CXXFLAGS   += $($(package)_cxxflags) $($(package)_cppflags)" >> qtbase/mkspecs/common/gcc-base.conf && \
  echo "!host_build: QMAKE_LFLAGS     += $($(package)_ldflags)" >> qtbase/mkspecs/common/gcc-base.conf && \
  sed -i.old "s|QMAKE_CC                = \$$$$\$$$${CROSS_COMPILE}clang|QMAKE_CC                = $($(package)_cc)|" qtbase/mkspecs/common/clang.conf && \
  sed -i.old "s|QMAKE_CXX               = \$$$$\$$$${CROSS_COMPILE}clang++|QMAKE_CXX               = $($(package)_cxx)|" qtbase/mkspecs/common/clang.conf && \
  sed -i.old "s/LIBRARY_PATH/(CROSS_)?\0/g" qtbase/mkspecs/features/toolchain.prf
endef

define $(package)_config_cmds
  export PKG_CONFIG_SYSROOT_DIR=/ && \
  export PKG_CONFIG_LIBDIR=$(host_prefix)/lib/pkgconfig && \
  export PKG_CONFIG_PATH=$(host_prefix)/share/pkgconfig  && \
  cd qtbase && \
  ./configure $($(package)_config_opts) && \
  cd .. && \
  $(MAKE) -C qtbase sub-src-clean && \
  qtbase/bin/qmake -o qttranslations/Makefile qttranslations/qttranslations.pro && \
  qtbase/bin/qmake -o qttranslations/translations/Makefile qttranslations/translations/translations.pro && \
  qtbase/bin/qmake -o qttools/src/linguist/lrelease/Makefile qttools/src/linguist/lrelease/lrelease.pro && \
  qtbase/bin/qmake -o qttools/src/linguist/lupdate/Makefile qttools/src/linguist/lupdate/lupdate.pro && \
  qtbase/bin/qmake -o qttools/src/linguist/lconvert/Makefile qttools/src/linguist/lconvert/lconvert.pro
endef

define $(package)_build_cmds
  $(MAKE) -C qtbase/src $(addprefix sub-,$($(package)_qt_libs)) && \
  $(MAKE) -C qttools/src/linguist/lrelease && \
  $(MAKE) -C qttools/src/linguist/lupdate && \
  $(MAKE) -C qttools/src/linguist/lconvert && \
  $(MAKE) -C qttranslations
endef

define $(package)_stage_cmds
  $(MAKE) -C qtbase/src INSTALL_ROOT=$($(package)_staging_dir) $(addsuffix -install_subtargets,$(addprefix sub-,$($(package)_qt_libs))) && \
  $(MAKE) -C qttools/src/linguist/lrelease INSTALL_ROOT=$($(package)_staging_dir) install_target && \
  $(MAKE) -C qttools/src/linguist/lupdate INSTALL_ROOT=$($(package)_staging_dir) install_target && \
  $(MAKE) -C qttools/src/linguist/lconvert INSTALL_ROOT=$($(package)_staging_dir) install_target && \
  $(MAKE) -C qttranslations INSTALL_ROOT=$($(package)_staging_dir) install_subtargets
endef

define $(package)_postprocess_cmds
  rm -rf native/mkspecs/ native/lib/ lib/cmake/ && \
  rm -f lib/lib*.la lib/*.prl plugins/*/*.prl
endef
