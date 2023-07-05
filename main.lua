-- local a = io.stdin:read()
local waitTime = 0.8
local answer = ""
local answerCount = 0
local answerCountMax = 3
local correct = 0

while true do
   if answerCount < answerCountMax then
      local rnd = math.random(0, 9)

      os.execute("clear")
      print(rnd)

      os.execute("sleep " .. tostring(waitTime))

      answer = answer .. tostring(rnd)
      answerCount = answerCount + 1
   else
      os.execute("clear")

      print("現在の正解数: " .. tostring(correct))
      io.write("答えを入力してください。: ")
      io.flush()
      local val = io.read()

      if val == answer then
         print("正解!")
         os.execute("sleep 1")

         if answerCountMax < 10 then
            answerCountMax = answerCountMax + 1
         end

         if waitTime > 0.2 then
            waitTime = waitTime - 0.1
         end

         answerCount = 0
         correct = correct + 1
         answer = ""
      else
         print("不正解!")
         print("あなたの正解数は" .. tostring(correct) .. "でした。")
         break
      end
   end
end
