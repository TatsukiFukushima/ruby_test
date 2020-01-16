print "所持金: "
money = gets.chomp.to_i
print "目標金額: "
wantMoney = gets.chomp.to_i
print "試行回数: "
loop = gets.chomp.to_i
puts "--------------------"

def betByMontecarlo(money)
  localMoney = money
  bet = 0
  array = [1, 2, 3]

  loop {
    bet = array[0] + array[array.length-1]
    if localMoney >= bet then
      localMoney -= bet
    else
      break
    end
    if rand(2) == 1 then
      localMoney = localMoney + bet + bet
      array.shift()
      array.delete_at(array.length-1)
      if array.length == 0 then
        break
      end
    else
      array.push(bet)
    end
  }
  return localMoney
end

def betByMontecarlos(money, wantMoney)
  localMoney = money
  localWantMoney = wantMoney
  loop {
    localMoney = betByMontecarlo(localMoney)
    if localMoney >= wantMoney then
      return true, localMoney
    elsif localMoney < 4 then
      return false, localMoney
    end
  }
end

winCount = 0
totalMoney = 0
for i in 1..loop do
  result, lastMoney = betByMontecarlos(money, wantMoney)
  if result then
    winCount += 1
  end
  totalMoney += lastMoney
end

puts "勝率: #{winCount * 100 / loop.to_f}%"
puts "期待値: #{(totalMoney / loop.to_f) - money}円"
