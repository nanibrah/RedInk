if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("RedInk") then
	game:GetService("Players").LocalPlayer.PlayerGui.RedInk:Destroy()
else
	print([[ 
	RedInk was created for fun!
	Visit github: https://github.com/nanibrah
	Creator: nanibrah
]])
end

local SilentAim_Settings = {
	Enabled = false,
	SilentAim_Enabled = true,

	ToggleKey = "RightAlt",

	TeamCheck = false,
    TargetPart = "HumanoidRootPart",
    SilentAimMethod = "",

	FOVRadius = 60,
    FOVVisible = false
}

local Camera = workspace.CurrentCamera
local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local Mouse = LocalPlayer:GetMouse()

local GetChildren = game.GetChildren
local GetPlayers = Players.GetPlayers
local WorldToScreen = Camera.WorldToScreenPoint
local WorldToViewportPoint = Camera.WorldToViewportPoint
local GetPartsObscuringTarget = Camera.GetPartsObscuringTarget
local FindFirstChild = game.FindFirstChild
local RenderStepped = RunService.RenderStepped
local GuiInset = GuiService.GetGuiInset
local GetMouseLocation = UserInputService.GetMouseLocation

----------- Create UI -----------
local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "RedInk"
ScreenGui.ResetOnSpawn = false

local Template = Instance.new("Frame", ScreenGui)
Template.BackgroundColor3 = Color3.fromRGB(36, 36, 35)
Template.Position = UDim2.new(0, 0, 0, 0)
Template.Size = UDim2.new(0, 350,0, 450)
Template.ZIndex = 1
Template.Draggable = true
Template.Active = true

local Body = Instance.new("Frame", Template)
Body.BackgroundColor3 = Color3.fromRGB(36, 36, 35)
Body.BorderColor3 = Color3.fromRGB(255, 255, 255)
Body.BorderMode = Enum.BorderMode.Outline
Body.BorderSizePixel = 1
Body.Position = UDim2.new(0.017, 0, 0.013, 0)
Body.Size = UDim2.new(0, 338, 0, 438)
Body.ZIndex = 2

local Content = Instance.new("Frame", Body)
Content.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Content.BorderColor3 = Color3.fromRGB(255, 255, 255)
Content.BorderMode = Enum.BorderMode.Outline
Content.Position = UDim2.new(0.012, 0, 0.014, 0)
Content.Size = UDim2.new(0, 163, 0, 378)
Content.ZIndex = 3

local Title = Instance.new("TextLabel", Content)
Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Title.BorderColor3 = Color3.fromRGB(255, 255, 255)
Title.BorderMode = Enum.BorderMode.Outline
Title.BorderSizePixel = 1
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(0, 163, 0, 23)
Title.ZIndex = 4
Title.Text = "Combat"
Title.Font = Enum.Font.SourceSans
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.TextWrapped = true

local Content_Left = Instance.new("Frame", Content)
Content_Left.BackgroundTransparency = 1
Content_Left.Position = UDim2.new(0.037, 0, 0.077, 0)
Content_Left.Size = UDim2.new(0, 151, 0, 343)
Content_Left.ZIndex = 4

local Enabled_Folder = Instance.new("Folder", Content_Left) -- Enabled Folder

local Enabled_CheckBox = Instance.new("TextButton", Enabled_Folder)
Enabled_CheckBox.Active = SilentAim_Settings.Enabled
Enabled_CheckBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Enabled_CheckBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
Enabled_CheckBox.BorderMode = Enum.BorderMode.Outline
Enabled_CheckBox.BorderSizePixel = 1
Enabled_CheckBox.Position = UDim2.new(0.049, 0, 0.028, 0)
Enabled_CheckBox.Size = UDim2.new(0, 12, 0, 12)
Enabled_CheckBox.ZIndex = 5
Enabled_CheckBox.Text = ""

local Enabled_Text = Instance.new("TextLabel", Enabled_Folder)
Enabled_Text.BackgroundTransparency = 1
Enabled_Text.Position = UDim2.new(0.178, 0, 0.006, 0)
Enabled_Text.Size = UDim2.new(0, 133, 0, 27)
Enabled_Text.ZIndex = 5
Enabled_Text.Text = "Enabled"
Enabled_Text.Font = Enum.Font.SourceSans
Enabled_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Enabled_Text.TextSize = 18
Enabled_Text.TextWrapped = true
Enabled_Text.TextXAlignment = Enum.TextXAlignment.Left

local SilentAim_Folder = Instance.new("Folder", Content_Left) -- Silent Aim Folder

local SilentAim_CheckBox = Instance.new ("TextButton", SilentAim_Folder)
SilentAim_CheckBox.Active = SilentAim_Settings.SilentAim_Enabled
SilentAim_CheckBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SilentAim_CheckBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
SilentAim_CheckBox.BorderMode = Enum.BorderMode.Outline
SilentAim_CheckBox.BorderSizePixel = 1
SilentAim_CheckBox.Position = UDim2.new(0.049, 0, 0.104, 0)
SilentAim_CheckBox.Size = UDim2.new(0, 12, 0, 12)
SilentAim_CheckBox.ZIndex = 5
SilentAim_CheckBox.Text = ""

local SilentAim_Text = Instance.new("TextLabel", SilentAim_Folder)
SilentAim_Text.BackgroundTransparency = 1
SilentAim_Text.Position = UDim2.new(0.178, 0, 0.083, 0)
SilentAim_Text.Size = UDim2.new(0, 133, 0, 27)
SilentAim_Text.ZIndex = 5
SilentAim_Text.Text = "Silent Aim"
SilentAim_Text.Font = Enum.Font.SourceSans
SilentAim_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
SilentAim_Text.TextSize = 18
SilentAim_Text.TextWrapped = true
SilentAim_Text.TextXAlignment = Enum.TextXAlignment.Left

local FovCircle_Folder = Instance.new("Folder", Content_Left) -- Fov Circle Folder

local FovCircle_CheckBox = Instance.new("TextButton", FovCircle_Folder)
FovCircle_CheckBox.Active = SilentAim_Settings.FOVVisible
FovCircle_CheckBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
FovCircle_CheckBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
FovCircle_CheckBox.BorderMode = Enum.BorderMode.Outline
FovCircle_CheckBox.BorderSizePixel = 1
FovCircle_CheckBox.Position = UDim2.new(0.049, 0, 0.182, 0)
FovCircle_CheckBox.Size = UDim2.new(0, 12, 0, 12)
FovCircle_CheckBox.ZIndex = 5
FovCircle_CheckBox.Text = ""

local FovCircle_Text = Instance.new("TextLabel", FovCircle_Folder)
FovCircle_Text.BackgroundTransparency = 1
FovCircle_Text.Position = UDim2.new(0.178, 0, 0.16, 0)
FovCircle_Text.Size = UDim2.new(0, 133, 0, 27)
FovCircle_Text.ZIndex = 5
FovCircle_Text.Text = "Fov Circle"
FovCircle_Text.Font = Enum.Font.SourceSans
FovCircle_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
FovCircle_Text.TextSize = 18
FovCircle_Text.TextWrapped = true
FovCircle_Text.TextXAlignment = Enum.TextXAlignment.Left

local FovCircleSize_Folder = Instance.new("Folder", FovCircle_Folder) -- Fov Circle Size Folder

local FovCircleSize_Text = Instance.new("TextLabel", FovCircleSize_Folder)
FovCircleSize_Text.BackgroundTransparency = 1
FovCircleSize_Text.Position = UDim2.new(0.046, 0, 0.236, 0)
FovCircleSize_Text.Size = UDim2.new(0, 75, 0, 27)
FovCircleSize_Text.ZIndex = 5
FovCircleSize_Text.Text = "Fov Radius"
FovCircleSize_Text.Font = Enum.Font.SourceSans
FovCircleSize_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
FovCircleSize_Text.TextSize = 18
FovCircleSize_Text.TextWrapped = true
FovCircleSize_Text.TextXAlignment = Enum.TextXAlignment.Left

local FovCircleSize_TextBox = Instance.new("TextBox", FovCircleSize_Folder)
FovCircleSize_TextBox.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
FovCircleSize_TextBox.Position = UDim2.new(0.536, 0, 0.245, 0)
FovCircleSize_TextBox.Size = UDim2.new(0, 37, 0, 20)
FovCircleSize_TextBox.ZIndex = 5
FovCircleSize_TextBox.Text = SilentAim_Settings.FOVRadius
FovCircleSize_TextBox.TextSize = 16
FovCircleSize_TextBox.Font = Enum.Font.SourceSans
FovCircleSize_TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)

local FovCircleSize_UICorner = Instance.new("UICorner", FovCircleSize_TextBox)
FovCircleSize_UICorner.CornerRadius = UDim.new(0, 3)

local TeamCheck_Folder = Instance.new("Folder", Content_Left) -- Team Check Folder

local TeamCheck_CheckBox = Instance.new("TextButton", TeamCheck_Folder)
TeamCheck_CheckBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TeamCheck_CheckBox.BorderColor3 = Color3.fromRGB(255, 255, 255)
TeamCheck_CheckBox.BorderMode = Enum.BorderMode.Outline
TeamCheck_CheckBox.BorderSizePixel = 1
TeamCheck_CheckBox.Position = UDim2.new(0.049, 0, 0.334, 0)
TeamCheck_CheckBox.Size = UDim2.new(0, 12, 0, 12)
TeamCheck_CheckBox.ZIndex = 5
TeamCheck_CheckBox.Text = ""

local Teamcheck_Text = Instance.new("TextLabel", TeamCheck_Folder)
Teamcheck_Text.BackgroundTransparency = 1
Teamcheck_Text.Position = UDim2.new(0.178, 0, 0.312, 0)
Teamcheck_Text.Size = UDim2.new(0, 75, 0, 27)
Teamcheck_Text.ZIndex = 5
Teamcheck_Text.Text = "Team Check"
Teamcheck_Text.Font = Enum.Font.SourceSans
Teamcheck_Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Teamcheck_Text.TextSize = 18
Teamcheck_Text.TextWrapped = true
Teamcheck_Text.TextXAlignment = Enum.TextXAlignment.Left

local TextButton = Instance.new("TextButton", Body) -- Destroy Gui Button
TextButton.BackgroundColor3 = Color3.fromRGB(98, 98, 98)
TextButton.Position = UDim2.new(0.012, 0, 0.895, 0)
TextButton.Size = UDim2.new(0, 330 ,0, 40)
TextButton.Style = Enum.ButtonStyle.RobloxButton
TextButton.Text = "Destroy Gui"
TextButton.Font = Enum.Font.SourceSans
TextButton.TextSize = 18
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.ZIndex = 3
-----------
local fov_circle = Drawing.new("Circle")
fov_circle.Thickness = 1
fov_circle.NumSides = 100
fov_circle.Radius = 180
fov_circle.Filled = false
fov_circle.Visible = false
fov_circle.ZIndex = 999
fov_circle.Transparency = 1
fov_circle.Color = Color3.fromRGB(54, 57, 241)
----------- Funtional -----------
Enabled_CheckBox.MouseButton1Up:Connect(function() -- Enabble CheckBox
	if SilentAim_Settings.Enabled == false then
		SilentAim_Settings.Enabled = true
		Enabled_CheckBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	else
		SilentAim_Settings.Enabled = false
		Enabled_CheckBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	end
end)

SilentAim_CheckBox.MouseButton1Up:Connect(function() -- Silent Aim CheckBox
	if SilentAim_Settings.SilentAim_Enabled == false then 
		SilentAim_Settings.SilentAim_Enabled = true
		SilentAim_CheckBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
		fov_circle.Transparency = 0
	else
		SilentAim_Settings.SilentAim_Enabled = false
		SilentAim_CheckBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	end
end)

FovCircle_CheckBox.MouseButton1Up:Connect(function() -- Fov Circle CheckBox
	if SilentAim_Settings.FOVVisible == false then 
		SilentAim_Settings.FOVVisible = true
		FovCircle_CheckBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	else
		SilentAim_Settings.FOVVisible = false
		FovCircle_CheckBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	end
end)

TeamCheck_CheckBox.MouseButton1Up:Connect(function()
	if SilentAim_Settings.TeamCheck == false then
		SilentAim_Settings.TeamCheck = true
		TeamCheck_CheckBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
	else
		SilentAim_Settings.TeamCheck = false
		TeamCheck_CheckBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	end
end)

TextButton.MouseButton1Up:Connect(function()
	ScreenGui:Destroy()
end)

