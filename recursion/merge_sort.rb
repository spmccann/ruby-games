# frozen_string_literal: true

def merge_sort(arr)
  if arr.length < 2
    arr
  else
    left = arr[0..(arr.length / 2 - 1)]
    right = arr[(arr.length / 2)..-1]
    merge_sort(left)
    merge_sort(right)
    elem = 0
    elem_l = 0
    elem_r = 0
    while elem_l < left.length && elem_r < right.length
      if left[elem_l] <= right[elem_r]
        arr[elem] = left[elem_l]
        elem_l += 1
      else
        arr[elem] = right[elem_r]
        elem_r += 1
      end
      elem += 1
    end
    while elem_l < left.length
      arr[elem] = left[elem_l]
      elem_l += 1
      elem += 1
    end
    while elem_r < right.length
      arr[elem] = right[elem_r]
      elem_r += 1
      elem += 1
    end
  end
  p arr
end

merge_sort([5, 0, 8, 3, 1, 6, 2, 4, 7, 9])
