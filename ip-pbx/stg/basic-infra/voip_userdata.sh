#!/bin/bash -x

yum update -y

cat /etc/systemd/system/asterisk.service <<-EOF
[Unit]
Description=Asterisk PBX and telephony daemon
Documentation=man:asterisk(8)
Wants=network.target
After=network.target

[Service]
Type=simple
User=root
Group=root
Environment=HOME=/var/lib/asterisk
WorkingDirectory=/var/lib/asterisk
ExecStart=/usr/sbin/asterisk -f -C /etc/asterisk/asterisk.conf
ExecStop=/usr/sbin/asterisk -rx 'core stop now'
ExecReload=/usr/bin/asterisk -rx 'core reload'

# safe_asterisk emulation
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

systemctl deamon-reload
systemctl enable asterisk
systemctl restart asterisk



