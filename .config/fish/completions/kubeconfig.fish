complete -c kubeconfig -f -a '(set -l files $HOME/.kube/config.*; string replace -r ".*/config\." "" -- $files)'
