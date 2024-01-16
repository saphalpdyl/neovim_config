function ColorMyPencils(color)
    color = color or "catppuccin-mocha"
    vim.cmd.colorscheme(color)
end

function DoNothin()
    vim.api.nvim_set_hl(0 , "Normal" , { bg = "None" })
    vim.api.nvim_set_hl(0 , "NormalFloat" , { bg = "None" })
    vim.api.nvim_set_hl(0 , "NormalNC" , { bg = "None" })
    vim.api.nvim_set_hl(0 , "SignColumn" , { bg = "None" })

    vim.api.nvim_set_hl(0 , "TelescopeNormal" , { bg = "None" })
    vim.api.nvim_set_hl(0 , "TelescopeBorder" , { bg = "None" })
end

ColorMyPencils()

