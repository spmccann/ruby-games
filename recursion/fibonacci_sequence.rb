# frozen_string_literal: true

def fibs(end_num)
  arr = [0]
  num = 1
  val = 0
  while val < end_num + 1
    val = num + val
    num = val - num
    arr.push(val)
  end
  p arr
end

fibs(8)

def fibs_rec(end_num)
  if end_num < 2
    end_num
  else
    fibs_rec(end_num - 1) + fibs_rec(end_num - 2)
  end
end

p fibs_rec(8)
