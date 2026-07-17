#!/bin/sh

interact() {


}

sync_repos() {

CONTENT_PATH="../contentBlog"
DEST_PATH="./oldsite"

    if [ -d "${CONTENT_PATH}" ]; then

        cp -r "${CONTENT_PATH}/posts/seqart/*"      "${DEST_PATH}/_posts/seqart/"
        cp -r "${CONTENT_PATH}/drafts/seqart/*"     "${DEST_PATH}/_posts/seqart/"
        cp -r "${CONTENT_PATH}/posts/cs/*"          "${DEST_PATH}/_posts/Tech/"
        cp -r "${CONTENT_PATH}/drafts/cs/*"         "${DEST_PATH}/_posts/Tech/"

        # mkdir -p ../deomorxsy.github.io/oldsite/assets/images/posts/
        #cp -r ./assets/images/posts/* ../deomorxsy.github.io/oldsite/assets/images/posts/
        cp -r ./assets/* ../deomorxsy.github.io/oldsite/assets/

        # copy about files
        cp misc/about/images/* ../deomorxsy.github.io/oldsite/assets/about/
        cp misc/about/about.md ../deomorxsy.github.io/oldsite/
        cp misc/linktree/linktree.html ../deomorxsy.github.io/oldsite/_includes/

        # Backup volumes to local host
        docker run --rm \
            -v gembag_builder:/tmp/ \
            -v "${PWD}/oldsite":"/app/oldsite" \
            --entrypoint=/bin/sh \
            debian:12.1 #\
            #sh -c "cd /volume && tar -czf /backup/couchdb.tar.gz ."

    else
        echo "hmm"
    fi


}

isnum() {
    case "$1" in
        ''|*[!0-9]*) return 1 ;;
        *) return 0 ;;
    esac
}

gb_build() {

check_gembag=$(podman images  | grep gembag | awk '{print $1}')

if command -v podman; then

    crtime="$(readlink -f "$(which podman)")"

    elif ! command -v podman; then
        if command -v docker; then
            crtime="$(readlink -f "$(which docker)")"
        fi

    else
        printf "\n|> Could not detect a usable high-level runtime [podman, docker]. Exiting now...\n\n"

        # fallback function
        chamber() {
            echo "$@"
        }

        # variable now holds the function
        crtime=chamber
    fi

    check_gembag_version=$("$crtime" images  | grep gembag | awk '{print $2}')

    # check if the tag is a number
    if isnum "$check_gembag_version"; then
        GEMBAG_VERSION=$(( check_gembag_version + 1 ))
    else
        GEMBAG_VERSION="1"
    fi

    "$crtime" build -t localhost:5000/gembag:"$GEMBAG_VERSION" -f=./Dockerfile && \
    "$crtime" start registry && \
    "$crtime" push localhost:5000/gembag:"$GEMBAG_VERSION"

}


gb_run() {
check_gembag=$(podman images  | grep gembag | awk '{print $1}')
if check_gembag; then

    "$crtime" podman run --rm -it \
        --entrypoint="dumb-init" \
        -p 4000:80 \
        localhost:5000/gembag:04 \
        -- /docker-entrypoint.sh nginx -g 'daemon off;'
else
    builda
# EOF
fi
}


print_usage() {
cat <<-END >&2
USAGE: setup-gembag [-options]
                - build
                - rebuild
                - run
                - help
                - version
eg,
setup-gembag -build     # builds the image with a default tag
setup-gembag -rebuild   # rebuilds the image and increments the tag
setup-gembag -run       # runs the image exposing ports
setup-gembag -help      # prints this help message
setup-gembag -version   # prints the version of the program

See the man page and example file for more info.

END

}


# Check the argument passed from the command line
if [ "$1" = "build" ] || [ "$1" = "-bu" ] || [ "$1" = "--build" ]; then
    gb_build
elif [ "$1" = "run" ] || [ "$1" = "-run" ] || [ "$1" = "--run" ]; then
    gb_run
elif [ "$1" = "help" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    print_usage
elif [ "$1" = "version" ] || [ "$1" = "-v" ] || [ "$1" = "--version" ]; then
    version
else
    printf "\n|> Invalid function name. Please specify one of: [function1, nvim, help]\n\n"
    print_usage
fi



