#' Export a list of mesh files
#'
#' This function exports a set of mesh files (obj, ply, stl).
#' @param mesh.list
#' @param dir a directory where files are to be saved.
#' @param type the type of  mesh files to write, either *obj*, *ply* or *stl* format.
#' @importFrom Rvcg
#' @export
saveMeshes = function(mesh.list, dir, type) {

  if(missing(type)) {
    stop("Please specify the file type, either obj, ply or stl")
  } else {
    if(type == "obj") {
      lapply(mesh.list, function(x, dir) {

      })
    }
  }

}
