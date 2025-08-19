local UI = {}
UI.__index = UI

type FontType = Enum.Font | Font

type Config = {
    font: FontType?,
    name: string
}

local function setDefaultsToConfig(config: Config)
    config.font = config.font or Font.fromId(11702779517)
    if typeof(config.font) == "EnumItem" then
        config.font = Font.fromName(config.font.Name)
    end

    return config
end

function UI.TextButton(config: Config)
    local self = setmetatable({}, UI)
    self.Config = setDefaultsToConfig(config)

    self.Instance = Instance.new("TextButton")
    self.Instance.Name = self.Config.name
    self.Instance.FontFace = self.Config.font
end

return UI