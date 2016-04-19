--[[
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>
--]]

local anim8 = require 'libs/anim8'

local img, knightAnimation, flip
local knight = {x = 100, y = 200, flip = 8, iW = nil, img = nil}

function love.load()
  knight.img = love.graphics.newImage('assets/sprites/knight.png')
  knight.iW = 0
  local g = anim8.newGrid(16, 16, knight.img:getWidth(), knight.img:getHeight()) --sprites are 16x16
  animation = anim8.newAnimation(g('1-4',1), 0.1) -- '1-4' on X since images go left to right

end

function love.draw()

animation:draw(knight.img, knight.x, knight.y, 0, knight.flip, 8, knight.iW, 0)

end

function love.update(dt)
  if (love.keyboard.isDown('right')) then
    animation:update(dt)
    knight.flip = 8 -- set to 8 to make the image large enough to see the animations
    knight.iW = 0 -- when facing right we don't need an offset
    knight.x = knight.x + 400 * dt
  end
  if (love.keyboard.isDown('left')) then
    animation:update(dt)
    knight.flip = -8 -- set to -8 to flip the image and make it large enough to see animations
    knight.iW = 16 -- since image is flipped at origin point, we need to move the image to the right 16
    knight.x = knight.x - 400 * dt
  end

end

function love.keyreleased(key)
  if key == 'right' or key == 'left' then
    animation:gotoFrame(1)
  end
end
