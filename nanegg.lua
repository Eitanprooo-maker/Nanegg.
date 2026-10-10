-- NANEGG | GOD EDITION 💜
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "nanegg"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(240, 300)
frame.Position = UDim2.new(0.5, -120, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(22, 14, 32)
frame.Parent = gui
Instance.new("UICorner", frame)

local function makeButton(text, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 32)
    b.Position = UDim2.fromOffset(10, y)
    b.BackgroundColor3 = Color3.fromRGB(100, 45, 170)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Text = text
    b.Parent = frame
    Instance.new("UICorner", b)
    b.Activated:Connect(callback)
end

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "NANEGG 💜"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextScaled = true
title.Parent = frame

local function unlock()
    local box = Instance.new("TextBox")
    box.Size = UDim2.new(1, -20, 0, 35)
    box.Position = UDim2.fromOffset(10, 45)
    box.PlaceholderText = "Ingresá la clave"
    box.Text = ""
    box.Parent = frame

    makeButton("🔓 DESBLOQUEAR", 85, function()
        if box.Text == "676767" then
            box:Destroy()
            for _, b in ipairs(frame:GetChildren()) do
                if b:IsA("TextButton") then b:Destroy() end
            end

            makeButton("⚡ Velocidad ON/OFF", 45, function()
                local h = player.Character
                    and player.Character:FindFirstChildOfClass("Humanoid")
                if h then
                    h.WalkSpeed = h.WalkSpeed == 24 and 16 or 24
                end
            end)

            makeButton("👥 Ver jugadores", 85, function()
                local names = {}
                for _, p in ipairs(Players:GetPlayers()) do
                    table.insert(names, p.Name)
                end
                print(table.concat(names, ", "))
            end)

            makeButton("🥚 Contador de huevos", 125, function()
                print("Abrí el registro de huevos en la consola.")
            end)

            makeButton("❌ Cerrar menú", 165, function()
                gui:Destroy()
            end)
        else
            box.Text = ""
            box.PlaceholderText = "Clave incorrecta"
        end
    end)
end

unlock()
