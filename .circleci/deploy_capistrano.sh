#!/bin/sh -eu

ssh-agent -s >> $HOME/.ssh_agent_conf
            source $HOME/.ssh_agent_conf
            chmod -R 700 ${HOME}
            for _k in $(ls ${HOME}/.ssh/id*); do
              ssh-add ${_k} || true
            done
cat <<EOF >> $HOME/.ssh/config
  User ec2-user
  ForwardAgent yes
EOF

#eval $(ssh-agent)
#ssh-add

gem install bundler -v 2.0.1
bundle install
bundle exec cap production deploy
