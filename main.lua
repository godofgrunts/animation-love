local anim8 = require 'libs/anim8'

local img, knightAnimation, flip
local knight = {x = 100, y = 200, flip = 8, iW = nil, img = nil}

function love.load()
  knight.img = love.graphics.newImage('assets/sprites/knight.png')
  knight.iW = 0
  local g = anim8.newGrid(16, 16, knight.img:getWidth(), knight.img:getHeight())
  animation = anim8.newAnimation(g('1-4',1), 0.1)

end

function love.draw()

animation:draw(knight.img, knight.x, knight.y, 0, knight.flip, 8, knight.iW, 0)

end

function love.update(dt)
  if (love.keyboard.isDown('right')) then
    animation:update(dt)
    knight.flip = 8
    knight.iW = 0
    knight.x = knight.x + 400 * dt
  end
  if (love.keyboard.isDown('left')) then
    animation:update(dt)
    knight.flip = -8
    knight.iW = 16
    knight.x = knight.x - 400 * dt
  end

end

function love.keyreleased(key)
  if key == 'right' or key == 'left' then
    animation:gotoFrame(1)
  end
end
