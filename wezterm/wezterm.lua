local wezterm = require("wezterm")

-- https://wezfurlong.org/wezterm/config/
return {
	font = wezterm.font("Hack Nerd Font"),
	font_size = 15.0,

	enable_tab_bar = false,

	colors = {
		-- background = "#00ff00",
	},

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	keys = {
		-- {
		-- 	key = "t",
		-- 	mods = "CMD",
		-- 	action = wezterm.action({
		-- 		SpawnCommandInNewTab = {
		-- 			cwd = wezterm.home_dir,
		-- 		},
		-- 	}),
		-- },

		{
			key = "t",
			mods = "CMD",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},

		{
			key = "f",
			mods = "CMD|SHIFT",
			action = wezterm.action.ToggleFullScreen,
		},
		-- Turn off the default CMD-m Hide action, allowing CMD-m to
		-- be potentially recognized and handled by the tab
		{
			key = "s",
			mods = "CMD",
			action = wezterm.action.SendString("\x1bw"),
			-- action = wezterm.action.DisableDefaultAssignment,
		},

		{
			key = "Backspace",
			mods = "CMD",
			action = wezterm.action.SendString("\x15"),
		},

		{
			key = "LeftArrow",
			mods = "OPT",
			action = wezterm.action.SendString("\x1bb"),
			-- action = act.SendKey({
			-- 	key = "b",
			-- 	mods = "ALT",
			-- }),
		},
		{
			key = "RightArrow",
			mods = "OPT",
			action = wezterm.action.SendString("\x1bf"),
			-- action = act.SendKey({ key = "f", mods = "ALT" }),
		},
	},
}
