vim.api.nvim_create_autocmd("Signal", {
    pattern = "SIGUSR1",
    callback = function()
        vim.notify("SIGUSR1 received", vim.log.levels.INFO)
        dofile(vim.fn.stdpath("config") .. "/lua/config/theme.lua")
    end,
})
