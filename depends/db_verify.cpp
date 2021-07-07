// Copyright (c) 2012-2021 The Dogecoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

// Method to verify Berkeley DB version

#include <bits/stdc++.h>
#include <string>

#include <db.h>

using namespace std;

int main(int argc, char* argv[])
{
    char *p2 = strtok(argv[1], ".");

    while (p2)
    {
        argv[argc++] = p2;
        p2 = strtok(0, " ");
    }

    int version_major = stoi(argv[2]);
    int version_minor = stoi(argv[3]);

    printf("version: %d.%d, and %s.\n", DB_VERSION_MAJOR, DB_VERSION_MINOR, DB_VERSION_STRING);
    string latestVersion = std::to_string(DB_VERSION_MAJOR) + "." + std::to_string(DB_VERSION_MINOR);

    if( version_major != DB_VERSION_MAJOR || version_minor != DB_VERSION_MINOR) {
            printf("Berkeley DB version mismatch\n\texpected: %d.%d\n\tgot: %d.%d\n",
                    version_major, version_minor, DB_VERSION_MAJOR, DB_VERSION_MINOR);
            return 1;
    }
    return 0;
}