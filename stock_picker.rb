# frozen_string_literal: true

# best day to buy and sell stock
def stock_picker(prices)
  pick_list = {}
  prices.each_index do |price|
    sell = prices[-price - 1]
    buy = prices.slice(0..-price - 1).min
    pick = sell - buy
    pick_list[pick] = [prices.index(buy), prices.index(sell)]
  end
  p pick_list.max
end
example = [17, 3, 6, 9, 15, 8, 6, 1, 10]
stock_picker(example)
