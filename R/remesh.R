#' Remesh and decimate mesh objects
#'
#' This function remeshes a list of mesh3d objects and decimates the number of vertices if required.
#' @param mesh.list a list of mesh3d objects.
#' @param scale the relative scale (only approximate) of remeshed objects. Values less than one have reduced number of vertices relative to original mesh.
#' @return A list containing the uniform remeshed (and decimated) objects.
#' @importFrom Rvcg rgl
#' @export
remesh = function(mesh.list, scale) {
  rem = lapply(mesh.list, function(mesh, scale){
    edge.length = as.numeric(vcgMeshres(mesh)[1])
    new.mesh = vcgUniformRemesh(mesh, voxelSize = edge.length*(1/sqrt(scale)), multiSample = TRUE)
    smooth.mesh = vcgSmooth(new.mesh, type = "surfPreserveLaplace", iteration = 1, delta = 0.3)
  }, scale)
  return(rem)
}
