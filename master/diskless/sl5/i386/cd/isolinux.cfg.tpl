display boot/splash.cfg
default linux
prompt 1
timeout 300
F1 boot/help1.txt
F2 boot/help2.txt
F3 boot/help3.txt
F4 boot/help4.txt
F5 boot/splash.cfg

label linux
kernel boot/vmlinuz
append linux

label smp
kernel boot/vmlinuzs
append smp

label linuxsmp
kernel boot/vmlinuzs
append smp

label failsafe
kernel boot/vmlinuz
append failsafe

label memtest
kernel boot/memtest
