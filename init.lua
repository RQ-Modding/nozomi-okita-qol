-- Nozomi Okita QoL. Cough-Cough Disease poisons her at the start of every battle;
-- the Poison Mask already stops other poison, and now it stops this one too. The game writes
-- its log line before rq.battle.on_start, so the line goes as well.

local DISEASE = rq.ids.skill.COUGH_COUGH_DISEASE
local MASK = rq.ids.item.POISON_MASK
local POISONED = rq.ids.state.POISON
local LINE = " is poisoned by cough-cough disease."

rq.log("Nozomi Okita QoL: the Poison Mask stops Cough-Cough Disease")

local function wears_mask(iic)
  local ii = rq.item.equipped(iic).item
  return ii ~= nil and rq.item.number(ii) == MASK
end

-- The line names the character only by the short name (rq.chara.get's short).
rq.battle.on_log(function(ctx)
  if not ctx.text:find(LINE, 1, true) then return nil end
  for _, u in ipairs(rq.units()) do
    if rq.chara.rank(u.id, DISEASE) >= 1 and wears_mask(u.id)
      and ctx.text == "→" .. rq.chara.get(u.id).short .. LINE then
      return false
    end
  end
end)

rq.battle.on_start(function(ctx)
  for _, iic in ipairs(ctx.allies) do
    if rq.chara.rank(iic, DISEASE) >= 1 and wears_mask(iic) then
      local c = rq.chara.get(iic)
      if c and c.status == POISONED then
        rq.chara.set(iic, { status = 0 })
      end
    end
  end
end)
