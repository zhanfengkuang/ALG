//
//  Array.swift
//  ALG
//
//  Created by ctrip on 2021/7/6.
//

import Foundation

// MARK: - 只出现一次的数字
/*给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素*/
/* input: [1, 1, 2, 3, 3], output: 2*/
func singleNumber(_ nums: [Int]) -> Int {
	var result = 0
	for num in nums {
		result ^= num
	}
	return result;
}

// MARK: - 多数元素
/*给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。
你可以假设数组是非空的，并且给定的数组总是存在多数元素
*/
func majorityElement(_ nums: [Int]) -> Int {
	// 遍历数组，出现的数字作为Key，出现的次数作为Value，比较Value的大小
	var map: [Int: Int] = [:]
	for num in nums {
		if map.keys.contains(where: { $0 == num }) {
			map[num] = map[num]! + 1;
		} else {
			map[num] = 1
		}
	}
	var result: Int?
	for element in map{
		if result != nil {
			if map[result!]! < element.value {
				result = element.key
			}
		} else {
			result = element.key
		}
	}
	return result!
}

// MARK: - 189、旋转数组
/**/
func rorate(_ nums: inout [Int], _ k: Int) {
	func reverse(_ nums: inout [Int], _ start: Int, _ count: Int) {
		var start = start, end = start + count
		while start < end {
			nums.swapAt(start, end)
			end -= 1
			start += 1
		}
	}
	let k = k % nums.count
	nums.reverse()
	reverse(&nums, 0, k - 1)
	reverse(&nums, k, nums.count - k - 1)
}
