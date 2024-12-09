import "@typespec/protobuf";
using TypeSpec.Protobuf;
@package({
  name: "resources.v1.resource_data",
  go_package: "github.com/tonytheleg/resource-api/api/resources;resources",
  java_package: "api.resources",
  java_multiple_files: true,
})
namespace ResourcesV1;

model K8sClusterResourceData {
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

model RhelHostResourceData {
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
