import "@typespec/protobuf";
//import "./resource_types.tsp";

using TypeSpec.Protobuf;

@package({
  name: "resources.v1",
  go_package: "github.com/tonytheleg/resource-api/api/resources;resources",
  java_package: "api.resources",
  java_multiple_files: true,
})
namespace ResourcesV1;

model K8sCluster {
  @field(219571597)
  external_cluster_id: string;

  @field(395858490) 
  kube_version: string;

  @field(395858492)
  cluster_status: ClusterStatus;

  @field(395858494)
  kube_vendor: KubeVendor;

}

  enum ClusterStatus {
    CLUSTER_STATUS_UNSPECIFIED: 0;
    CLUSTER_STATUS_OTHER: 1;
    READY: 2;
    FAILED: 3;
    OFFLINE: 4;
  }

 
  enum KubeVendor {
    KUBE_VENDOR_UNSPECIFIED: 0;
    KUBE_VENDOR_OTHER: 1;
    AKS: 2;
    EKS: 3;
    IKS: 4;
    OPENSHIFT: 5;
    GKE: 6;
  }


/**
 * Represents RHEL host resource data.
 */
model RhelHost {
  @field(219571597)
  host_id: string;

  @field(395858490)
  os_version: string;

  @field(395858490)
  host_status: HostStatus;

}
  enum HostStatus {
    ENABLED: 0;
    DISABLED: 1;
  }



/**
 * Create resource request.
 */
model CreateResourceRequest {
  @field(1)
  rhel_host?: RhelHost;

  @field(2)
  k8s_cluster?: K8sCluster;
}

/**
 * Create resource response.
 */
model CreateResourceResponse {}

/**
 * Update resource request.
 */
model UpdateResourceRequest {
  @field(1)
  rhel_host?: RhelHost;

  @field(2)
  k8s_cluster?: K8sCluster;
}

/**
 * Update resource response.
 */
model UpdateResourceResponse {}

/**
 * Delete resource request.
 */
model DeleteResourceRequest {
  @field(1)
  rhel_host?: RhelHost;

  @field(2)
  k8s_cluster?: K8sCluster;
}

/**
 * Delete resource response.
 */
model DeleteResourceResponse {}

@TypeSpec.Protobuf.service
interface KesselResourceService {
  /**
   * Create a new resource.
   */
  createResource(...CreateResourceRequest): CreateResourceResponse;

  /**
   * Update an existing resource.
   */
  updateResource(...UpdateResourceRequest): UpdateResourceResponse;

  /**
   * Delete a resource.
   */
  deleteResource(...DeleteResourceRequest): DeleteResourceResponse;
}
