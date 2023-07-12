-- mydetect.lua
local function detectOS()
   local osname = nil

   if osname ~= nil then
      return osname
   end

   -- Linuxの判定
   if package.config:sub(1, 1) == "/" then
      osname = "Linux"
   end
   -- Windowsの判定
   if os.getenv("windir") then
      osname = "Windows"
   end

   return osname
end

local function executeCommand(command)
   local currentOS = detectOS()
   if currentOS == "Windows" then
      os.execute("powershell -Command " .. command)
   else
      os.execute(command)
   end
end

local function sleepTime(seconds)
   local currentOS = detectOS()
   if currentOS == "Windows"  then
      executeCommand("sleep -m " .. tostring(seconds))
   else
      executeCommand("sleep " .. tostring(seconds))
   end
end

local function clearScreen()
   local currentOS = detectOS()
   if currentOS == "Windows"  then
      executeCommand("cls")
   else
      executeCommand("clear")
   end
end

return {
   sleepTime = sleepTime,
   clearScreen = clearScreen
}
