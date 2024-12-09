import "@typespec/protobuf";

using TypeSpec.Protobuf;

@package({
  name: "resources.v1.resource_service",
  options: {
    go_package: "github.com/tonytheleg/resource-api/api/resources;resources",
    java_multiple_files: true,
    java_package: "api.resources"
  }
})
namespace Resources.V1;

model RhelHost is TypeSpec.Protobuf.Extern<"resources/v1/resource_types.proto", "resources.v1.RhelHost">;
model K8sCluster is TypeSpec.Protobuf.Extern<"resources/v1/resource_types.proto", "resources.v1.K8sCluster">;


model CreateResourceRequest {
  @field(1)
  rhel_host: RhelHost;

  @field(2)
  k8s_cluster: K8sCluster;
}

model CreateResourceResponse {}

model UpdateResourceRequest {
  @field(1)
  rhel_host: RhelHost;

  @field(2)
  k8s_cluster: K8sCluster;
}

model UpdateResourceResponse {}

model DeleteResourceRequest {
  @field(1)
  rhel_host: RhelHost;

  @field(2)
  k8s_cluster: K8sCluster;
}

model DeleteResourceResponse {}

interface KesselResourceService {
 
  CreateResource(request: CreateResourceRequest): CreateResourceResponse;

  UpdateResource(request: UpdateResourceRequest): UpdateResourceResponse;

  DeleteResource(request: DeleteResourceRequest): DeleteResourceResponse;
}
