# No minimap on platforms

Hides the minimap while you are on a space platform, so the sidebar shows thruster
info instead. As if you can get lost, you just want to see thruster info in the sidebar.

This is a port of [Quezler's mod](https://mods.factorio.com/mod/no-minimap-on-platforms)
(source in [Quezler/glutenfree](https://github.com/Quezler/glutenfree)) to **Factorio 2.1**.

## How it works

```lua
script.on_event(defines.events.on_player_changed_surface, function(event)
  local player = game.get_player(event.player_index) --[[@as LuaPlayer]]
  player.game_view_settings.show_minimap = player.surface.platform == nil
end)
```

The shipped `control.lua` adds the `Uninstalled` runtime-global setting: turning it on
stops the mod from touching the minimap and restores the minimap for every player.

## 2.1 port notes

The mod's logic needed no code changes — every API it uses is unchanged in 2.1
(verified against the 2.1.19 runtime API):

- `defines.events.on_player_changed_surface` and `on_runtime_mod_setting_changed`
- `LuaSurface::platform`
- `GameViewSettings::show_minimap` (2.1 only *added* fields here: `show_pins_gui`, `hide_tall_entities`)

The 2.1 breaking changes (fluidbox removal, inventory defines, `category` → `categories`,
`SelectionModeFlags`) touch nothing this mod uses. The only change is
`factorio_version` in `info.json`, which 2.1 requires; the Space Age feature flags it
declares are still valid `info.json` keys in 2.1.

## Building

```sh
./build.sh
```

Produces `build/no-minimap-on-platforms_<version>.zip`, ready to drop into your
Factorio `mods/` folder or upload to the mod portal.

## License

MIT — see [LICENSE](LICENSE). Copyright (c) 2022 Patrick 'Quezler' Mounier.
