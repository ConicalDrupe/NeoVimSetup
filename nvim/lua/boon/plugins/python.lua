local ap = vim.api

package.path = "/home/user/.local/bin;" .. package.path

vim.cmd("source ~/.config/nvim/lua/boon/plugins/nvim-ipy.vim")

-- vim.cmd([[
-- function! GetKernelFromPipenv()
--     let a:kernel = tolower(system('basename $(pipenv --venv)'))
--     " Remove control characters (most importantly newline)
--     return substitute(a:kernel, '[[:cntrl:]]', '', 'g')
-- endfunction
-- ]])

-- vim.cmd ([[
-- function! ConnectToPipenvKernel()
--     let a:kernel = GetKernelFromPipenv()
--     call IPyConnect('--kernel', a:kernel, '--no-window')
-- endfunction
--   ]])

-- vim.cmd ([[
-- function! AddFilepathToSyspath()
--     let a:filepath = expand('%:p:h')
--     call IPyRun('import sys; sys.path.append("' . a:filepath . '")')
--     echo 'Added ' . a:filepath . ' to pythons sys.path'
-- endfunction
-- ]])

-- " Starts Qt console and connect to pipenv ipykernel
-- command! -nargs=0 RunQtPipenv vim.call StartConsolePipenv('jupyter qtconsole')
ap.nvim_create_user_command("RunQtPipenv", "call StartConsolePipenv('jupyter qtconsole')", { nargs = 0 })

-- " Starts Qt console and connect to an existing ipykernel
-- command! -nargs=0 RunQtConsole vim.call jobstart("jupyter qtconsole --existing")

ap.nvim_create_user_command("RunQtConsole", "call jobstart(jupyter qtconsole --existing)", { nargs = 0 })

-- " Starts pipenv ipykernel
-- command! -nargs=0 RunPipenvKernel terminal /bin/bash -i -c 'pipenv run python -m ipykernel'
-- command! -nargs=0 RunPoetryKernel terminal /bin/bash -i -c 'poetry run python -m ipykernel'
ap.nvim_create_user_command(
	"RunPipenvKernal",
	"terminal /bin/bash -i -c 'pipenv run python -m ipykernal",
	{ nargs = 0 }
)

ap.nvim_create_user_command(
	"RunPoetryKernal",
	"terminal /bin/bash -i -c 'poetry run puthon -m ipykernal",
	{ nargs = 0 }
)

-- " Connects nvim-ipy to the existing ipykernel (non-interactive)
-- command! -nargs=0 ConnectToPipenvKernel call ConnectToPipenvKernel()
ap.nvim_create_user_command("ConnectToPipenvKernel", "call ConnectToPipenvKernal", { nargs = 0 })

-- " Connjcts nvim-ipy to the existing ipykernel (interactive)
-- command! -nargs=0 ConnectConsole terminal /bin/bash -i -c 'jupyter console --existing'
-- command! -nargs=0 AddFilepathToSyspath call AddFilepathToSyspath()
ap.nvim_create_user_command("ConnectConsole", "terminal /bin/bash -i -c 'jupyter console --existing", { nargs = 0 })
ap.nvim_create_user_command("AddFilepathToSyspath", "call AddFilepathToSyspath", { nargs = 0 })
