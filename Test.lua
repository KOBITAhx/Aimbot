local aimbotEnabled = true

local function findNearestPlayer()
    local players = game:GetService("Players"):GetPlayers()
    local closestPlayer = nil
    local closestDistance = math.huge
    
    for _, player in ipairs(players) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local distance = (player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if distance < closestDistance then
                closestPlayer = player
                closestDistance = distance
            end
        end
    end
    
    return closestPlayer
end

local function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    
    if aimbotEnabled then
        print("Aimbot activado")
    else
        print("Aimbot desactivado")
    end
end

game.Players.LocalPlayer.Backpack.Item.MouseButton1Click:Connect(toggleAimbot)

while true do
    if aimbotEnabled then
        local targetPlayer = findNearestPlayer()
        
        if targetPlayer then
             game.Workspace.CurrentCamera.CFrame = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, targetPlayer.Character.HumanoidRootPart.Position)
        end
    end
    
    wait(0.1) 
end
