#!/bin/bash -eu
#


# [START gke_emailservice_genproto]

python -m grpc_tools.protoc -I../../protos --python_out=. --grpc_python_out=. ../../protos/demo.proto

# [END gke_emailservice_genproto]