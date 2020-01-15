loop = 100

def betByMontecarlo(totalMoney)
  money = 0
  maxMoney = 0
  minMoney = 0
  bet = 0
  array = [1, 2, 3]

  loop {
    bet = array[0] + array[array.length-1]
    money -= bet
    if money < minMoney then
      minMoney = money
    end
    if rand(2) == 1 then
      money = money + bet + bet
      if money > maxMoney then
        maxMoney = money
      end
      array.shift()
      array.delete_at(array.length-1)
      if array.length == 0 then
        break
      end
    else
      array.push(bet)
    end
  }

  result = [money, maxMoney, minMoney]
  return result
end

totalMoney = 0
totalMaxMoney = 0
totalMinMoney = 0
minMinMoney = 0
countWin = 0

for i in 1..loop do
  result = betByMontecarlo(totalMoney)
  totalMoney += result[0]
  totalMaxMoney += result[1]
  totalMinMoney += result[2]
  if result[0] > 0 then
    countWin += 1
  end
  if result[2] < minMinMoney then
    minMinMoney = result[2]
  end
end

puts "試行回数: #{loop}回賭ける"
puts "勝率: #{countWin * 100 / loop}%"
puts "獲得額: #{totalMoney}"
puts "平均最高所持金: #{totalMaxMoney / loop}"
puts "平均最低所持金: #{totalMinMoney / loop}"
puts "最低所持金: #{minMinMoney}"
