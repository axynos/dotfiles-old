if !exists('g:loaded_nvim_treesitter')
  echom "Treesitter not loaded"
  finish
endif

lua <<EOF

local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true
})

require'nvim-treesitter.configs'.setup {
  autopairs = { enable = true },
  rainbow = { enable = true },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  ensure_installed = {
    "typescript",
    "tsx",
    "json",
    "html",
    "css",
    "bash",
    "graphql",
    "regex",
    "vim",
    "scss"
  },
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript", "typescript.tsx" }

EOF
