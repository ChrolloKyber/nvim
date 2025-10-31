local M = {}

local black_hole_enabled = false

local mappings = {
	{ mode = "n", lhs = "dd",  rhs = '"_dd' },
	{ mode = "n", lhs = "de",  rhs = '"_de' },
	{ mode = "n", lhs = "diw", rhs = '"_diw' },
	{ mode = "n", lhs = "diW", rhs = '"_diW' },
	{ mode = "n", lhs = 'di"', rhs = '"_di"' },
	{ mode = "n", lhs = 'dgg', rhs = '"_dgg' },
	{ mode = "n", lhs = 'dG',  rhs = '"_dG' },
	{ mode = "n", lhs = "D",   rhs = '"_D' },
	{ mode = "n", lhs = "cc",  rhs = '"_cc' },
	{ mode = "n", lhs = "ce",  rhs = '"_ce' },
	{ mode = "n", lhs = "ciw", rhs = '"_ciw' },
	{ mode = "n", lhs = 'ci"', rhs = '"_ci"' },
	{ mode = "n", lhs = "C",   rhs = '"_C' },
	{ mode = "n", lhs = "x",   rhs = '"_x' },
	{ mode = "n", lhs = "X",   rhs = '"_X' },
	{ mode = "n", lhs = "s",   rhs = '"_s' },
	{ mode = "n", lhs = "S",   rhs = '"_S' },
	{ mode = "v", lhs = "d",   rhs = '"_d' },
	{ mode = "v", lhs = "D",   rhs = '"_D' },
	{ mode = "v", lhs = "c",   rhs = '"_c' },
	{ mode = "v", lhs = "C",   rhs = '"_C' },
	{ mode = "v", lhs = "x",   rhs = '"_x' },
	{ mode = "v", lhs = "X",   rhs = '"_X' },
	{ mode = "v", lhs = "s",   rhs = '"_s' },
	{ mode = "v", lhs = "S",   rhs = '"_S' },
}

local original_mappings = {}

function M.toggle_black_hole()
	if not black_hole_enabled then
		black_hole_enabled = true

		for _, mapping in ipairs(mappings) do
			local current = vim.fn.maparg(mapping.lhs, mapping.mode, false, true)
			original_mappings[mapping.mode .. mapping.lhs] = current

			vim.keymap.set(mapping.mode, mapping.lhs, mapping.rhs, {
				desc = "Black hole " .. mapping.lhs,
				silent = true,
			})
		end

		print("Black hole register enabled")
	else
		black_hole_enabled = false

		for _, mapping in ipairs(mappings) do
			local key = mapping.mode .. mapping.lhs
			local original = original_mappings[key]

			vim.keymap.del(mapping.mode, mapping.lhs)

			if original and original.rhs and original.rhs ~= "" then
				vim.keymap.set(mapping.mode, mapping.lhs, original.rhs, {
					desc = original.desc,
					silent = original.silent == 1,
					noremap = original.noremap == 1,
					expr = original.expr == 1,
				})
			end
		end

		original_mappings = {}
		print("Black hole register disabled")
	end
end

vim.api.nvim_create_user_command("ToggleBlackHole", function()
	M.toggle_black_hole()
end, { desc = "Toggle black hole register mode" })

vim.keymap.set("n", "<leader>bh", function()
	M.toggle_black_hole()
end, { desc = "Toggle black hole register" })

return M
