local aimbotEnabled = false

local function aimbot()
    if aimbotEnabled then
        -- Code for aimbot feature
        print("Aimbot activated")
    else
        print("Aimbot deactivated")
    end
end

local aimbotButton = Instance.new("TextButton")
aimbotButton.Parent = game.Players.LocalPlayer.PlayerGui
aimbotButton.Position = UDim2.new(0.5, 0, 0.9, 0)
aimbotButton.Size = UDim2.new(0, 200, 0, 50)
aimbotButton.Text = "Toggle Aimbot"
aimbotButton.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    aimbot()
end)
