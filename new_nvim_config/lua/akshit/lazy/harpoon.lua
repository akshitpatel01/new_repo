return {
    'ThePrimeagen/harpoon',

    config = function ()
        require("telescope").load_extension('harpoon')
        vim.keymap.set('n', '<leader>m', [[:lua require("harpoon.mark").add_file()<cr>]], {})
        vim.keymap.set('n', '<leader>t', [[:lua require("harpoon.ui").toggle_quick_menu()<cr>]], {})
        vim.keymap.set('n', '<leader>1', [[:lua require("harpoon.ui").nav_file(1)<cr>]], {})
        vim.keymap.set('n', '<leader>2', [[:lua require("harpoon.ui").nav_file(2)<cr>]], {})
        vim.keymap.set('n', '<leader>3', [[:lua require("harpoon.ui").nav_file(3)<cr>]], {})
        vim.keymap.set('n', '<leader>4', [[:lua require("harpoon.ui").nav_file(4)<cr>]], {})
        vim.keymap.set('n', '<leader>5', [[:lua require("harpoon.ui").nav_file(5)<cr>]], {})
        vim.keymap.set('n', '<leader>6', [[:lua require("harpoon.ui").nav_file(6)<cr>]], {})
        vim.keymap.set('n', '<leader>7', [[:lua require("harpoon.ui").nav_file(7)<cr>]], {})
        vim.keymap.set('n', '<leader>8', [[:lua require("harpoon.ui").nav_file(8)<cr>]], {})
        vim.keymap.set('n', '<leader>9', [[:lua require("harpoon.ui").nav_file(9)<cr>]], {})
        vim.keymap.set('n', '<C-n>', [[:lua require("harpoon.ui").nav_next()<cr>]], {})
        vim.keymap.set('n', '<C-p>', [[:lua require("harpoon.ui").nav_next()<cr>]], {})
        require("harpoon").setup({
            menu = {
                width = vim.api.nvim_win_get_width(0) - 4,
            }
        })
    end

}
