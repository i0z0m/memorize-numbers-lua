-- mydetect.lua
local osname = nil

local function detectOS()
   if osname then
      return osname
   end

   -- Unixの判定
   local unix = false
   local uname = io.popen("uname"):read("*l")
   if uname then
      if uname == "Linux" then
         osname = "Linux"
         unix = true
      elseif uname == "Darwin" then
         osname = "macOS"
         unix = true
      elseif uname:match("^BSD") then
         osname = "BSD"
         unix = true
      end
   end

   -- Windowsの判定
   if not unix then
      local win = os.getenv("windir")
      if win then
         osname = "Windows"
      end
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
   if currentOS == "Windows" then
      executeCommand("ping 127.0.0.1 -n " .. tostring(seconds + 1) .. " > nul")
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
   detectOS = detectOS,
   sleepTime = sleepTime,
   clearScreen = clearScreen
}
