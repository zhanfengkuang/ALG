//
//  Tree.swift
//  ALG
//
//  Created by Maple on 2021/7/11.
//

import Foundation

// MARK: - 实现Trie（前缀树）
/*
Trie（发音类似 "try"）或者说 前缀树 是一种树形数据结构，用于高效地存储和检索字符串数据集中的键。这一数据结构有相当多的应用情景，例如自动补完和拼写检查。

请你实现 Trie 类：

Trie() 初始化前缀树对象。
void insert(String word) 向前缀树中插入字符串 word 。
boolean search(String word) 如果字符串 word 在前缀树中，返回 true（即，在检索之前已经插入）；否则，返回 false 。
boolean startsWith(String prefix) 如果之前已经插入的字符串 word 的前缀之一为 prefix ，返回 true ；否则，返回 false 。
 

示例：

输入
["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
[[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
输出
[null, null, true, false, true, null, true]

解释
Trie trie = new Trie();
trie.insert("apple");
trie.search("apple");   // 返回 True
trie.search("app");     // 返回 False
trie.startsWith("app"); // 返回 True
trie.insert("app");
trie.search("app");
链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xaeate/
*/
class Trie {

	/** Initialize your data structure here. */
	init() {

	}
	
	/** Inserts a word into the trie. */
	func insert(_ word: String) {

	}
	
	/** Returns if the word is in the trie. */
	func search(_ word: String) -> Bool {
		return true
	}
	
	/** Returns if there is any word in the trie that starts with the given prefix. */
	func startsWith(_ prefix: String) -> Bool {
		return true
	}
}

public class TreeNode {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init() { self.val = 0; self.left = nil; self.right = nil; }
	public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
	public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
		self.val = val
		self.left = left
		self.right = right
	}
}

// MARK: - 二叉树的中序遍历  ✨
/*
给定一个二叉树的根节点 root ，返回它的 中序 遍历。
输入：root = [1,null,2,3]
输出：[1,3,2]
输入：root = []
输出：[]
递归、迭代
链接：https://leetcode-cn.com/problems/binary-tree-inorder-traversal
*/
func inorderTraversal(_ root: TreeNode?) -> [Int] {
	var result: [Int] = [ ]
	func inorder(_ root: TreeNode?) {
		guard root != nil else { return }
		inorder(root?.left)
		if let val = root?.val { result.append(val) }
		inorder(root?.right)
	}
	inorder(root)
	return result
}
// MARK: - 验证二叉搜索树 ✨
/*
给定一个二叉树，判断其是否是一个有效的二叉搜索树。
假设一个二叉搜索树具有如下特征
节点的左子树只包含小于当前节点的数。
节点的右子树只包含大于当前节点的数。
所有左子树和右子树自身必须也是二叉搜索树。
示例 1:

输入:
	2
   / \
  1   3
输出: true
链接：https://leetcode-cn.com/problems/validate-binary-search-tree
*/
func isValidBST(_ root: TreeNode?) -> Bool {
	func helper(_ root: TreeNode?, _ lower: Int, _ upder: Int) -> Bool {
		guard let root = root else { return true }
		if root.val <= lower || root.val >= upder {
			return false
		}
		return helper(root.left, lower, root.val) && helper(root.right, root.val, upder)
	}
	return helper(root, Int.min, Int.max)
}

// MARK: - 对称二叉树  ✨
/*
给定一个二叉树，检查它是否是镜像对称的。
例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
	1
   / \
  2   2
 / \ / \
3  4 4  3
但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
	1
   / \
  2   2
   \   \
   3    3
链接：https://leetcode-cn.com/problems/symmetric-tree
*/
func isSymmetric(_ root: TreeNode?) -> Bool {
	false
}

// MARK: - 二叉树的层序遍历  ✨✨
/*
给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
二叉树：[3,9,20,null,null,15,7],
	3
   / \
  9  20
	/  \
   15   7
返回其层序遍历结果：
[
  [3],
  [9,20],
  [15,7]
]
链接：https://leetcode-cn.com/problems/binary-tree-level-order-traversal
*/
func levelOrder(_ root: TreeNode?) -> [[Int]] {
[]
	}

// MARK: -  二叉树的锯齿形层序遍历  ✨✨
/*
给定一个二叉树，返回其节点值的锯齿形层序遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
例如：
给定二叉树 [3,9,20,null,null,15,7],
	3
   / \
  9  20
	/  \
   15   7
返回锯齿形层序遍历如下：
[
  [3],
  [20,9],
  [15,7]
]
链接：https://leetcode-cn.com/problems/binary-tree-zigzag-level-order-traversal
*/
func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
[]
	}

// MARK: - 最大深度  ✨
/*
给定一个二叉树，找出其最大深度。
二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
说明: 叶子节点是指没有子节点的节点。
示例：
给定二叉树 [3,9,20,null,null,15,7]，
	3
   / \
  9  20
	/  \
   15   7
返回它的最大深度 3 。
链接：https://leetcode-cn.com/problems/maximum-depth-of-binary-tree
*/
func maxDepth(_ root: TreeNode?) -> Int {
0
	}

// MARK: -  从前序与中序遍历序列构造二叉树
/*
给定一棵树的前序遍历 preorder 与中序遍历  inorder。请构造二叉树并返回其根节点。
示例 1:
Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]
Input: preorder = [-1], inorder = [-1]
Output: [-1]
链接：https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal
*/
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
TreeNode()
   }

// MARK: - 将有序数组转换为二叉搜索树
/*
给你一个整数数组 nums ，其中元素已经按 升序 排列，请你将其转换为一棵 高度平衡 二叉搜索树。
高度平衡 二叉树是一棵满足「每个节点的左右两个子树的高度差的绝对值不超过 1 」的二叉树。
输入：nums = [-10,-3,0,5,9]
输出：[0,-3,9,-10,null,5]
解释：[0,-10,5,null,-3,null,9] 也将被视为正确答案：
输入：nums = [1,3]
输出：[3,1]
解释：[1,3] 和 [3,1] 都是高度平衡二叉搜索树。
链接：https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree
*/
func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
TreeNode()
	}

// MARK: - 二叉搜索树中第K小的元素
/*
给定一个二叉搜索树的根节点 root ，和一个整数 k ，请你设计一个算法查找其中第 k 个最小元素（从 1 开始计数）。
示例 1：
输入：root = [3,1,4,null,2], k = 1
输出：1
示例 2：
输入：root = [5,3,6,2,4,null,null,1], k = 3
输出：3
链接：https://leetcode-cn.com/problems/kth-smallest-element-in-a-bst
*/
func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
0
	}

// MARK: - 二叉树的最近公共祖先
/*
给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。
百度百科中最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”
示例 1：
输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
输出：3
解释：节点 5 和节点 1 的最近公共祖先是节点 3 。
示例 2：
输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
输出：5
解释：节点 5 和节点 4 的最近公共祖先是节点 5 。因为根据定义最近公共祖先节点可以为节点本身。
示例 3：
输入：root = [1,2], p = 1, q = 2
输出：1
链接：https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree
*/
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
TreeNode()
	}

// MARK: - 二叉树转数组
func treeNodeToArray(_ treeNode: TreeNode?) -> [Int?] {
	func appendTreeNodeValue(_ node: TreeNode?, _ index: Int, _ nums: inout [Int?]) {
		if node == nil { return }
		nums[index - 1] = node?.val
		appendTreeNodeValue(node?.left, index * 2, &nums)
		appendTreeNodeValue(node?.right, index * 2 + 1, &nums)
	}
	var result: [Int?] = Array.init(repeating: nil, count: 100)
	appendTreeNodeValue(treeNode, 1, &result)
	return result
}

// MARK: - 数组转二叉树
func createRootNode(_ nums: [Int?]) -> TreeNode? {
	func createTreeNode(_ nums: [Int?], _ index: Int) -> TreeNode? {
		if index > nums.count { return nil }
		guard let value = nums[index - 1] else { return nil }
		let node = TreeNode(value)
		node.left = createTreeNode(nums, index * 2)
		node.right = createTreeNode(nums, index * 2 + 1)
		return node
	}
	if nums.isEmpty { return nil }
	return createTreeNode(nums, 1)
}
