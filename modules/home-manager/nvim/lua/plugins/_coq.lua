
vim.pack.add({
    { src = "https://github.com/ms-jpq/coq_nvim", version = "coq" },
    { src = "https://github.com/ms-jpq/coq.artifacts", version = "artifacts" },
    { src = "https://github.com/ms-jpq/coq.thirdparty", version = "3p" },
})

vim.g.coq_settings = {auto_start = "shut-up" }
coq = require("coq")
require("coq_3p") {
    { src = "nvimlua", short_name = "nLUA", conf_only = true },
}

vim.lsp.config('*', coq.lsp_ensure_capabilities())
