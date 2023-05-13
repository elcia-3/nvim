--lexima
vim.cmd [[
    " C-jで囲みから抜ける
    call lexima#add_rule({'char': '<C-j>', 'at': '\%#)', 'input': '<Right>'})
    call lexima#add_rule({'char': '<C-j>', 'at': '\%#]', 'input': '<Right>'})
    call lexima#add_rule({'char': '<C-j>', 'at': '\%#}', 'input': '<Right>'})
    call lexima#add_rule({'char': '<C-j>', 'at': '\%#>', 'input': '<Right>'})
    call lexima#add_rule({'char': '<C-j>', 'at': '\%#''', 'input': '<Right>'})
    call lexima#add_rule({'char': '<C-j>', 'at': '\%#"', 'input': '<Right>'})
    call lexima#add_rule({'char': '<C-j>', 'at': '\%#`', 'input': '<Right>'})

    " C-jでセミコロンを飛ばす
    call lexima#add_rule({'char': '<C-j>', 'at': '\%#;', 'input': '<Right>'})
]]

--vim-auto-save
--vim.cmd [[
--    let g:auto_save = 1
--    let g:auto_save_in_insert_mode = 0
--]]
