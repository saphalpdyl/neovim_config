local lsp = require('lsp-zero').preset({
	name = "minimal" , 
	set_lsp_keymaps = true , 
	manage_nvim_cmp = true , 
	suggest_lsp_servers = false,
})

lsp.ensure_installed({
  'tsserver' , 
  'rust_analyzer' ,
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] =  cmp.mapping.select_prev_item(cmp_select) ,
  ['<C-n>'] =  cmp.mapping.select_next_item(cmp_select) ,
  ['<C-n>'] = cmp.mapping.complete() 
})

lsp.on_attach(function(client , bufnr)

  local opts = { buffer = bufnr , remap = false }

  vim.keymap.set('n' , 'gd' , function() vim.lsp.buf.definition() end , opts)
  vim.keymap.set('n' , 'K' , function() vim.lsp.buf.hover() end , opts)
  vim.keymap.set('i' , '<C-h>' , function() vim.lsp.buf.signature_help() end , opts)

end)

lsp.setup() -- Setup Start
