loop = 10000
$money = 100000
$minMoney = $money

def betByMontecarlo()
  bet = 0
  array = [1, 2, 3]

  loop {
    bet = array[0] + array[array.length-1]
    if $money >= bet then
      $money -= bet
    else
      break
    end
    if $money < $minMoney then
      $minMoney = $money
    end
    if rand(2) == 1 then
      $money = $money + bet + bet
      array.shift()
      array.delete_at(array.length-1)
      if array.length == 0 then
        break
      end
    else
      array.push(bet)
    end
  }
end

for i in 1..loop do
  betByMontecarlo()
end

puts "試行回数: #{loop}回賭ける"
puts "最終金額: #{$money}"
puts "最低所持金: #{$minMoney}"
