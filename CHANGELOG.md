# Changelog

Each section is a version of the mod, the `version` in `mod.json`. The release workflow copies the
section of a tagged version into the release notes.

## 1.0.4

- The battle log line is dropped through the loader's `rq.battle.on_log` instead of a hook on the
  game's function, and the `install` line is gone. Needs loader 2.37.0. No change in the game.

## 1.0.3

- The battle log line is matched with the short name from `rq.chara.get` instead of a call into
  the game's code (`Ｃ短縮名前`, which reads the same field). No change in the game.

## 1.0.2

- The code names the game's characters, skills, items and states with `rq.ids` instead of
  numbers. Needs loader 1.15.0. No change in the game.

## 1.0.1

- The battle log no longer says the masked character is poisoned. Needs loader 0.18.0.

## 1.0.0

First version.

- The Poison Mask (item 195) stops Cough-Cough Disease (skill 372).
