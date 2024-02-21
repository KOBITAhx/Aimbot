local Players = game:GetService("Players")
local Camera = game.Workspace.CurrentCamera

-- Función para encontrar el jugador más cercano al personaje
function findNearestPlayer(character)
    local nearestPlayer = nil
    local nearestDistance = math.huge
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player ~= character then
            local distance = (player.Character.HumanoidRootPart.Position - character.HumanoidRootPart.Position).magnitude
            if distance < nearestDistance then
                nearestPlayer = player
                nearestDistance = distance
            end
        end
    end
    
    return nearestPlayer
end

-- Función para fijar la cámara al jugador más cercano
function fixCameraToNearestPlayer(character)
    local nearestPlayer = findNearestPlayer(character)
    
    if nearestPlayer then
        Camera.CameraSubject = nearestPlayer.Character.Humanoid
    end
end

-- Conectar la función a eventos relevantes, como el cambio de personaje
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        fixCameraToNearestPlayer(character)
    end)
end)
