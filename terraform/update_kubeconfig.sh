#!/usr/bin/env bash

set -o pipefail
set -o nounset
set -o errexit

err_report() {
    echo "Exited with error on line $1"
}
trap 'err_report $LINENO' ERR

function print_help {
    echo "usage: $0 <instance(s)> [options]"
    echo "Updates the kubeconfig."
    echo "-h,--help print this help."
    echo "--cluster Specify the cluster name."
}

POSITIONAL=()

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -h|--help)
            print_help
            exit 1
            ;;
        --cluster)
            CLUSTER_NAME=$2
            shift
            shift
            ;;
        *)    # unknown option
            POSITIONAL+=("$1") # save it in an array for later
            shift # past argument
            ;;
    esac
done

CLUSTER_NAME="${CLUSTER_NAME:-}"

if [ -z "$CLUSTER_NAME" ];
    then echo "You must specify a cluster name with --cluster"
    exit 1
fi

aws eks update-kubeconfig --region eu-central-1 --name ${CLUSTER_NAME}

