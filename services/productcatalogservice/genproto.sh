#!/bin/bash -eu
#


# [START gke_productcatalogservice_genproto]

PATH=$PATH:$(go env GOPATH)/bin
protodir=../../protos
outdir=./genproto

protoc --proto_path=$protodir --go_out=./$outdir --go_opt=paths=source_relative --go-grpc_out=./$outdir --go-grpc_opt=paths=source_relative $protodir/demo.proto

# [END gke_productcatalogservice_genproto]