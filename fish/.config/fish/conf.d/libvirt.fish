if test (uname) != Darwin; and type -q virsh
    set -gx LIBVIRT_DEFAULT_URI qemu:///system
end
