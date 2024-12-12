
lan951x-led-ctl is a command line tool to control the LEDs connected to a
LAN9512 or LAN9514 ethernet controller.

Usually those LEDs show the ethernet status like "Link/Activity", "Speed" and
"Duplex" mode. Using this tool you can turn them off, if you don't like
a disco in your room at night ;-) Or you can turn them on/off from any shell
script to show whatever status you wish.

These LAN951x ethernet and USB controllers are used on many embedded computers
like Raspberry Pi (until Version 3B - but not 3B+), Olinuxino and many more.

Further info can be found at:
https://dominic.familie-radermacher.ch/computer/raspberry-pi/lan951x-led-ctl/

The Git repo with the latest version is located at:
https://git.familie-radermacher.ch/linux/lan951x-led-ctl.git


Compile:

    make

    step-by-step:

        sudo apt-get -qq install git libusb-1.0-0-dev  #  will also install: libusb-1.0-doc
        git clone ...
        sudo make --directory lan951x-led-ctl DESTDIR=/usr/local
        rm -rf ./lan951x-led-ctl
        sudo apt-get -qq autoremove --purge libusb-1.0-0-dev


Usage:

    sudo lan951x-led-ctl [--fdx=x][--lnk=x][--spd=x]
        where x is one of:
        0 - turn LED off
        1 - turn LED on


Automate:

    sudo tee /etc/systemd/system/rpi_blinkenlights_set_to_off.service > /dev/null <<- EOF
        [Unit]
        Description=to configure the RPi NIC LEDs to off

        [Service]
        Type=oneshot
        ExecStart=/usr/bin/sleep 15  #  RPi1; can be smaller on RPi2/3
        ExecStart=/usr/local/bin/lan951x-led-ctl  --fdx=0 --lnk=0 --spd=0
        RemainAfterExit=no

        [Install]
        WantedBy=multi-user.target
    EOF

    for an example, see systemd-folder

    sudo --askpass systemctl enable --now --no-block rpi_blinkenlights_set_to_off.service


Source:

    original developer, cmake-version:  https://dominic.familie-radermacher.ch/computer/raspberry-pi/lan951x-led-ctl/
    makefile-version:  https://github.com/dumpsite/lan951x-led-ctl
    general information about RPi-LEDs:  https://github.com/ccrisan/motioneyeos/wiki/Turn-Off-LEDs
    general information about dtparam=pwr_led_trigger-entries in config.txt:  https://github.com/raspberrypi/firmware/issues/1742, esp. https://github.com/raspberrypi/firmware/issues/1742#issuecomment-1225910618
