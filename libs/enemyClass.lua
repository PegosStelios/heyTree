Enemy = {}
Enemy.__index = Enemy

Enemies = {}

function Enemy.new(data)
    local instance = setmetatable({}, Enemy)

    instance.enemyName = data.enemyName
    instance.enemyHealth = data.enemyHealth
    instance.enemyMana = data.enemyMana
    instance.enemyStamina = enemyStamina
    instance.enemySpeed = data.enemySpeed
    instance.enemyX = data.enemyX
    instance.enemyY = data.enemyY
    instance.drops = data.drops

    return instance
end

---@param enemyName string
---@param enemyHealth number
---@param enemyMana number
---@param enemyStamina number
---@param enemySpeed number
---@param enemyX number
---@param enemyY number
---@param drops table
Enemy = Enemy.new({
    enemyAmount = enemyAmount + 1,
    enemyName = "Base Enemy" .. enemyAmount,
    enemyHealth = 100,
    enemyMana = 100,
    enemyStamina = 100,
    enemySpeed = 3,
    enemyX = 400,
    enemyY = 200,
    drops = {}
    table.insert(Enemies, Enemy)
})

---@param enemyName string
---@param enemyHealth number
---@param enemyMana number
---@param enemyStamina number
---@param enemySpeed number
---@param enemyX number
---@param enemyY number
---@param drops table
SpiderEnemy = Enemy.new({
    SpiderAmount = SpiderAmount + 1
    enemyName = "Spider" .. SpiderAmount -- change the name of spider for each enemy created, we need to avoid duplicates
    enemyHealth = 200,
    enemyMana = 200,
    enemyStamina = 200,
    enemySpeed = 3,
    enemyX = 400,
    enemyY = 200,
    drops = {{
            itemName = "Spider Silk",
            itemType = "Craftable",
            itemValue = 10
        }, {
            itemName = "Spider Venom",
            itemType = "Consumable",
            itemValue = 10
        }
    }
    table.insert(Enemies, SpiderEnemy)
})

---@param enemyName string
function Enemy:killEnemy(enemyName)
    for i, enemy in ipairs(Enemies) do
        if enemy.enemyName == enemyName then
            table.remove(Enemies, i)
        end
    end
end

---@param enemyname string
function Enemy:getEnemyAmount(enemyName)
end

---@param statWanted string
function Enemy:getEnemyStat(statWanted)
    if statWanted == "enemyHealth" then
        return self.enemyHealth
    elseif statWanted == "enemyMana" then
        return self.enemyMana
    elseif statWanted == "enemyStamina" then
        return self.enemyStamina
    elseif statWanted == "enemySpeed" then
        return self.enemySpeed
    elseif statWanted == "enemyX" then
        return self.enemyX
    elseif statWanted == "enemyY" then
        return self.enemyY
    elseif statWanted == "enemyName" then
        return self.enemyName
    elseif statWanted == "drops" then
        return self.drops
    else
        assert(false, "Invalid statWanted")
    end
end