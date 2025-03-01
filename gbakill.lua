hui = game:GetService("CoreGui")
if not gethui() then hui = game:GetService("CoreGui")
else hui = gethui() end

-- Vars
local player = game:GetService("Players").LocalPlayer
local network = game:GetService("ReplicatedStorage"):WaitForChild("WeaponsSystem"):WaitForChild("Network")
local uis = game:GetService("UserInputService")
local menuopened = false
-- Functions
local function GetPlayer(String)
    local Player = nil
    for i,v in next, game:GetService("Players"):GetChildren() do
        if tostring(string.lower(v.Name):sub(1,#String)) == String:lower() or tostring(string.lower(v.DisplayName):sub(1,#String)) == String:lower() then
            Player = v
        end
    end
    return Player
end
-- Gui
local abyssgui = Instance.new("ScreenGui")
abyssgui.Parent = hui
abyssgui.Name = "iloveabyssiloveabyssiloveabyss"
abyssgui.Enabled = false
abyssgui.IgnoreGuiInset = true
local frame = Instance.new("Frame")
frame.Parent = abyssgui
frame.Size = UDim2.new(0,150,0,130)
frame.Draggable = true
frame.Active = true
frame.Selectable = true
frame.BackgroundColor3 = Color3.fromRGB(250, 201, 206)
local txtlbl = Instance.new("TextLabel")
txtlbl.Parent = frame
txtlbl.Size = UDim2.new(0,150,0,25)
txtlbl.Text = "Supreme Leader Abyss GUI"
txtlbl.Position = UDim2.new(0,0,0,5)
txtlbl.BackgroundColor3 = Color3.fromRGB(250, 201, 206)
local txtbox = Instance.new("TextBox")
txtbox.Parent = frame
txtbox.Size = UDim2.new(0,150,0,50)
txtbox.Position = UDim2.new(0,0,0,30)
txtbox.BackgroundColor3 = Color3.fromRGB(250, 201, 206)
local killbt = Instance.new("TextButton")
killbt.Parent = frame
killbt.Size = UDim2.new(0,50,0,50)
killbt.Position = UDim2.new(0,0,0,80)
killbt.Text = "Kill"
killbt.BackgroundColor3 = Color3.fromRGB(250, 201, 206)
local viewbt = Instance.new("TextButton")
viewbt.Parent = frame
viewbt.Size = UDim2.new(0,50,0,50)
viewbt.Position = UDim2.new(0,50,0,80)
viewbt.Text = "View"
viewbt.BackgroundColor3 = Color3.fromRGB(250, 201, 206)
local unviewbt = Instance.new("TextButton")
unviewbt.Parent = frame
unviewbt.Size = UDim2.new(0,50,0,50)
unviewbt.Position = UDim2.new(0,100,0,80)
unviewbt.Text = "Unview"
unviewbt.BackgroundColor3 = Color3.fromRGB(250, 201, 206)
local screendim = Instance.new("Frame")
screendim.Parent = abyssgui
screendim.Size = UDim2.new(1,0,1,0)
screendim.Transparency = 0.3
screendim.Visible = false
screendim.ZIndex = 0
screendim.BackgroundColor3 = Color3.fromRGB(0,0,0)
local watermarkgui = Instance.new("ScreenGui")
watermarkgui.Parent = hui
local watermark = Instance.new("TextButton")
watermark.Parent = watermarkgui
watermark.BackgroundColor3 = Color3.new(1, 1, 1)
watermark.BackgroundTransparency = 1
watermark.BorderColor3 = Color3.new(0, 0, 0)
watermark.BorderSizePixel = 0
watermark.Position = UDim2.new(-0.000669554807, 0, 0.940758288, 0)
watermark.Size = UDim2.new(0, 200, 0, 50)
watermark.Font = Enum.Font.SourceSansBold
watermark.Text = "Team SteelWare"
watermark.TextColor3 = Color3.new(0.0941177, 0.0941177, 0.0941177)
watermark.TextSize = 16
watermark.TextTransparency = 0.2
watermark.TextXAlignment = Enum.TextXAlignment.Left

-- Main
killbt.MouseButton1Click:Connect(function()
    target = GetPlayer(txtbox.Text)
    weapon = player.Character:FindFirstChild("Pistol") or player.Backpack:FindFirstChild("Pistol")
    repeat 
        network:WaitForChild("WeaponHit"):FireServer(weapon,{["p"] = target.Character.HumanoidRootPart.Position,["pid"] = 1,["part"] = target.Character.HumanoidRootPart,["d"] = 0,["maxDist"] = 0,["h"] = target.Character.HumanoidRootPart,["m"] = Enum.Material.Plastic,["n"] = Vector3.yAxis,["t"] = 0,["sid"] = 0})
        task.wait()
    until target.Character.Humanoid.Health == 0
end)
viewbt.MouseButton1Click:Connect(function()
    target = GetPlayer(txtbox.Text)
    view = game:GetService("RunService").PreRender:Connect(function(deltaTime)
        workspace.Camera.CameraSubject = target.Character.UpperTorso
    end)
end)
unviewbt.MouseButton1Click:Connect(function()
    if view then view:Disconnect() end
    workspace.Camera.CameraSubject = player.Character.UpperTorso
end)
uis.InputBegan:Connect(function(input,processed)
	if processed then return end
	if input.KeyCode == Enum.KeyCode.RightShift then
        menuopened = not menuopened
        if menuopened then
            abyssgui.Enabled = true
            screendim.Visible = true
            unlock = game:GetService("RunService").PreRender:Connect(function(deltaTime)
                uis.MouseBehavior = Enum.MouseBehavior.Default
                player.PlayerGui:WaitForChild("HUD").Cursor.Visible = true
            end)
        elseif menuopened == false then
            uis.MouseBehavior = Enum.MouseBehavior.LockCenter
            if unlock then unlock:Disconnect() end
            player.PlayerGui:WaitForChild("HUD").Cursor.Visible = false
            screendim.Visible = false
            abyssgui.Enabled = false
        end
	end
    if input.KeyCode == Enum.KeyCode.Semicolon then
        if menuopened then
            txtbox:CaptureFocus()
        end
    end
end)
watermark.MouseButton1Click:Connect(function()
    menuopened = not menuopened
    if menuopened then
        abyssgui.Enabled = true
        screendim.Visible = true
        unlock = game:GetService("RunService").PreRender:Connect(function(deltaTime)
            uis.MouseBehavior = Enum.MouseBehavior.Default
            player.PlayerGui:WaitForChild("HUD").Cursor.Visible = true
        end)
    elseif menuopened == false then
        uis.MouseBehavior = Enum.MouseBehavior.LockCenter
    if unlock then unlock:Disconnect() end
        player.PlayerGui:WaitForChild("HUD").Cursor.Visible = false
        screendim.Visible = false
        abyssgui.Enabled = false
    end
end)
game.StarterGui:SetCore("SendNotification", {
Title = "Team SteelWare",
Text = "If you want to open the GUI, press right shift or if you are on mobile, simply press the watermark in the bottom left corner.",
Duration = 5,
})
task.wait(2)
setclipboard("https://discord.gg/WBTBkFUfc6")
game.StarterGui:SetCore("SendNotification", {
Title = "Team SteelWare",
Text = "Please join the SteelWare discord server if you wish to get more scripts from us!!! link: https://discord.gg/WBTBkFUfc6",
Duration = 5,
})