Player = {}
Player.__index = Player

function Player.new(data)
    local instance = setmetatable({}, Player)

    instance.playerName = data.playerName
    instance.playerHealth = data.playerHealth
    instance.playerMana = data.playerMana
    instance.playerStamina = playerStamina
    instance.playerSpeed = data.playerSpeed
    instance.playerX = data.playerX
    instance.playerY = data.playerY
    instance.inventory = data.inventory

    return instance
end

---@param playerName string
---@param playerHealth number
---@param playerMana number
---@param playerStamina number
---@param playerSpeed number
---@param playerX number
---@param playerY number
---@param inventory table
Player = Player.new({
    playerName = "Pegos",
    playerHealth = 100,
    playerMana = 100,
    playerStamina = 100,
    playerSpeed = 3,
    playerX = 400,
    playerY = 200,
    inventory = {}
})

function Player:showStats()
    print("Name: " .. self.playerName)
    print("Health: " .. self.playerHealth)
    print("Mana: " .. self.playerMana)
    print("Stamina: " .. self.playerStamina)
    print("X: " .. self.playerX)
    print("Y: " .. self.playerY)
    print("Coords: " .. self.playerX .. ", " .. self.playerY)
end

function Player:getName()
    return self.playerName
end

function Player:getHealth()
    return self.playerHealth
end

function Player:getMana()
    return self.playerMana
end

function Player:getStamina()
    return self.playerStamina
end

function Player:getSpeed()
    return self.playerSpeed
end

function Player:getX()
    return self.playerX
end

function Player:getY()
    return self.playerY
end

function Player:getPosition()
    return self.playerX, self.playerY
end

function Player:getInventory()
    return self.inventory
end

-- Sets

---@param name string
function Player:setName(name)
    self.playerName = name
end

---@param health number
function Player:setHealth(health)
    self.playerHealth = health
end

---@param mana number
function Player:setMana(mana)
    self.playerMana = mana
end

---@param stamina number
function Player:setStamina(stamina)
    self.playerStamina = stamina
end

---@param speed number
function Player:setStamina(speed)
    self.playerSpeed = speed
end

---@param x number
function Player:setX(x)
    self.playerX = x
end

---@param y number
function Player:setY(y)
    self.playerY = y
end

---@param pos vector2
function Player:setPosition(pos)
    self.playerX = pos.x
    self.playerY = pos.y
end

---@param inventory table
function Player:setInventory(inventory)
    self.inventory = inventory
end

---@param item Item
function Player:addItem(item)
    table.insert(self.inventory, item)
end

---@param item Item
function Player:removeItem(item)
    for i, v in ipairs(self.inventory) do
        if v == item then
            table.remove(self.inventory, i)
        end
    end
end

---@param item item
function Player:hasItem(item, count)
    if count == nil then 
        for i, v in ipairs(self.inventory) do
            if v == item then
                return true
            end
        end
        return false
    else
        local count = 0
        for i, v in ipairs(self.inventory) do
            if v == item then
                count = count + 1
            end
        end
        if count >= count then
            return true
        else
            return false
        end
    end
end