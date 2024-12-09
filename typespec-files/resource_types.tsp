import "@typespec/protobuf";

using TypeSpec.Protobuf;

@package({
  name: "resources.v1.resource_types",
  options: {
    go_package: "github.com/tonytheleg/resource-api/api/resources;resources",
    java_multiple_files: true,
    java_package: "api.resources"
  }
})
namespace Resources.V1;


model Metadata is TypeSpec.Protobuf.Extern<"resources/v1/common.proto", "resources.v1.Metadata">;
model RhelHostResourceData is TypeSpec.Protobuf.Extern<"resources/v1/resource_data.proto", "resources.v1.RhelHostResourceData">;
model K8sClusterResourceData is TypeSpec.Protobuf.Extern<"resources/v1/resource_data.proto", "resources.v1.K8sClusterResourceData">;


model RhelHost {
  @field(1)
  metadata: Metadata;

  @field(2)
  resource_data: RhelHostResourceData;
}


model K8sCluster {
  @field(1)
  metadata: Metadata;

  @field(2)
  resource_data: K8sClusterResourceData;
}
