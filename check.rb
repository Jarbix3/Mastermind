# frozen_string_literal: true

arr = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
arr.map!(&:to_s)
puts arr.map(&:class)
