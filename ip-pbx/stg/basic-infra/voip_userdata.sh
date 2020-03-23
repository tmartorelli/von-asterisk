#!/bin/bash -x

yum update -y

cat > /etc/systemd/system/asterisk.service << EOF
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

systemctl daemon-reload
systemctl enable asterisk
sed -i -E '/\[general\]/a externip='$(curl http://169.254.169.254/latest/meta-data/public-ipv4) /etc/asterisk/sip.conf
sed -i -E '/externip/a localnet='$(curl http://169.254.169.254/latest/meta-data/local-ipv4) /etc/asterisk/sip.conf
cat >> /etc/asterisk/sip.conf << EOF
[softphone-template](!)
type=friend
context=LocalSets
host=dynamic
nat=force_rport,comedia
dtmfmode=auto
disallow=all
allow=g772
allow=ulaw
allow=alaw

[phone1](softphone-template)
Secret=verysecretpassword

[phone2](softphone-template)
Secret=verysecretpassword
EOF

cat  >> /etc/asterisk/extensions.conf << EOF
[LocalSets]
exten => 101,1,Dial(SIP/phone1)
exten => 102,1,Dial(SIP/phone2)
EOF
systemctl restart asterisk



