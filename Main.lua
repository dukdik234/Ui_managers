local Ui_manager = {}
local Custom_Cloneref = function(org) 
    if typeof(org) ~= "Instance" then
        return org
    end

    local clone = newproxy(true)
    local mt = getmetatable(clone)

    mt.__index = org
    mt.__newindex = org
    mt.__eq = function(a, b) 
        return org == a or org == b
    end
    mt.__tostring = function()
        return tostring(org)
    end
    return mt.__newindex
end 
local cloneref = cloneref or Custom_Cloneref or function(...) return ... end 
local coreui = cloneref(game:GetService("CoreGui"))
local uis = cloneref(game:GetService("UserInputService"))

Ui_manager.__index = Ui_manager

function Ui_manager.new()
    local self = setmetatable({},Ui_manager)
    self.Isopen = false
    self:initialize()

    return self
end

function Ui_manager:initialize()
    self:Cleanui()
    self:Make_maingui()
    self:Make_closeuibut()
end

function Ui_manager:Cleanui()
    for _, v in pairs(coreui:GetChildren()) do
		if v.Name == "Emp_core" then
			v:Destroy()
		end
	end
end

function Ui_manager:Make_maingui()
    if self.Isopen then return end
    print("Make_maingui")
    self.Screenui = cloneref(Instance.new("ScreenGui"))
    self.Screenui.Parent = coreui
    self.Screenui.Name = "Emp_core"
    self.Screenui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    self.Screenui.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets 

    self.Frame = cloneref(Instance.new("Frame"))
    self.Frame.Parent = self.Screenui
    self.Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.Frame.BackgroundTransparency = 1.000
    self.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    self.Frame.BorderSizePixel = 0
    self.Frame.Size = UDim2.new(1, 0, 1, 0)
end
function Ui_manager:Make_closeuibut(callback)
    if self.Isopen then return end
    local Main_but = cloneref(Instance.new("Frame"))
    local ImageButton = cloneref(Instance.new("ImageLabel"))
    print("Button")


    Main_but.Name = "Main_but"
    Main_but.Parent = self.Frame
    Main_but.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Main_but.BackgroundTransparency = 1.000
    Main_but.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Main_but.BorderSizePixel = 0
    Main_but.Position = UDim2.new(0.0498168506, 0, 0.150802433, 0)
    Main_but.Size = UDim2.new(0, 100, 0, 100)

    ImageButton.Parent = Main_but
    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton.BackgroundTransparency = 1.000
    ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageButton.BorderSizePixel = 0
    ImageButton.Size = UDim2.new(0, 100, 0, 100)
    ImageButton.Image = "rbxassetid://109557005690410"

    
    Main_but.Draggable = true
    Main_but.Selectable = true
    Main_but.Active = true

    self.Isopen = true
end



return Ui_manager.new()
