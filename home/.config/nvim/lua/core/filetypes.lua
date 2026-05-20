vim.filetype.add({
  extension = {
    ash = "ash",
    dash = "dash",
    gotmpl = "gotmpl",
    mdx = "mdx",
    shtml = "shtml",
    htm = "htm"
  },

  pattern = {
    [".*%.jsx"] = "javascript.jsx",
    [".*%.tsx"] = "typescript.tsx"
  }
})
