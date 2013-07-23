# Will fetch and save gihub repositories in your bundle directory
define vim::bundle() {
  $bundle = split($name, '/')
  vcsrepo { "/home/${id}/.vim/bundle/${bundle[1]}":
    ensure   => present,
    provider => git,
    source   => "https://github.com/${$name}.git",
  }
}
