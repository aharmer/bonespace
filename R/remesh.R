library(rgl)
library(Rvcg)

hum = vcgImport("/Users/aharmer/Downloads/hum.obj", updateNormals = TRUE, readcolor = FALSE, clean = TRUE, silent = FALSE)
hum_inst = vcgImport("/Users/aharmer/Downloads/hum_inst.obj", updateNormals = TRUE, readcolor = FALSE, clean = TRUE, silent = FALSE)

remesh = function(mesh, scale) {
  edge.length = as.numeric(vcgMeshres(mesh)[1])
  new.mesh = vcgUniformRemesh(mesh, voxelSize = edge.length*(1/sqrt(scale)), multiSample = TRUE)
  smooth.mesh = vcgSmooth(new.mesh, type = "surfPreserveLaplace", iteration = 1, delta = 0.3)
  return(smooth.mesh)
}


a = remesh(hum, 0.01)
meshInfo(a)
open3d() + wire3d(a, color = "lightblue")


vcgObjWrite(hum, "~/Downloads/humerus.obj")
vcgPlyWrite(hum, "~/Downloads/humerus.ply")
