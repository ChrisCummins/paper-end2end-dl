#!/usr/bin/env bash
set -eu

usage() {
    echo "usage: $0 [| bash]"
}

main() {
    set +u
    if [[ -n "$1" ]]; then
        usage >&2
        exit 1
    fi
    set -u

    # Ubuntu 16.04
    if python -mplatform | grep -qi Ubuntu ; then
        local ubuntu_version="$(lsb_release -r | sed -r 's/^Release:\s+//')"
        if [[ "$ubuntu_version" != "16.04" ]]; then
            echo "# warning: Ubuntu $ubuntu_version is unsupported"
        fi
    else
        echo '# warning: Unsupported OS detected'
    fi

    # Python 3.6
    if dpkg -s python3.6 &>/dev/null ; then
        echo '# python3.6: installed'
    else
        echo '# install python3.6:'
        echo 'sudo add-apt-repository ppa:jonathonf/python-3.6'
        echo 'sudo apt-get update'
        echo 'sudo apt-get install -y python3.6 python3.6-venv python3.6-dev'
    fi

    # HDF5
    if dpkg -s libhdf5-dev &>/dev/null ; then
        echo '# libhdf5-dev: installed'
    else
        echo '# install libhdf5-dev:'
        echo 'sudo apt-get install -y libhdf5-dev'
    fi
}
main $@
