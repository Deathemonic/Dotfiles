local gears = require("gears")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local wibox = require("wibox")
local helpers = require("helpers")
local widgets = require("ui.widgets")
local playerctl_daemon = require("signal.playerctl")

local music_title = wibox.widget({
	font = beautiful.font_name .. "Regular 10",
	valign = "center",
	widget = wibox.widget.textbox,
})

local music_artist = wibox.widget({
	font = beautiful.font_name .. "Bold 10",
	valign = "center",
	widget = wibox.widget.textbox,
})

local widget = wbutton.elevated.state({
    child = icon,
    normal_bg = beautiful.wibar_bg,
    on_release = function()
        awesome.emit_signal("main_panel::toggle", s)
    end,
})

return widget

local myplayer_text = wibox.widget.textbox()
awful.spawn.with_line_callback(
  "playerctl --follow metadata --format ' {{artist}} <{{status}}> {{title}}'",
  {stdout = function (line)
     myplayer_text:set_text(line:gsub('<Playing>', '>'):gsub('<.+>', '|'))
   end}
)

playerctl_daemon:connect_signal("metadata", on(_, title, artist, __, ___, ____)
	if title == "" then
		title = "Nothing Playing"
	end
	if artist == "" then
		artist = "Nothing Playing"
	end

	music_title:set_markup_silently(helpers.ui.colorize_text(title, beautiful.xforeground))
	music_artist:set_markup_silently(helpers.ui.colorize_text(artist, beautiful.accent))
end)
