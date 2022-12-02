def stock_picker(arr)
  profits = Array.new

  arr.each_with_index {
    |buy_price, buy_index|

    profit = 0
    buy_day_index = 0
    sell_day_index = 0

    for i in (buy_index + 1)..(arr.length - 1)
      sell_price = arr[i]
      sell_index = i

      if sell_price - buy_price > profit
        profit = sell_price - buy_price
        buy_day_index = buy_index
        sell_day_index = sell_index
      end
    end

    current_profit = {
      profit: profit,
      buy_day_index: buy_day_index,
      sell_day_index: sell_day_index
    }

    profits.push(current_profit)

  }

  final_profit = profits.reduce {
    |a, b|
    a = b if b[:profit] > a[:profit]
    a
  }

  return [final_profit[:buy_day_index], final_profit[:sell_day_index]]
end

puts stock_picker([17,3,6,9,15,8,6,1,10])