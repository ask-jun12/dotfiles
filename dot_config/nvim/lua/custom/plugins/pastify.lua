return {
  'TobinPalmer/pastify.nvim',
  cmd = { 'Pastify', 'PastifyAfter' },
  config = function()
    require('pastify').setup {
      opts = {
        --apikey = "YOUR API KEY (https://api.imgbb.com/)", -- Needed if you want to save online.
        save = 'local',
        local_path = 'C:/Work/my-notes/assets/images/' .. vim.fn.expand '%:t:r' .. '/',
        filename = function()
          return os.date '%Y-%m-%d_%H-%M-%S'
        end,
        default_ft = 'markdown',
      },
      ft = { -- Custom snippets for different filetypes, will replace $IMG$ with the image url
        html = '<img src="$IMG$" alt="">',
        markdown = '![]($IMG$)',
        tex = [[\includegraphics[width=\linewidth]{$IMG$}]],
        css = 'background-image: url("$IMG$");',
        js = 'const img = new Image(); img.src = "$IMG$";',
        xml = '<image src="$IMG$" />',
        php = '<?php echo "<img src="$IMG$" alt="">"; ?>',
        python = '# $IMG$',
        java = '// $IMG$',
        c = '// $IMG$',
        cpp = '// $IMG$',
        swift = '// $IMG$',
        kotlin = '// $IMG$',
        go = '// $IMG$',
        typescript = '// $IMG$',
        ruby = '# $IMG$',
        vhdl = '-- $IMG$',
        verilog = '// $IMG$',
        systemverilog = '// $IMG$',
        lua = '-- $IMG$',
      },
    }
  end,
}

-- vim: ts=2 sts=2 sw=2 et
