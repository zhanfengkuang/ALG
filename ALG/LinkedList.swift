//
//  LinkedList.swift
//  ALG
//
//  Created by Maple on 2021/7/25.
//

import Foundation

class ListNode {
	public var val: Int
	public var next: ListNode?
	public init() { self.val = 0; self.next = nil; }
	public init(_ val: Int) { self.val = val; self.next = nil; }
	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next};
}

class LinkedList {
	
	// MARK: - 两数相加
	/*
	给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
	请你将两个数相加，并以相同形式返回一个表示和的链表。
	你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
	链接：https://leetcode-cn.com/problems/add-two-numbers
	输入：l1 = [2,4,3], l2 = [5,6,4]
	输出：[7,0,8]
	解释：342 + 465 = 807.
	输入：l1 = [0], l2 = [0]
	输出：[0]
	输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
	输出：[8,9,9,9,0,0,0,1]
	
	由于输入的两个链表都是逆序存储数字的位数的，因此两个链表中同一位置的数字可以直接相加。
	我们同时遍历两个链表，逐位计算它们的和，并与当前位置的进位值相加。具体而言，如果当前两个链表处相应位置的数字为 n1,n2n1,n2，进位值为 \textit{carry}carry，则它们的和为 n1+n2+\textit{carry}n1+n2+carry；其中，答案链表处相应位置的数字为 (n1+n2+\textit{carry}) \bmod 10(n1+n2+carry)mod10，而新的进位值为 \lfloor\frac{n1+n2+\textit{carry}}{10}\rfloor⌊
	10
	n1+n2+carry
	 ⌋。

	如果两个链表的长度不同，则可以认为长度短的链表的后面有若干个 0。
	此外，如果链表遍历结束后，有 \textit{carry} > 0，还需要在答案链表的后面附加一个节点，节点的值为 \textit{carry}。
	*/
	func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
		return ListNode()
	}
}

// MARK: - 删除链表的倒数第N个节点 ✨✨
/*
给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
进阶：你能尝试使用一趟扫描实现吗？
输入：head = [1,2,3,4,5], n = 2
输出：[1,2,3,5]
输入：head = [1], n = 1
输出：[]
输入：head = [1,2], n = 1
输出：[1]
链接：https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list
*/
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
	return ListNode()
}

// MARK: - 合并两个有序链表 ✨
/*
将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
输入：l1 = [1,2,4], l2 = [1,3,4]
输出：[1,1,2,3,4,4]
链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
*/
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
ListNode()
	}

// MARK: - 环形链表
/*
给定一个链表，判断链表中是否有环。
如果链表中有某个节点，可以通过连续跟踪 next 指针再次到达，则链表中存在环。 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意：pos 不作为参数进行传递，仅仅是为了标识链表的实际情况。
如果链表中存在环，则返回 true 。 否则，返回 false 。
你能用 O(1)（即，常量）内存解决此问题吗？
输入：head = [3,2,0,-4], pos = 1
输出：true
解释：链表中有一个环，其尾部连接到第二个节点。
输入：head = [1,2], pos = 0
输出：true
解释：链表中有一个环，其尾部连接到第一个节点。
链接：https://leetcode-cn.com/problems/linked-list-cycle
*/
func hasCycle(_ head: ListNode?) -> Bool {
		false
	}

//MARK: - 排序链表
/*
给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。
进阶：
你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？
输入：head = [4,2,1,3]
输出：[1,2,3,4]
输入：head = [-1,5,3,4,0]
输出：[-1,0,3,4,5]
链接：https://leetcode-cn.com/problems/sort-list
*/
func sortList(_ head: ListNode?) -> ListNode? {
ListNode()
	}

// MARK: - 翻转链表
/*
给你单链表的头节点 head ，请你反转链表，并返回反转后的链表。
示例 1：
输入：head = [1,2,3,4,5]
输出：[5,4,3,2,1]
示例 2：
输入：head = [1,2]
输出：[2,1]
链接：https://leetcode-cn.com/problems/reverse-linked-list
*/
func reverseList(_ head: ListNode?) -> ListNode? {
ListNode()
	}

// MARK: - 回文链表
/*
请判断一个链表是否为回文链表。
示例 1:
输入: 1->2
输出: false
示例 2:
输入: 1->2->2->1
输出: true
方法一：将值复制到数组中后用双指针法
*/
func isPalindrome(_ head: ListNode?) -> Bool {
false
	}

// MARK: - 删除链表中的节点
/*
请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点。传入函数的唯一参数为 要被删除的节点 。
现有一个链表 -- head = [4,5,1,9]，它可以表示为:
示例 1：
输入：head = [4,5,1,9], node = 5
输出：[4,1,9]
解释：给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
示例 2：
输入：head = [4,5,1,9], node = 1
输出：[4,5,9]
解释：给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.
链接：https://leetcode-cn.com/problems/delete-node-in-a-linked-list
*/
func deleteNode(_ node: ListNode?) {
	
	}

// MARK: - 奇偶
/*
给定一个单链表，把所有的奇数节点和偶数节点分别排在一起。请注意，这里的奇数节点和偶数节点指的是节点编号的奇偶性，而不是节点的值的奇偶性。
请尝试使用原地算法完成。你的算法的空间复杂度应为 O(1)，时间复杂度应为 O(nodes)，nodes 为节点总数。
示例 1:

输入: 1->2->3->4->5->NULL
输出: 1->3->5->2->4->NULL
示例 2:
方法一：分离节点后合并
输入: 2->1->3->5->6->4->7->NULL
输出: 2->3->6->7->1->5->4->NULL
链接：https://leetcode-cn.com/problems/odd-even-linked-list
*/

func oddEvenList(_ head: ListNode?) -> ListNode? {
ListNode()
	}
