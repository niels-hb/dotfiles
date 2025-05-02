complete -c kubeconfig -f -a "(string replace -r '.*/config\.' '' -- (ls $HOME/.kube/config.*))"
