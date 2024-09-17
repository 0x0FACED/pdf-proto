PROTOC_GEN_GO := $(shell go env GOPATH)/bin/protoc-gen-go
PROTOC_GEN_GO_GRPC := $(shell go env GOPATH)/bin/protoc-gen-go-grpc

.PHONY: run all clean proto build server client

all: proto build

clean:
	rm -rf pdf_service/gen

proto:
	protoc -I. \
		--plugin=protoc-gen-go=$(PROTOC_GEN_GO) \
		--plugin=protoc-gen-go-grpc=$(PROTOC_GEN_GO_GRPC) \
		--go_out=pdf_service/  \
		--go-grpc_out=pdf_service/  \
		pdf_service/proto/pdf_service.proto