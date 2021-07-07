Dogecoin Core 1.21.0
====================

Setup
---------------------
Dogecoin Core is the original Dogecoin client and it builds the backbone of the network. It downloads and, by default, stores the entire history of Dogecoin transactions, which requires a few hundred gigabytes of disk space. Depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

To download Dogecoin Core, visit [Dogecoin Core](https://dogecoin.com/).

Running
---------------------
The following are some helpful notes on how to run Dogecoin Core on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/dogecoin-qt` (GUI) or
- `bin/dogecoind` (headless)

### Windows

Unpack the files into a directory, and then run dogecoin-qt.exe.

### macOS

Drag Dogecoin Core to your applications folder, and then run Dogecoin Core.

### Need Help?

* See the documentation at the [Bitcoin Wiki](https://en.bitcoin.it/wiki/Main_Page)
for help and more information.
* Ask for help on [#dogecoin](http://webchat.freenode.net?channels=dogecoin) on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net?channels=dogecoin).
* Ask for help on the [BitcoinTalk](https://bitcointalk.org/) forums, in the [Dogecoin thread](https://bitcointalk.org/index.php?topic=361813.0).

Building
---------------------
The following are developer notes on how to build Dogecoin Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](dependencies.md)
- [macOS Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [FreeBSD Build Notes](build-freebsd.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [NetBSD Build Notes](build-netbsd.md)
- [Gitian Building Guide (External Link)](https://github.com/bitcoin-core/docs/blob/master/gitian-building.md)

Development
---------------------
The Dogecoin repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Productivity Notes](productivity.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [JSON-RPC Interface](JSON-RPC-interface.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [BitcoinTalk](https://bitcointalk.org/) forums, in the [Dogecoin thread](https://bitcointalk.org/index.php?topic=361813.0).
* Discuss on [#dogecoin-dev](http://webchat.freenode.net/?channels=dogecoin-dev) on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=dogecoin-dev).

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [bitcoin.conf Configuration File](bitcoin-conf.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [Reduce Memory](reduce-memory.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)
- [PSBT support](psbt.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the Bitcoin developers for use in [Dogecoin Core](https://www.bitcoin.org/). 
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
