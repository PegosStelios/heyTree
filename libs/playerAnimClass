PlayerAnim = {}
PlayerAnim.__index = PlayerAnim

function PlayerAnim.new(data)
    local instance = setmetatable({}, PlayerAnim)

    instance.sprite = data.sprite
    instance.spriteSheet = data.spriteSheet
    instance.grid = data.grid
    instance.animDown = data.animDown
    instance.animLeft = data.animLeft
    instance.animRight = data.animRight
    instance.animUp = data.animUp

    instance.anim = player.animLeft

    return instance
end

---@param sprite function
---@param spriteSheet function
---@param grid function
---@param animDown function
---@param animLeft function
---@param animRight function
---@param animUp function
PlayerAnim = PlayerAnim.new({
    sprite = love.graphics.newImage('sprites/parrot.png'),
    spriteSheet = love.graphics.newImage('sprites/player-sheet.png'),
    grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight() ),
    animDown = anim8.newAnimation( player.grid('1-4', 1), 0.2 ),
    animLeft = anim8.newAnimation( player.grid('1-4', 2), 0.2 ),
    animRight = anim8.newAnimation( player.grid('1-4', 3), 0.2 ),
    animUp = anim8.newAnimation( player.grid('1-4', 4), 0.2 ),

    anim = player.animLeft
})

function PlayerAnim:getAnim()
    return self.anim
end

---@param anim table
function PlayerAnim:setAnim(anim)
    self.anim = anim
end

-- return all anims as a table
function PlayerAnim:getAnims()
    return {
        down = self.animDown,
        left = self.animLeft,
        right = self.animRight,
        up = self.animUp
    }
end