vim.api.nvim_create_user_command("AlpacaExplain", require("alpaca").explain(vim.bo.ft), {})
