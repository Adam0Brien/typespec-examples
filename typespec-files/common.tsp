import "@typespec/protobuf";

using TypeSpec.Protobuf;

@package({
  name: "resources.v1.common",
  options: {
    go_package: "github.com/tonytheleg/resource-api/api/resources;resources",
    java_multiple_files: true,
    java_package: "api.resources"
  }
})
namespace Resources.V1;


model Timestamp is TypeSpec.Protobuf.Extern<"google/protobuf/timestamp.proto", "google.protobuf.Timestamp">;

model Metadata {
  // Unique identifier for the resource.
  @field(3355)
  id: string;

  @field(3400)
  //@options { json_name: "created_at" };
  created_at: Timestamp;

  @field(3401)
 // @jsonName("updated_at")
  updated_at: Timestamp;

  @field(3402)
 // @jsonName("deleted_at")
  deleted_at: Timestamp;
}
