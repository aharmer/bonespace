

readMeshes = function(dir, type) {
  if(type == "mesh" | type == "landmarks") {
    if (type == "mesh") {
      files = list.files(dir, full.names = TRUE, pattern = "\\.obj|ply|stl$")
      mesh.list = lapply(files, vcgImport)
    } else {
      files = list.files(dir, full.names = TRUE, pattern="\\.pts$")
      mesh.list = lapply(files, read.pts)
    }
  }
  else {
    stop("Please specify the file type, either 'mesh' or 'landmarks'")
  }
  return(mesh.list)
}



x = readMeshes(dir, "landmarks")
