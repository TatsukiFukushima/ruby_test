loop = 1000
money = 10000
wantMoney = 11000

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
      return true
    elsif localMoney < 4 then
      return false
    end
  }
end

winCount = 0
for i in 1..loop do
  if betByMontecarlos(money, wantMoney) then
    winCount += 1
  end
end
puts "試行回数: #{loop}回"
puts "初期所持金: #{money}"
puts "期待所持金: #{wantMoney}"
puts "勝率: #{winCount * 100 / loop}"
