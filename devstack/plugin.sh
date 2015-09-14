CUMULUS_DIR=${CUMULUS_DIR:-$DEST/altocumulus}

if is_service_enabled q-svc; then
    if [[ "$1" == "source" ]]; then
        # no-op
        :
    elif [[ "$1" == "stack" && "$2" == "install" ]]; then
        echo_summary "Installing Cumulus ML2"
        setup_develop $CUMULUS_DIR

    elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
        # no-op
        :

    elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
        # no-op
        :
    fi

    if [[ "$1" == "unstack" ]]; then
        # no-op
        :
    fi

    if [[ "$1" == "clean" ]]; then
        # no-op
        :
    fi
fi
