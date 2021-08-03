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

// MARK: - 寻找两个正序数组的中位数 ✨✨✨
/*
给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
输入：nums1 = [1,3], nums2 = [2]
输出：2.00000
输入：nums1 = [1,2], nums2 = [3,4]
输出：2.50000
解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays/solution/xun-zhao-liang-ge-you-xu-shu-zu-de-zhong-wei-s-114/
*/
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
	return 0
}

// MARK: - 盛最多水的容器 ✨✨ 双指针
/*
给你 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0) 。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
说明：你不能倾斜容器。
链接：https://leetcode-cn.com/problems/container-with-most-water
输入：height = [1,1]
输出：1
*/
func maxArea(_ height: [Int]) -> Int {
	guard height.count > 1 else { return 0 }
	var front = 0, tail = height.count - 1
	var area = (tail - front) * min(height[tail], height[front])
	while front < tail {
		area = max(area, (tail - front) * min(height[tail], height[front]))
		if height[front] <= height[tail] {
			front += 1
		} else {
			tail -= 1
		}
	}
	return area
}

// MARK: - 三数之和 ✨✨
/*
给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
注意：答案中不可以包含重复的三元组。
输入：nums = [-1,0,1,2,-1,-4]
输出：[[-1,-1,2],[-1,0,1]]
输入：nums = []
输出：[]
链接：https://leetcode-cn.com/problems/3sum
*/
// [-4, -1, -1, 0, 1, 2]
func threeSum(_ nums: [Int]) -> [[Int]] {
	guard nums.count > 2 else { return [] }
	var result: [[Int]] = [], first = 0
	let nums = nums.sorted(), n = nums.count
	for (index, value) in nums.enumerated() {
		first = index
		if first > 0 && value == nums[first - 1] {
			continue
		}
		var second = first + 1, third = n - 1
		(second..<n).forEach { secondIndex in
			second = secondIndex
			while third > second {
				let sum = value + nums[second] + nums[third]
				if sum == 0 {
					result.append([value, nums[second], nums[third]])
					break
				} else if sum > 0 {
					third -= 1
				} else {
					break
				}
			}
		}
	}
	return result
}

// MARK: - 电话号码的字母组合 ✨✨
/*
给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。
给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
输入：digits = "23"
输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]
输入：digits = ""
输出：[]
链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
方法一：回溯
当题目中出现 “所有组合” 等类似字眼时，我们第一感觉就要想到用回溯。

定义函数 backtrack(combination, nextdigit)，当 nextdigit 非空时，对于 nextdigit[0] 中的每一个字母 letter，执行回溯 backtrack(combination + letter,nextdigit[1:]，直至 nextdigit 为空。最后将 combination 加入到结果中。
*/
func letterCombinations(_ digits: String) -> [String] {
	return []
}

// MARK: -  在排序数组中查找元素的第一个和最后一个位置 ✨✨
/*
给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
如果数组中不存在目标值 target，返回 [-1, -1]。
进阶：
你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
输入：nums = [5,7,7,8,8,10], target = 8
输出：[3,4]
输入：nums = [5,7,7,8,8,10], target = 6
输出：[-1,-1]
方法一：二分查找
链接：https://leetcode-cn.com/problems/find-first-and-last-position-of-element-in-sorted-array
*/
func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
[]
	}

// MARK: - 缺失的第一个正数  ✨✨✨
/*
给你一个未排序的整数数组 nums ，请你找出其中没有出现的最小的正整数。
请你实现时间复杂度为 O(n) 并且只使用常数级别额外空间的解决方案。
输入：nums = [1,2,0]
输出：3
输入：nums = [3,4,-1,1]
输出：2
方法一：哈希表
方法二：置换
链接：https://leetcode-cn.com/problems/first-missing-positive
*/
func firstMissingPositive(_ nums: [Int]) -> Int {
0
	}

// MARK: - 接雨水  ✨✨✨
/*
给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
输出：6
解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
输入：height = [4,2,0,3,2,5]
输出：9
动态规划
链接：https://leetcode-cn.com/problems/trapping-rain-water
*/
func trap(_ height: [Int]) -> Int {
0
	}

// MARK: - 全排列  ✨✨
/*
给定一个不含重复数字的数组 nums ，返回其 所有可能的全排列 。你可以 按任意顺序 返回答案。
输入：nums = [1,2,3]
输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
输入：nums = [0,1]
输出：[[0,1],[1,0]]
方法一：回溯
链接：https://leetcode-cn.com/problems/permutations
*/
func permute(_ nums: [Int]) -> [[Int]] {
[]
	}

// MARK: - 字母异位词分组  ✨✨
/*
给定一个字符串数组，将字母异位词组合在一起。可以按任意顺序返回结果列表。
字母异位词指字母相同，但排列不同的字符串。
输入: strs = ["eat", "tea", "tan", "ate", "nat", "bat"]
输出: [["bat"],["nat","tan"],["ate","eat","tea"]]
输入: strs = [""]
输出: [[""]]
方法一：排序
方法二：计数
链接：https://leetcode-cn.com/problems/group-anagrams
*/
func groupAnagrams(_ strs: [String]) -> [[String]] {
[]
   }

// MARK - 颜色分类  ✨✨
/*
给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
输入：nums = [2,0,2,1,1,0]
输出：[0,0,1,1,2,2]
输入：nums = [2,0,1]
输出：[0,1,2]
输入：nums = [0]
输出：[0]
方法二：双指针
链接：https://leetcode-cn.com/problems/sort-colors
*/
func sortColors(_ nums: inout [Int]) {
	let n = nums.count
	var front = 0, tail = n - 1
	(0..<n).forEach { i in
		while nums[i] == 2 && i <= tail {
			nums.swapAt(i, tail)
			tail -= 1
		}
		if nums[i] == 0 {
			nums.swapAt(i, front)
			front += 1
		}
	}
}

// MARK: - 子集  ✨✨
/*
给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。
解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
输入：nums = [1,2,3]
输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
输入：nums = [0]
输出：[[],[0]]
方法一：迭代法实现子集枚举
方法二：递归法实现子集枚举
链接：https://leetcode-cn.com/problems/subsets
*/
func subsets(_ nums: [Int]) -> [[Int]] {
[]
	}

// MARK: - 解码方法  ✨✨
/*
一条包含字母 A-Z 的消息通过以下映射进行了 编码 ：

'A' -> 1
'B' -> 2
...
'Z' -> 26
要 解码 已编码的消息，所有数字必须基于上述映射的方法，反向映射回字母（可能有多种方法）。例如，"11106" 可以映射为：
"AAJF" ，将消息分组为 (1 1 10 6)
"KJF" ，将消息分组为 (11 10 6)
注意，消息不能分组为  (1 11 06) ，因为 "06" 不能映射为 "F" ，这是由于 "6" 和 "06" 在映射中并不等价。
给你一个只含数字的 非空 字符串 s ，请计算并返回 解码 方法的 总数 。
题目数据保证答案肯定是一个 32 位 的整数。
输入：s = "12"
输出：2
解释：它可以解码为 "AB"（1 2）或者 "L"（12）。
输入：s = "226"
输出：3
解释：它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6)
方法一：动态规划。
链接：https://leetcode-cn.com/problems/decode-ways
*/
func numDecodings(_ s: String) -> Int {
0
	}

// MARK: - 买卖股票的最佳时机
/*
给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
输入：[7,1,5,3,6,4]
输出：5
解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
	 注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
输入：prices = [7,6,4,3,1]
输出：0
解释：在这种情况下, 没有交易完成, 所以最大利润为 0。
方法二：一次遍历
链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock
*/
func maxProfit(_ prices: [Int]) -> Int {
0
	}

// MARK: - 单词接龙
/*
字典 wordList 中从单词 beginWord 和 endWord 的 转换序列 是一个按下述规格形成的序列：
序列中第一个单词是 beginWord 。
序列中最后一个单词是 endWord 。
每次转换只能改变一个字母。
转换过程中的中间单词必须是字典 wordList 中的单词。
给你两个单词 beginWord 和 endWord 和一个字典 wordList ，找到从 beginWord 到 endWord 的 最短转换序列 中的 单词数目 。如果不存在这样的转换序列，返回 0。
输入：beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
输出：5
解释：一个最短转换序列是 "hit" -> "hot" -> "dot" -> "dog" -> "cog", 返回它的长度 5。
输入：beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
输出：0
解释：endWord "cog" 不在字典中，所以无法进行转换。
链接：https://leetcode-cn.com/problems/word-ladder
方法一：广度优先搜索 + 优化建图
*/
func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
0
	}

// MARK: - 最长连续序列  ✨✨
/*
给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。
请你设计并实现时间复杂度为 O(n) 的算法解决此问题。
输入：nums = [100,4,200,1,3,2]
输出：4
解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
示例 2：
输入：nums = [0,3,7,2,5,8,4,6,0,1]
输出：9
方法一：哈希表
链接：https://leetcode-cn.com/problems/longest-consecutive-sequence
*/
func longestConsecutive(_ nums: [Int]) -> Int {
0
	}

// MARK: - 加油站
/*
在一条环路上有 N 个加油站，其中第 i 个加油站有汽油 gas[i] 升。
你有一辆油箱容量无限的的汽车，从第 i 个加油站开往第 i+1 个加油站需要消耗汽油 cost[i] 升。你从其中的一个加油站出发，开始时油箱为空。
如果你可以绕环路行驶一周，则返回出发时加油站的编号，否则返回 -1。
说明:
如果题目有解，该答案即为唯一答案。
输入数组均为非空数组，且长度相同。
输入数组中的元素均为非负数。
输入:
gas  = [1,2,3,4,5]
cost = [3,4,5,1,2]
解释:
从 3 号加油站(索引为 3 处)出发，可获得 4 升汽油。此时油箱有 = 0 + 4 = 4 升汽油
开往 4 号加油站，此时油箱有 4 - 1 + 5 = 8 升汽油
开往 0 号加油站，此时油箱有 8 - 2 + 1 = 7 升汽油
开往 1 号加油站，此时油箱有 7 - 3 + 2 = 6 升汽油
开往 2 号加油站，此时油箱有 6 - 4 + 3 = 5 升汽油
开往 3 号加油站，你需要消耗 5 升汽油，正好足够你返回到 3 号加油站。
因此，3 可为起始索引。
输入:
gas  = [2,3,4]
cost = [3,4,3]
输出: -1
解释:
你不能从 0 号或 1 号加油站出发，因为没有足够的汽油可以让你行驶到下一个加油站。
我们从 2 号加油站出发，可以获得 4 升汽油。 此时油箱有 = 0 + 4 = 4 升汽油
开往 0 号加油站，此时油箱有 4 - 3 + 2 = 3 升汽油
开往 1 号加油站，此时油箱有 3 - 3 + 3 = 3 升汽油
你无法返回 2 号加油站，因为返程需要消耗 4 升汽油，但是你的油箱只有 3 升汽油。
因此，无论怎样，你都不可能绕环路行驶一周。
方法一：一次遍历
链接：https://leetcode-cn.com/problems/gas-station
*/
func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
0
	}

// MARK: - 直线上最多的点数  ✨✨✨
/*
给你一个数组 points ，其中 points[i] = [xi, yi] 表示 X-Y 平面上的一个点。求最多有多少个点在同一条直线上。
输入：points = [[1,1],[2,2],[3,3]]
输出：3
输入：points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
输出：4
方法一：哈希表
链接：https://leetcode-cn.com/problems/max-points-on-a-line
*/
func maxPoints(_ points: [[Int]]) -> Int {
0
	}

// MARK: - 寻找峰值
/*
峰值元素是指其值大于左右相邻值的元素。
给你一个输入数组 nums，找到峰值元素并返回其索引。数组可能包含多个峰值，在这种情况下，返回 任何一个峰值 所在位置即可。
你可以假设 nums[-1] = nums[n] = -∞ 。
输入：nums = [1,2,3,1]
输出：2
解释：3 是峰值元素，你的函数应该返回其索引 2。
输入：nums = [1,2,1,3,5,6,4]
输出：1 或 5
解释：你的函数可以返回索引 1，其峰值元素为 2；
     或者返回索引 5， 其峰值元素为 6。
方法一: 线性扫描
方法二：递归二分查找
链接：https://leetcode-cn.com/problems/find-peak-element
*/
func findPeakElement(_ nums: [Int]) -> Int {
0
	}

// MARK: - 打家劫舍
/*
你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。
给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。
示例 1：
输入：[1,2,3,1]
输出：4
解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
     偷窃到的最高金额 = 1 + 3 = 4 。
示例 2：
输入：[2,7,9,3,1]
输出：12
解释：偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
     偷窃到的最高金额 = 2 + 9 + 1 = 12
方法一：动态规划
链接：https://leetcode-cn.com/problems/house-robber
*/
func rob(_ nums: [Int]) -> Int {
0
	}

// MARK: - 岛屿数量
/*
给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。
此外，你可以假设该网格的四条边均被水包围。
示例 1：
输入：grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
输出：1
示例 2：
输入：grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
输出：3
方法一：深度优先搜索
链接：https://leetcode-cn.com/problems/number-of-islands
*/
func numIslands(_ grid: [[Character]]) -> Int {
0
	}

// MARK: - 课程表
/*
你这个学期必须选修 numCourses 门课程，记为 0 到 numCourses - 1 。
在选修某些课程之前需要一些先修课程。 先修课程按数组 prerequisites 给出，其中 prerequisites[i] = [ai, bi] ，表示如果要学习课程 ai 则 必须 先学习课程  bi 。
例如，先修课程对 [0, 1] 表示：想要学习课程 0 ，你需要先完成课程 1 。
请你判断是否可能完成所有课程的学习？如果可以，返回 true ；否则，返回 false 。
示例 1：
输入：numCourses = 2, prerequisites = [[1,0]]
输出：true
解释：总共有 2 门课程。学习课程 1 之前，你需要完成课程 0 。这是可能的。
示例 2：
输入：numCourses = 2, prerequisites = [[1,0],[0,1]]
输出：false
解释：总共有 2 门课程。学习课程 1 之前，你需要先完成​课程 0 ；并且学习课程 0 之前，你还应先完成课程 1 。这是不可能的
方法一：深度优先搜索
链接：https://leetcode-cn.com/problems/course-schedule
*/
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
false
	}

// MARK: - 滑动窗口最大值
/*
给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

返回滑动窗口中的最大值。
示例 1：
输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
输出：[3,3,5,5,6,7]
解释：
滑动窗口的位置                最大值
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7
示例 2：

输入：nums = [1], k = 1
输出：[1]
示例 3：
输入：nums = [1,-1], k = 1
输出：[1,-1]
示例 4：
输入：nums = [9,11], k = 2
输出：[11]
示例 5：
输入：nums = [4,-2], k = 2
输出：[4]
链接：https://leetcode-cn.com/problems/sliding-window-maximum
*/
func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
[]
	}

// MARK: - 移动零
/*
给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
示例:
输入: [0,1,0,3,12]
输出: [1,3,12,0,0]
链接：https://leetcode-cn.com/problems/move-zeroes
*/
func moveZeroes(_ nums: inout [Int]) {

	}

// MARK: - 寻找重复数
/*
给定一个包含 n + 1 个整数的数组 nums ，其数字都在 1 到 n 之间（包括 1 和 n），可知至少存在一个重复的整数。
假设 nums 只有 一个重复的整数 ，找出 这个重复的数 。
你设计的解决方案必须不修改数组 nums 且只用常量级 O(1) 的额外空间。
示例 1：
输入：nums = [1,3,4,2,2]
输出：2
示例 2：
输入：nums = [3,1,3,4,2]
输出：3
示例 3：
输入：nums = [1,1]
输出：1
示例 4：
输入：nums = [1,1,2]
输出：1
方法一：二分查找
方法三：快慢指针
链接：https://leetcode-cn.com/problems/find-the-duplicate-number
*/
func findDuplicate(_ nums: [Int]) -> Int {
0
	}

// MARK: - 生命游戏
/*
根据 百度百科 ，生命游戏，简称为生命，是英国数学家约翰·何顿·康威在 1970 年发明的细胞自动机。
给定一个包含 m × n 个格子的面板，每一个格子都可以看成是一个细胞。每个细胞都具有一个初始状态：1 即为活细胞（live），或 0 即为死细胞（dead）。每个细胞与其八个相邻位置（水平，垂直，对角线）的细胞都遵循以下四条生存定律：
如果活细胞周围八个位置的活细胞数少于两个，则该位置活细胞死亡；
如果活细胞周围八个位置有两个或三个活细胞，则该位置活细胞仍然存活；
如果活细胞周围八个位置有超过三个活细胞，则该位置活细胞死亡；
如果死细胞周围正好有三个活细胞，则该位置死细胞复活；
下一个状态是通过将上述规则同时应用于当前状态下的每个细胞所形成的，其中细胞的出生和死亡是同时发生的。给你 m x n 网格面板 board 的当前状态，返回下一个状态。
输入：board = [[0,1,0],[0,0,1],[1,1,1],[0,0,0]]
输出：[[0,0,0],[1,0,1],[0,1,1],[0,1,0]]
输入：board = [[1,1],[1,0]]
输出：[[1,1],[1,1]]
链接：https://leetcode-cn.com/problems/game-of-life
*/
func gameOfLife(_ board: inout [[Int]]) {

	}

// MARK: - Fizz Buzz
/*
写一个程序，输出从 1 到 n 数字的字符串表示。

1. 如果 n 是3的倍数，输出“Fizz”；

2. 如果 n 是5的倍数，输出“Buzz”；

3.如果 n 同时是3和5的倍数，输出 “FizzBuzz”。

示例：

n = 15,

返回:
[
	"1",
	"2",
	"Fizz",
	"4",
	"Buzz",
	"Fizz",
	"7",
	"8",
	"Fizz",
	"Buzz",
	"11",
	"Fizz",
	"13",
	"14",
	"FizzBuzz"
]
方法二： 字符串连
方法三 用散列表
链接：https://leetcode-cn.com/problems/fizz-buzz
*/
func fizzBuzz(_ n: Int) -> [String] {
[]
	}

// MARK: - 有序矩阵中第 K 小的元素
/*
给你一个 n x n 矩阵 matrix ，其中每行和每列元素均按升序排序，找到矩阵中第 k 小的元素。
请注意，它是 排序后 的第 k 小元素，而不是第 k 个 不同 的元素。
示例 1：

输入：matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
输出：13
解释：矩阵中的元素为 [1,5,9,10,11,12,13,13,15]，第 8 小元素是 13
示例 2：

输入：matrix = [[-5]], k = 1
输出：-5
方法一：直接排序
方法二：归并排序
方法三：二分查找
链接：https://leetcode-cn.com/problems/kth-smallest-element-in-a-sorted-matrix
*/
func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
0
	}

// MARK: - 递增的三元子序列
/*
给你一个整数数组 nums ，判断这个数组中是否存在长度为 3 的递增子序列。
如果存在这样的三元组下标 (i, j, k) 且满足 i < j < k ，使得 nums[i] < nums[j] < nums[k] ，返回 true ；否则，返回 false
示例 1：

输入：nums = [1,2,3,4,5]
输出：true
解释：任何 i < j < k 的三元组都满足题意
示例 2：

输入：nums = [5,4,3,2,1]
输出：false
解释：不存在满足题意的三元组
示例 3：

输入：nums = [2,1,5,0,4,6]
输出：true
解释：三元组 (3, 4, 5) 满足题意，因为 nums[3] == 0 < nums[4] == 4 < nums[5] == 6
链接：https://leetcode-cn.com/problems/increasing-triplet-subsequence
*/
func increasingTriplet(_ nums: [Int]) -> Bool {
false
	}

// MARK: - 矩阵中的最长递增路径
/*
给定一个 m x n 整数矩阵 matrix ，找出其中 最长递增路径 的长度。

对于每个单元格，你可以往上，下，左，右四个方向移动。 你 不能 在 对角线 方向上移动或移动到 边界外（即不允许环绕）。
示例 1：
输入：matrix = [[9,9,4],[6,6,8],[2,1,1]]
输出：4
解释：最长递增路径为 [1, 2, 6, 9]。
示例 2：
输入：matrix = [[3,4,5],[3,2,6],[2,2,1]]
输出：4
解释：最长递增路径是 [3, 4, 5, 6]。注意不允许在对角线方向上移动。
示例 3：
输入：matrix = [[1]]
输出：1
方法一：记忆化深度优先搜索
链接：https://leetcode-cn.com/problems/longest-increasing-path-in-a-matrix
*/

// MARK: - 摆动排序 II
/*
给你一个整数数组 nums，将它重新排列成 nums[0] < nums[1] > nums[2] < nums[3]... 的顺序。
你可以假设所有输入数组都可以得到满足题目要求的结果。
示例 1：
输入：nums = [1,5,1,1,6,4]
输出：[1,6,1,5,1,4]
解释：[1,4,1,5,1,6] 同样是符合题目要求的结果，可以被判题程序接受。
示例 2：
输入：nums = [1,3,2,2,3,1]
输出：[2,3,1,3,1,2]
链接：https://leetcode-cn.com/problems/wiggle-sort-ii
*/
func wiggleSort(_ nums: inout [Int]) {

	}

// MARK: - 零钱兑换
/*
给你一个整数数组 coins ，表示不同面额的硬币；以及一个整数 amount ，表示总金额。
计算并返回可以凑成总金额所需的 最少的硬币个数 。如果没有任何一种硬币组合能组成总金额，返回 -1 。
你可以认为每种硬币的数量是无限的。
示例 1：

输入：coins = [1, 2, 5], amount = 11
输出：3
解释：11 = 5 + 5 + 1
示例 2：

输入：coins = [2], amount = 3
输出：-1
示例 3：

输入：coins = [1], amount = 0
输出：0
示例 4：

输入：coins = [1], amount = 1
输出：1
示例 5：

输入：coins = [1], amount = 2
输出：2
链接：https://leetcode-cn.com/problems/coin-change
*/
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
0
	}

// MARK: - 最长递增子序列
/*
给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。

子序列是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序列。

示例 1：

输入：nums = [10,9,2,5,3,7,101,18]
输出：4
解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。
示例 2：

输入：nums = [0,1,0,3,2,3]
输出：4
示例 3：

输入：nums = [7,7,7,7,7,7,7]
输出：1
方法一：动态规划
链接：https://leetcode-cn.com/problems/longest-increasing-subsequence
*/
func lengthOfLIS(_ nums: [Int]) -> Int {
0
	}

// MARK: - 数据流的中位数
/*
中位数是有序列表中间的数。如果列表长度是偶数，中位数则是中间两个数的平均值。

例如，

[2,3,4] 的中位数是 3

[2,3] 的中位数是 (2 + 3) / 2 = 2.5

设计一个支持以下两种操作的数据结构：

void addNum(int num) - 从数据流中添加一个整数到数据结构中。
double findMedian() - 返回目前所有元素的中位数。
示例：

addNum(1)
addNum(2)
findMedian() -> 1.5
addNum(3)
findMedian() -> 2
方法一：简单排序
链接：https://leetcode-cn.com/problems/find-median-from-data-stream
*/
class MedianFinder {

	/** initialize your data structure here. */
	init() {

	}
	
	func addNum(_ num: Int) {
0
	}
	
	func findMedian() -> Double {
0
	}
}
