#!/bin/sh


# generate ssh keypair
SSH_PK_PATH="$HOME/.ssh"

if ! [ -f "$SSH_PK_PATH" ]; then
#mkdir -p "$HOME"/.ssh/
ssh-keygen -t ed25519 \
    -C "actions workflow ssh-agent deploy" \
    -f "$SSH_PK_PATH"/blog_pk \
    -N ''
else
    echo "|> A previous SSH keypair exists at the path. Either review or delete to continue."
fi

