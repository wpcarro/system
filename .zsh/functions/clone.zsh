function clone() { # URL
  local url="${1}"
  # compute the GOPATH format of the URL of origin
  local gfrp="$( git_gopath_formatted_repo_path "${url}" )"
  # compute the path of the clone
  local clone_path="${GOPATH}/src/${gfrp}"
  # make sure we do not clone an already cloned repo
  if [[ -e "${clone_path}" ]]; then
    print_error 0 "${clone_path} already exists"
    return 1
  fi
  # make sure the directory is avalable
  mkdir -p "$(dirname "${clone_path}")"
  # clone it now
  git clone "${url}" "${clone_path}"
}

