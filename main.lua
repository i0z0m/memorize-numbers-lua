local mydetect = require("mydetect")
local sleepTime = mydetect.sleepTime
local clearScreen = mydetect.clearScreen

-- local a = io.stdin:read()
local waitTime = 1
local answer = ""
local answerCount = 0
local answerCountMax = 3
local winCount = 0

while true do
   if answerCount < answerCountMax then
      local rnd = math.random(0, 9)

      clearScreen()
      print(rnd)

      sleepTime(waitTime)

      answer = answer .. tostring(rnd)
      answerCount = answerCount + 1
   else
      clearScreen()

      print("Your current numbers of correct answers is " .. tostring(winCount))
      io.write("Enter your answer: ")
      io.flush()
      local val = io.read()

      if val == answer then
         print("You win!")
         sleepTime(1)

         if answerCountMax < 6 then
            answerCountMax = answerCountMax + 1
         else
            answerCountMax = 3
            if waitTime > 0 then
               waitTime = waitTime - 0.1
            end
         end

         answerCount = 0
         winCount = winCount + 1
         answer = ""
      else
         print("You lost!")
         print("Your numbers of correct answers was " .. tostring(winCount))
         break
      end
   end
end
