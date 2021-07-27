//
//  Number.swift
//  ALG
//
//  Created by Maple on 2021/7/25.
//

import Foundation

// MARK: - 两数相除 ✨✨
/*
给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。
返回被除数 dividend 除以除数 divisor 得到的商。
整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2
输入: dividend = 10, divisor = 3
输出: 3
解释: 10/3 = truncate(3.33333..) = truncate(3) = 3
输入: dividend = 7, divisor = -3
输出: -2
解释: 7/-3 = truncate(-2.33333..) = -2
链接：https://leetcode-cn.com/problems/divide-two-integers
*/
func divide(_ dividend: Int, _ divisor: Int) -> Int {
0
	}

// MARK: - 搜索旋转排序数组  ✨✨
/*
整数数组 nums 按升序排列，数组中的值 互不相同 。
在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。
给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的下标，否则返回 -1 。
输入：nums = [4,5,6,7,0,1,2], target = 0
输出：4
输入：nums = [4,5,6,7,0,1,2], target = 3
输出：-1
方法一：二分查找
链接：https://leetcode-cn.com/problems/search-in-rotated-sorted-array
*/
func search(_ nums: [Int], _ target: Int) -> Int {
0
	}

// MARK: - Pow(x, n)  ✨✨
/*
实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，xn）。
输入：x = 2.00000, n = 10
输出：1024.00000
输入：x = 2.10000, n = 3
输出：9.26100
输入：x = 2.00000, n = -2
输出：0.25000
解释：2-2 = 1/22 = 1/4 = 0.25
快速幂 + 递归
链接：https://leetcode-cn.com/problems/powx-n
*/
func myPow(_ x: Double, _ n: Int) -> Double {
0
	}

// MARK: - 跳跃游戏 ✨✨
/*
给定一个非负整数数组 nums ，你最初位于数组的 第一个下标 。
数组中的每个元素代表你在该位置可以跳跃的最大长度。
判断你是否能够到达最后一个下标。
输入：nums = [2,3,1,1,4]
输出：true
解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。
输入：nums = [3,2,1,0,4]
输出：false
解释：无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。
方法一：贪心
链接：https://leetcode-cn.com/problems/jump-game
*/
func canJump(_ nums: [Int]) -> Bool {
false
	}
// MARK: - 合并区间  ✨✨
/*
以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间。
输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
输出：[[1,6],[8,10],[15,18]]
解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
输入：intervals = [[1,4],[4,5]]
输出：[[1,5]]
解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。
方法一：排序
链接：https://leetcode-cn.com/problems/merge-intervals
*/
func merge(_ intervals: [[Int]]) -> [[Int]] {
[]
   }

// MARK: - 不同路径  ✨✨
/*
一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。
机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。
问总共有多少条不同的路径？
输入：m = 3, n = 7
输出：28
示例 2：
输入：m = 3, n = 2
输出：3
解释：
从左上角开始，总共有 3 条路径可以到达右下角。
1. 向右 -> 向下 -> 向下
2. 向下 -> 向下 -> 向右
3. 向下 -> 向右 -> 向下
链接：https://leetcode-cn.com/problems/unique-paths
*/
func uniquePaths(_ m: Int, _ n: Int) -> Int {
0
	}

// MARK: - 加一  ✨
/*
给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。
最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
你可以假设除了整数 0 之外，这个整数不会以零开头。
输入：digits = [1,2,3]
输出：[1,2,4]
解释：输入数组表示数字 123。
输入：digits = [4,3,2,1]
输出：[4,3,2,2]
解释：输入数组表示数字 4321。
链接：https://leetcode-cn.com/problems/plus-one
*/
func plusOne(_ digits: [Int]) -> [Int] {
[]
	}

// MARK: - x 的平方根 ✨
/*
实现 int sqrt(int x) 函数。
计算并返回 x 的平方根，其中 x 是非负整数。
由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
输入: 4
输出: 2
示例 2:
输入: 8
输出: 2
说明: 8 的平方根是 2.82842...,
     由于返回类型是整数，小数部分将被舍去。
链接：https://leetcode-cn.com/problems/sqrtx
*/
func mySqrt(_ x: Int) -> Int {
0
	}

// MARK: - 爬楼梯 ✨
/*
假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
注意：给定 n 是一个正整数。
输入： 2
输出： 2
解释： 有两种方法可以爬到楼顶。
1.  1 阶 + 1 阶
2.  2 阶
输入： 3
输出： 3
解释： 有三种方法可以爬到楼顶。
1.  1 阶 + 1 阶 + 1 阶
2.  1 阶 + 2 阶
3.  2 阶 + 1 阶
方法一：动态规划
链接：https://leetcode-cn.com/problems/climbing-stairs
*/
func climbStairs(_ n: Int) -> Int {
0
	}

// MARK: - 矩阵置零  ✨✨
/*
给定一个 m x n 的矩阵，如果一个元素为 0 ，则将其所在行和列的所有元素都设为 0 。请使用 原地 算法。
进阶：
一个直观的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。
一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。
你能想出一个仅使用常量空间的解决方案吗？
输入：matrix = [[1,1,1],[1,0,1],[1,1,1]]
输出：[[1,0,1],[0,0,0],[1,0,1]]
链接：https://leetcode-cn.com/problems/set-matrix-zeroes
*/
func setZeroes(_ matrix: inout [[Int]]) {
	}

// MARK: - 杨辉三角
/*
给定一个非负整数 numRows，生成「杨辉三角」的前 numRows 行。
在「杨辉三角」中，每个数是它左上方和右上方的数的和。
输入: numRows = 5
输出: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
*/
func generate(_ numRows: Int) -> [[Int]] {
[]
	}

// MARK: - 分数到小数
/*
给定两个整数，分别表示分数的分子 numerator 和分母 denominator，以 字符串形式返回小数 。
如果小数部分为循环小数，则将循环的部分括在括号内。
如果存在多个答案，只需返回 任意一个 。
对于所有给定的输入，保证 答案字符串的长度小于 104 。
这是一道非常直观的代码题，但需要考虑很多细节
示例 1：
输入：numerator = 1, denominator = 2
输出："0.5"
输入：numerator = 2, denominator = 1
输出："2"
输入：numerator = 2, denominator = 3
输出："0.(6)"
链接：https://leetcode-cn.com/problems/fraction-to-recurring-decimal
*/
func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
""
	}

// MARK: - 阶乘后的零
/*
给定一个整数 n，返回 n! 结果尾数中零的数量。

示例 1:
输入: 3
输出: 0
解释: 3! = 6, 尾数中没有零。
示例 2:
输入: 5
输出: 1
解释: 5! = 120, 尾数中有 1 个零.
链接：https://leetcode-cn.com/problems/factorial-trailing-zeroes
*/
func trailingZeroes(_ n: Int) -> Int {
0
	}

// MARK: - 位1的个数
/*
编写一个函数，输入是一个无符号整数（以二进制串的形式），返回其二进制表达式中数字位数为 '1' 的个数（也被称为汉明重量）。
提示：
请注意，在某些语言（如 Java）中，没有无符号整数类型。在这种情况下，输入和输出都将被指定为有符号整数类型，并且不应影响您的实现，因为无论整数是有符号的还是无符号的，其内部的二进制表示形式都是相同的。
在 Java 中，编译器使用二进制补码记法来表示有符号整数。因此，在上面的 示例 3 中，输入表示有符号整数 -3。
示例 1：
输入：00000000000000000000000000001011
输出：3
解释：输入的二进制串 00000000000000000000000000001011 中，共有三位为 '1'。
示例 2：
输入：00000000000000000000000010000000
输出：1
解释：输入的二进制串 00000000000000000000000010000000 中，共有一位为 '1'。
示例 3：
输入：11111111111111111111111111111101
输出：31
解释：输入的二进制串 11111111111111111111111111111101 中，共有 31 位为 '1'。
链接：https://leetcode-cn.com/problems/number-of-1-bits
*/
func hammingWeight(_ n: Int) -> Int {
		0
	}

// MARK: - 快乐树
/*
编写一个算法来判断一个数 n 是不是快乐数。
「快乐数」定义为：
对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和。
然后重复这个过程直到这个数变为 1，也可能是 无限循环 但始终变不到 1。
如果 可以变为  1，那么这个数就是快乐数。
如果 n 是快乐数就返回 true ；不是，则返回 false 。
示例 1：
输入：19
输出：true
解释：
12 + 92 = 82
82 + 22 = 68
62 + 82 = 100
12 + 02 + 02 = 1
示例 2：
输入：n = 2
输出：false
方法一：用哈希集合检测循环
链接：https://leetcode-cn.com/problems/happy-number
*/
func isHappy(_ n: Int) -> Bool {
false
	}

// MARK: -  计数质数
/*
统计所有小于非负整数 n 的质数的数量。
示例 1：
输入：n = 10
输出：4
解释：小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
示例 2：
输入：n = 0
输出：0
方法一：枚举
方法二：埃氏筛
链接：https://leetcode-cn.com/problems/count-primes
*/
func countPrimes(_ n: Int) -> Int {
0
	}

// MARK: - 基本计算器
/*
给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。

整数除法仅保留整数部分。

 

示例 1：

输入：s = "3+2*2"
输出：7
示例 2：

输入：s = " 3/2 "
输出：1
示例 3：
输入：s = " 3+5 / 2 "
输出：5
方法一：栈
链接：https://leetcode-cn.com/problems/basic-calculator-ii
*/
func calculate(_ s: String) -> Int {
0
	}

// MARK: - 丢失的数字
/*
给定一个包含 [0, n] 中 n 个数的数组 nums ，找出 [0, n] 这个范围内没有出现在数组中的那个数。
进阶：
你能否实现线性时间复杂度、仅使用额外常数空间的算法解决此问题?
示例 1：
输入：nums = [3,0,1]
输出：2
解释：n = 3，因为有 3 个数字，所以所有的数字都在范围 [0,3] 内。2 是丢失的数字，因为它没有出现在 nums 中。
示例 2：
输入：nums = [0,1]
输出：2
解释：n = 2，因为有 2 个数字，所以所有的数字都在范围 [0,2] 内。2 是丢失的数字，因为它没有出现在 nums 中。
示例 3：
输入：nums = [9,6,4,2,3,5,7,0,1]
输出：8
解释：n = 9，因为有 9 个数字，所以所有的数字都在范围 [0,9] 内。8 是丢失的数字，因为它没有出现在 nums 中。
示例 4：
输入：nums = [0]
输出：1
解释：n = 1，因为有 1 个数字，所以所有的数字都在范围 [0,1] 内。1 是丢失的数字，因为它没有出现在 nums 中。
方法一：排序
方法二：哈希表
方法三：位运算
链接：https://leetcode-cn.com/problems/missing-number
*/
func missingNumber(_ nums: [Int]) -> Int {
0
	}

// MARK: - 完全平方数
/*
给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。
给你一个整数 n ，返回和为 n 的完全平方数的 最少数量 。
完全平方数 是一个整数，其值等于另一个整数的平方；换句话说，其值等于一个整数自乘的积。例如，1、4、9 和 16 都是完全平方数，而 3 和 11 不是。
示例 1：
输入：n = 12
输出：3
解释：12 = 4 + 4 + 4
示例 2：
输入：n = 13
输出：2
解释：13 = 4 + 9
方法一：动态规划
链接：https://leetcode-cn.com/problems/perfect-squares
*/
func numSquares(_ n: Int) -> Int {
0
	}

// MARK: - 四数相加
/*
给定四个包含整数的数组列表 A , B , C , D ,计算有多少个元组 (i, j, k, l) ，使得 A[i] + B[j] + C[k] + D[l] = 0。
为了使问题简单化，所有的 A, B, C, D 具有相同的长度 N，且 0 ≤ N ≤ 500 。所有整数的范围在 -228 到 228 - 1 之间，最终结果不会超过 231 - 1 。
例如:
输入:
A = [ 1, 2]
B = [-2,-1]
C = [-1, 2]
D = [ 0, 2]
输出:2
解释:
两个元组如下:
1. (0, 0, 0, 1) -> A[0] + B[0] + C[0] + D[1] = 1 + (-2) + (-1) + 2 = 0
方法一：分组 + 哈希表
链接：https://leetcode-cn.com/problems/4sum-ii
*/
func fourSumCount(_ nums1: [Int], _ nums2: [Int], _ nums3: [Int], _ nums4: [Int]) -> Int {
0
   }

// MARK: - 两整数之和
/*
不使用运算符 + 和 - ​​​​​​​，计算两整数 ​​​​​​​a 、b ​​​​​​​之和。
示例 1:
输入: a = 1, b = 2
输出: 3
示例 2:
输入: a = -2, b = 3
输出: 1
链接：https://leetcode-cn.com/problems/sum-of-two-integers
*/
func getSum(_ a: Int, _ b: Int) -> Int {
0
	}

// MARK: -  3的幂
/*
给定一个整数，写一个函数来判断它是否是 3 的幂次方。如果是，返回 true ；否则，返回 false 。
整数 n 是 3 的幂次方需满足：存在整数 x 使得 n == 3x
示例 1：

输入：n = 27
输出：true
示例 2：

输入：n = 0
输出：false
示例 3：

输入：n = 9
输出：true
示例 4：

输入：n = 45
输出：false
方法一：循环迭代
链接：https://leetcode-cn.com/problems/power-of-three
*/
func isPowerOfThree(_ n: Int) -> Bool {
false
	}

// MARK: - 计算右侧小于当前元素的个数
/*
给定一个整数数组 nums，按要求返回一个新数组 counts。数组 counts 有该性质： counts[i] 的值是  nums[i] 右侧小于 nums[i] 的元素的数量。
示例：

输入：nums = [5,2,6,1]
输出：[2,1,1,0]
解释：
5 的右侧有 2 个更小的元素 (2 和 1)
2 的右侧仅有 1 个更小的元素 (1)
6 的右侧有 1 个更小的元素 (1)
1 的右侧有 0 个更小的元素
方法一：离散化树状数组
方法二：归并排序
链接：https://leetcode-cn.com/problems/count-of-smaller-numbers-after-self
*/
func countSmaller(_ nums: [Int]) -> [Int] {
[]
	}

// MARK: - 最大子序和
func maxSubArray(_ nums: [Int]) -> Int {
	// 动态规划 previous：前n-1个数字的最大序列和 maxValue：最大值
	var previous = 0, maxValue = nums[0]
	for value in nums {
		// previous为0..<n 个数字是的最大序列和
		previous = max(previous + value, previous)
		// 取出所有0..<n pervious的最大值
		maxValue = max(previous, maxValue)
	}
	return maxValue
}












