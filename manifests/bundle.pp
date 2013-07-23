# Will fetch and save gihub repositories in your bundle directory
define vim::bundle() {
  $bundle = split($name, '/')
  repository { "/home/${id}/.vim/bundle/${bundle[1]}":
    source  => $name,
  }
}
