#!/bin/sh

chmod +x ./scripts/setup-gembag.sh
./scripts/setup-gembag.sh -run &

JE_BUILDER=$(podman ps -a | grep gembag | awk '{print $3}')


podman exec "$JE_BUILDER"

if [ -d "../deomorxsy.github.io/" ]; then
    printf "\n|> Blog directory found. Starting file synchronization...\n\n"

# mind that this only tests it locally, not the CI.
podman cp -r ./posts/seqart/* ../deomorxsy.github.io/oldsite/_posts/seqart/;
podman cp -r ./drafts/seqart/* ../deomorxsy.github.io/oldsite/_posts/seqart/;

podman cp -r ./posts/cs/* ../deomorxsy.github.io/oldsite/_posts/Tech/;
podman cp -r ./drafts/cs/* ../deomorxsy.github.io/oldsite/_posts/Tech/;

mkdir -p ../deomorxsy.github.io/oldsite/assets/images/posts/;
#cp -r ./assets/images/posts/* ../deomorxsy.github.io/oldsite/assets/images/posts/;
cp -r ./assets/* ../deomorxsy.github.io/oldsite/assets/;

# copy about files
cp misc/about/images/* ../deomorxsy.github.io/oldsite/assets/about/;
cp misc/about/about.md ../deomorxsy.github.io/oldsite/;
cp misc/linktree/linktree.html ../deomorxsy.github.io/oldsite/_includes/;

else
    printf "\n\n|> Blog directory was NOT found. Exiting now...\n"
fi

