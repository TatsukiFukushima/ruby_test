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
  i = 0
  localMoney = money
  localWantMoney = wantMoney
  loop {
    localMoney = betByMontecarlo(localMoney)
    i += 1
    if localMoney >= wantMoney then
      return [true, i]
    elsif localMoney < 4 then
      return [false, i]
    end
  }
end

result, i = betByMontecarlos(money, wantMoney)
puts "試行回数: #{i}回"
puts "結果: #{result}"
