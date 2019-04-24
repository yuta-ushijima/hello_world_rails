#!/bin/sh -eu

cat <<EOF >> $HOME/.ssh/config
  User ec2-user
  ForwardAgent yes
EOF

eval $(ssh-agent)
ssh-add

bundle exec cap production deploy

