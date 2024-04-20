-- Ansible filetype detection and syntax highlighting
return {
  "pearofducks/ansible-vim",
  event = { "BufReadPre", "BufNewFile" }
}
