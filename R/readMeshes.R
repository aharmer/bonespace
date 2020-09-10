#' Read mesh or landmark files
#'
#' This function reads a set of either mesh files (obj, ply, stl) or landmark files (pts).
#' @param dir a directory containing the fiels to be read.
#' @param type the type of files to be read, either mesh files in *obj*, *ply* or *stl* format, or landmark files in *pts* format.
#' @return A list containing the imported files.
#' @importFrom Rvcg Morpho
#' @export
readMeshes = function(dir, type) {

  if(missing(type)) {
    stop("Please specify the file type, either 'mesh' or 'landmarks'")
  } else {
    if (type == "mesh") {
      files = list.files(dir, full.names = TRUE, pattern = "\\.obj|ply|stl$")
      if(length(files) >= 1) {
        mesh.list = lapply(files, vcgImport)
      } else {
        stop("No mesh files detected")
      }
    }
    if(type == "landmarks") {
      files = list.files(dir, full.names = TRUE, pattern="\\.pts$")
      if(length(files) >= 1) {
        mesh.list = lapply(files, read.pts)
      } else {
        stop("No pts files detected")
      }
    }
  }

  return(mesh.list)
}
