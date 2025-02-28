local function config()
  local lspconfig = require("lspconfig")

  -- Configure servers
  lspconfig.gopls.setup {
  }

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
      -- Mappings
      local bufmap = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { silent = true, noremap = true, buffer = args.buf })
      end

      bufmap('n', '<leader>ld', vim.lsp.buf.definition)
      bufmap('n', '<leader>lD', vim.lsp.buf.declaration)
      bufmap('n', '<leader>lr', vim.lsp.buf.references)
      bufmap('n', '<leader>lt', vim.lsp.buf.type_definition)
      bufmap('n', '<leader>ls', vim.lsp.buf.signature_help)
      bufmap('i', '<c-s>', vim.lsp.buf.signature_help)

      bufmap("n", "<leader>lf", vim.lsp.buf.format)
      bufmap('n', '<leader>ln', vim.lsp.buf.rename)
      bufmap('n', '<leader>lc', vim.lsp.buf.code_action)

      bufmap('n', 'K', vim.lsp.buf.hover)
    end
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
}
