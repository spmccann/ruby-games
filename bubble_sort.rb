# frozen_string_literal: true

def bubble_sort(arr)
  count = 0
  while count < arr.length - 1
    arr.each_index do |num|
      first = arr[num]
      second = arr[num + 1]
      break if arr.length - 1 == num

      if first > second
        arr[num] = second
        arr[num + 1] = first
      end
    end
    count += 1
  end
  p arr
end

arr = [4, 3, 78, 2, 0, 2]
bubble_sort(arr)
