//
//  Array.swift
//  ALG
//
//  Created by ctrip on 2021/7/6.
//

import Foundation

// MARK: - 189、旋转数组
/*

*/
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
