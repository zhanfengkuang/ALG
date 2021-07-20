//
//  Array.swift
//  ALG
//
//  Created by ctrip on 2021/7/6.
//

import Foundation

// MARK: - 乘积最大子数组（动态规划）
/*
[2, 3, -2, 4] 6
[-2, 0, -1] 0
*/
func maxProduct(_ nums: [Int]) -> Int {
	var maxValue = Int.min, imax = 1, imin = 1
	nums.forEach { value in
		if (value < 0) {
			swap(&imax, &imin)
		}
		imax = max(imax * value, value)
		imin = min(imin * value, value)
		maxValue = max(maxValue, imax)
	}
	return maxValue
}


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

// MARK: - 合并两个有序数组
/*	给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
	初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。你可以假设 nums1 的空间大小等于 m + n，这样它就有足够的空间保存来自 nums2 的元素。
	input：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
	output：[1,2,2,3,5,6]
*/
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
	var nums3: [Int] = [], index1 = 0, index2 = 0
	(0..<(m+n)).forEach { _ in
		if index2 == n - 1 {
			nums3.append(nums1[index1])
			index1 += 1
		}
		if index1 == m - 1 {
			nums3.append(nums2[index2])
			index2 += 1
		}
		if nums1[index1] < nums2[index2]  {
			nums3.append(nums1[index1])
			index1 += 1
		} else {
			nums3.append(nums2[index2])
			index2 += 1
		}
	}
	nums1 = nums3
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

// MARK: - 打乱数组
/*
从数组中每次随机取出一个数字，也可以使用这中方式
先打乱数组，然后从改数组中依次取出
*/
class ShuffleSloution {
	let nums: [Int]
	
	init(_ nums: [Int]) {
		self.nums = nums
	}
	
	func reset() -> [Int] {
		return nums
	}
	
	func shuffle() -> [Int] {
		var shuffleArray = nums
		let count = nums.count
		// 遍历数组，将改位置的值与随机位置的值交换
		(0..<count).forEach { index in
			shuffleArray.swapAt(index, Int.random(in: 0..<count))
		}
		return shuffleArray
	}
}

// MARK: 两个数组交集2
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
	var map: [Int: Int] = [:]
	var result: [Int] = []
	for value in nums1 {
		map[value] = (map[value] ?? 0) + 1
	}
	for value in nums2 {
		if let count = map[value], count > 0 {
			result.append(value)
			map[value] = count - 1
		}
	}
	return []
}
