local M = { "AlexvZyl/nordic.nvim" }

M.lazy = false
M.priority = 9999

function M.config()
  require("nordic").setup({
    on_palette = function(palette)
      palette.gray0 = "#1b2b34"

    end,
    after_palette = function(palette)
      palette.fg_sidebar = "#65737e"
      palette.bg_sidebar = "#073642"
    end,
    on_highlight = function(highlights, palette)
      highlights.LineNr = { fg = palette.fg_sidebar, bg = palette.bg_sidebar } 
      highlights.SignColumn = { bg = palette.bg_sidebar, fg = palette.fg_sidebar } 
      highlights.DiagnosticWarn = { fg = palette.warning, bg = palette.bg_sidebar }
    end,
  })
  require("nordic").load()
end

return M
