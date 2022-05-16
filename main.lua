Scene = {
    playerSprite = 'sprites/player-sheet.png',
    bgSprite = 'sprites/bg.png',
}

function love.load()
    Anim = require 'libs/anim8'
    require "libs/playerClass"
    require "libs/playerAnimClass"
end

function love.update(dt)
    local isMoving = false
    local anims = playerAnim:getAnims()

    if love.keyboard.isDown('d') then
        local move = Player:setX(Player:getX() + Player:getSpeed())
        anims = {
            down = playerAnim:getAnims().down,
        }

        isMoving = true
    end

    if love.keyboard.isDown('a') then
        local move = Player:setX(Player:getX() - Player:getSpeed())
    end

    if love.keyboard.isDown('w') then
        local move = Player:setY(Player:getY() - Player:getSpeed())
    end

    if love.keyboard.isDown('s') then
        local move = Player:setY(Player:getY() + Player:getSpeed())
    end

    PlayerAnim:setAnim(dt)
end

function love.draw()
    local playerSprite = Scene.playerSprite assert(playerSprite, "Player sprite is nil")
    local bgSprite = Scene.bgSprite assert(bgSprite, "Background sprite is nil")

    love.graphics.newImage(love.graphics.newImage(bgSprite))
    love.graphics.newImage(love.graphics.newImage(playerSprite))
end