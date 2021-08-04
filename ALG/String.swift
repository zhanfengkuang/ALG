//
//  String.swift
//  ALG
//
//  Created by ctrip on 2021/7/7.
//

import Foundation

// MARK: - 验证回文字符串
/*
给你一个字符串 s，请你将 s 分割成一些子串，使每个子串都是 回文串 。返回 s 所有可能的分割方案。
回文串 是正着读和反着读都一样的字符串。
input："A man, a plan, a canal: Panama"
output: true
*/
/*
思路：采用头和尾双指针
*/
func isPalindrome(_ s: String) -> Bool {
	if s.count == 1 || s.count == 0 { return true }
	var front = 0, tail = s.count - 1, result = false
	while front < tail {
		let frontC = s[s.index(s.startIndex, offsetBy: front)],
			tailC = s[s.index(s.startIndex, offsetBy: tail)]
		if !frontC.isLetter && !frontC.isNumber {
			front += 1
			if front == tail {
				result = true; break
			}
			continue
		}
		if !tailC.isLetter && !tailC.isNumber {
			tail -= 1
			if front == tail {
				result = true; break
			}
			continue
		}
		if frontC.lowercased() == tailC.lowercased() {
			tail -= 1
			front += 1
			result = true
		} else {
			result = false; break
		}
	}
	return result
}

// MARK: - 分割回文串
/*
给你一个字符串 s，请你将 s 分割成一些子串，使每个子串都是 回文串 。返回 s 所有可能的分割方案。
回文串 是正着读和反着读都一样的字符串。
s = "aab"
[["a","a","b"],["aa","b"]]
s = "a"
[["a"]]
*/
/*打卡！！

DP解法思路:
首先回文串有天然的动态转移优势，下面先说一下回文串的动态转移优势在哪里?
回文串有如下性质:
回文串首字符和尾字符不相等，则该串必然不是回文串；
回文串首字符和尾字符相等，则该串是否为回文串由除去首字符和尾字符的子串决定；
不妨设dp(i,j)表示字符串i-j之间字符是否尾回文串，则有如下结论成立
当 j-i<=2时 dp(i,j)=s[i]==s[j]
当 j-i>2时 dp(i,j)=s[i]==s[j]&&dp(i+1,j-1)

DPTable只是用来记录某个区间子串是否为回文串，剩下的问题可以这么来思考：
假设一颗N叉树，根节点是满足回文条件的s的前缀子串（a,aa)，保证该树中每个节点都是回文串，且从根节点到叶子节点路径上的所有子串连接起来后正好为串s;
因此基本转化为这样一颗N叉树的所有路径问题了;
List<List<String>> res = new ArrayList<>();
 //当前路径
 List<String> path = new ArrayList<>();
 //回文串判断表 isPalindrome[i][j]=s[i...j]
 boolean[][] isPalindrome;

 public List<List<String>> partition(String s) {
	 int len = s.length();
	 char[] arr = s.toCharArray();
	 isPalindrome = new boolean[len][len];
	 for (int i = 0; i < len; i++) {
		 isPalindrome[i][i] = true;
	 }
	 //回文状态转移dp[i][j]=arr[i]==arr[j]&&dp[i+1][j-1]
	 for (int j = 1; j < len; j++) {
		 for (int i = 0; i < j; i++) {
			 if (j - i < 3) {
				 isPalindrome[i][j] = arr[i] == arr[j];
			 } else {
				 isPalindrome[i][j] = arr[i] == arr[j] && isPalindrome[i + 1][j - 1];
			 }
		 }
	 }
	 //深度优先搜索
	 DFS(s, 0, s.length() - 1, isPalindrome);
	 return res;
 }

 //N叉树深度优先搜索
 private void DFS(String s, int start, int end, boolean[][] isPalindrome) {
	 if (start > end) {
		 List<String> l = new ArrayList<>();
		 l.addAll(path);
		 res.add(l);
		 return;
	 }
	 //N叉树分支遍历
	 for (int len = 1; len <= end - start + 1; len++) {

		 if (!isPalindrome[start][start + len - 1]) continue;
		 //路径添加本分段
		 path.add(s.substring(start, start + len));
		 //下层继续深度优先搜索
		 DFS(s, start + len, end, isPalindrome);
		 //路径删除本分段
		 path.remove(path.size() - 1);
	 }
 }
*/
func partition(_ s: String) -> [[String]] {
	return []
}


// MARK: - 单词拆分
/*
给定一个非空字符串 s 和一个包含非空单词的列表 wordDict，判定 s 是否可以被空格拆分为一个或多个在字典中出现的单词。
说明：
拆分时可以重复使用字典中的单词。
你可以假设字典中没有重复的单词。
输入: s = "leetcode", wordDict = ["leet", "code"]
输出: true
解释: 返回 true 因为 "leetcode" 可以被拆分成 "leet code"。
输入: s = "applepenapple", wordDict = ["apple", "pen"]
输出: true
解释: 返回 true 因为 "applepenapple" 可以被拆分成 "apple pen apple"。
     注意你可以重复使用字典中的单词。
输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
输出: false
*/
/*

初始化 dp=[False,⋯,False]，长度为 n+1。n 为字符串长度。dp[i] 表示 s 的前 i 位是否可以用 wordDict 中的单词表示。
初始化 dp[0]=True，空字符可以被表示。
遍历字符串的所有子串，遍历开始索引 i，遍历区间 [0,n)：
遍历结束索引 j，遍历区间 [i+1,n+1)：
若 dp[i]=True 且 s[i,⋯,j) 在 wordlist 中：dp[j]=True。解释：dp[i]=True 说明 s 的前 i 位可以用 wordDict 表示，则 s[i,⋯,j) 出现在 wordDict 中，说明 s 的前 j 位可以表示。
返回 dp[n]
https://leetcode-cn.com/problems/word-break/solution/dong-tai-gui-hua-ji-yi-hua-hui-su-zhu-xing-jie-shi/
*/
func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
	let words = Set(wordDict)
	let n = s.count
	var dp = Array<Bool>(repeating: false, count: n + 1)
	dp[0] = true
	(1...n).forEach { i in
		(0..<i).forEach { j in
			let startIndex = s.index(s.startIndex, offsetBy: j)
			let endIndex = s.index(s.startIndex, offsetBy: i - 1)
			let word = String(s[startIndex...endIndex])
			// 判断0..<j个字符串 是否为全部包含字符串，再判断j..<i字符串是否包含
			// 这样就判断出0..<i 字符串是否全是单词
			// 比如s = "apppenapp", wordDict = ["app", "pen"]
			// 当i = 6，j = 3时, dp[3] = true, word = "pen", 因为app是单词, pen也是单词，所以0..<i 字符串全是单词
			if (dp[j] && words.contains(word)) {
				dp[i] = true
				return
			}
		}
	}
	return dp[n]
}

// MARK: - 单词拆分2
/*
https://leetcode-cn.com/problems/word-break-ii/solution/dan-ci-chai-fen-ii-by-leetcode-solution/
给定一个非空字符串 s 和一个包含非空单词列表的字典 wordDict，在字符串中增加空格来构建一个句子，使得句子中所有的单词都在词典中。返回所有这些可能的句子。
说明：
分隔时可以重复使用字典中的单词。
你可以假设字典中没有重复的单词。
示例 1：
输入:
s = "catsanddog"
wordDict = ["cat", "cats", "and", "sand", "dog"]
输出:
[
  "cats and dog",
  "cat sand dog"
]
示例 2：

输入:
s = "pineapplepenapple"
wordDict = ["apple", "pen", "applepen", "pine", "pineapple"]
输出:
[
  "pine apple pen apple",
  "pineapple pen apple",
  "pine applepen apple"
]
解释: 注意你可以重复使用字典中的单词。
示例 3：

输入:
s = "catsandog"
wordDict = ["cats", "dog", "sand", "and", "cat"]
输出:
[]
*/
/*
这道题是「139. 单词拆分」的进阶，第 139 题要求判断是否可以拆分，这道题要求返回所有可能的拆分结果。

第 139 题可以使用动态规划的方法判断是否可以拆分，因此这道题也可以使用动态规划的思想。但是这道题如果使用自底向上的动态规划的方法进行拆分，则无法事先判断拆分的可行性，在不能拆分的情况下会超时。

例如以下例子，由于字符串 ss 中包含字母 \texttt{b}b，而单词列表 \textit{wordDict}wordDict 中的所有单词都由字母 \texttt{a}a 组成，不包含字母 \texttt{b}b，因此不能拆分，但是自底向上的动态规划仍然会在每个下标都进行大量的匹配，导致超时。


s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
wordDict = ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]
为了避免动态规划的方法超时，需要首先使用第 139 题的代码进行判断，在可以拆分的情况下再使用动态规划的方法进行拆分。相比之下，自顶向下的记忆化搜索可以在搜索过程中将不可以拆分的情况进行剪枝，因此记忆化搜索是更优的做法。

方法一：记忆化搜索
对于字符串 s，如果某个前缀是单词列表中的单词，则拆分出该单词，然后对 s 的剩余部分继续拆分。如果可以将整个字符串 s 拆分成单词列表中的单词，则得到一个句子。在对 s 的剩余部分拆分得到一个句子之后，将拆分出的第一个单词（即 s 的前缀）添加到句子的头部，即可得到一个完整的句子。上述过程可以通过回溯实现。

假设字符串 s 的长度为 n，回溯的时间复杂度在最坏情况下高达 O(n^n)
 。时间复杂度高的原因是存在大量重复计算，可以通过记忆化的方式降低时间复杂度。

具体做法是，使用哈希表存储字符串 ss 的每个下标和从该下标开始的部分可以组成的句子列表，在回溯过程中如果遇到已经访问过的下标，则可以直接从哈希表得到结果，而不需要重复计算。如果到某个下标发现无法匹配，则哈希表中该下标对应的是空列表，因此可以对不能拆分的情况进行剪枝优化。

还有一个可优化之处为使用哈希集合存储单词列表中的单词，这样在判断一个字符串是否是单词列表中的单词时只需要判断该字符串是否在哈希集合中即可，而不再需要遍历单词列表。
*/
func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
	return []
}

// MARK: - 有效的字母异位词
/*
给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
示例 1:
输入: s = "anagram", t = "nagaram"
输出: true
示例 2:
输入: s = "rat", t = "car"
输出: false
链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xar9lv/
哈希表 字符串 排序
从另一个角度考虑，tt 是 ss 的异位词等价于「两个字符串中字符出现的种类和次数均相等」。由于字符串只包含 2626 个小写字母，因此我们可以维护一个长度为 2626 的频次数组 \textit{table}table，先遍历记录字符串 ss 中字符出现的频次，然后遍历字符串 tt，减去 \textit{table}table 中对应的频次，如果出现 \textit{table}[i]<0table[i]<0，则说明 tt 包含一个不在 ss 中的额外字符，返回 \text{false}false 即可。
链接：https://leetcode-cn.com/problems/valid-anagram/solution/you-xiao-de-zi-mu-yi-wei-ci-by-leetcode-solution/
*/
func isAnagram(_ s: String, _ t: String) -> Bool {
	if s.isEmpty && !t.isEmpty { return false }
	// s字符串 Key: 字符，Value: 出现次数
	var SC: [Character: Int] = [ : ]
	s.forEach { c in
		SC[c] = (SC[c] ?? 0) + 1
	}
	t.forEach { c in
		SC[c] = (SC[c] ?? 0) - 1
	}
	for item in SC {
		if item.value != 0 {
			return false
		}
	}
	return true
}

// MARK: - 字符串中的第一个唯一字符
/*
给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。
s = "leetcode"
返回 0
s = "loveleetcode"
返回 2
链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xaph0j/
你可以假定该字符串只包含小写字母。
我们可以对字符串进行两次遍历。
在第一次遍历时，我们使用哈希映射统计出字符串中每个字符出现的次数。在第二次遍历时，我们只要遍历到了一个只出现一次的字符，那么就返回它的索引，否则在遍历结束后返回 -1−1。
*/

func firstUniqChar(_ s: String) -> Int {
	var countMap: [Character: Int] = [ : ]
	s.forEach { c in
		countMap[c] = (countMap[c] ?? 0) + 1
	}
	for (index, c) in s.enumerated() {
		if (countMap[c] == 1) {
			return index
		}
	}
	return -1
}

// MARK: - 反转字符串
/*
编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。
不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。
示例 1：
输入：["h","e","l","l","o"]
输出：["o","l","l","e","h"]
示例 2：
输入：["H","a","n","n","a","h"]
输出：["h","a","n","n","a","H"]
链接：https://leetcode-cn.com/leetbook/read/top-interview-questions/xapbdt/
*/
func reverseString(_ s: inout [Character]) {
	guard s.count > 1 else { return }
	var front = 0, tail = s.count - 1
	while front < tail {
		s.swapAt(front, tail)
		front += 1
		tail -= 1
	}
}

// MARK: - 无重复字符的最长子串
/*
输入: s = "abcabcbb"
输出: 3
输入: s = "pwwkew"
输出: 3
链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/solution/wu-zhong-fu-zi-fu-de-zui-chang-zi-chuan-by-leetc-2/
*/
func lengthOfLongestSubstring(_ s: String) -> Int {
	if s.isEmpty { return 0 }
	var set = Set<Character>(), ans = 0, rk = 0
	(0..<s.count).forEach { index in
		if index != 0 {
			set.remove(s[s.index(s.startIndex, offsetBy: index - 1)])
		}
		while rk < s.count && !set.contains(s[s.index(s.startIndex, offsetBy: rk)]) {
			set.insert(s[s.index(s.startIndex, offsetBy: rk)])
			rk += 1
		}
		ans = max(ans, rk - index)
	}
	return ans
}

// MARK: - 最长回文子串 ✨✨
/*
给你一个字符串 s，找到 s 中最长的回文子
输入：s = "babad"
输出："bab"
输入：s = "cbbd"
输出："bb"
动态规划
链接：https://leetcode-cn.com/problems/longest-palindromic-substring/solution/zui-chang-hui-wen-zi-chuan-by-leetcode-solution/
*/
func longestPalindrome(_ s: String) -> String {
	return ""
}

// MARK: - 整数翻转 ✨
/*
给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。
如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。
假设环境不允许存储 64 位整数（有符号或无符号）。
链接：https://leetcode-cn.com/problems/reverse-integer
输入：x = 123
输出：321
*/
func reverse(_ x: Int) -> Int {
	return 0
}

// MARK: - 字符串换整数  ✨ ✨
/*
请你来实现一个 myAtoi(string s) 函数，使其能将字符串转换成一个 32 位有符号整数（类似 C/C++ 中的 atoi 函数）。

函数 myAtoi(string s) 的算法如下：

读入字符串并丢弃无用的前导空格
检查下一个字符（假设还未到字符末尾）为正还是负号，读取该字符（如果有）。 确定最终结果是负数还是正数。 如果两者都不存在，则假定结果为正。
读入下一个字符，直到到达下一个非数字字符或到达输入的结尾。字符串的其余部分将被忽略。
将前面步骤读入的这些数字转换为整数（即，"123" -> 123， "0032" -> 32）。如果没有读入数字，则整数为 0 。必要时更改符号（从步骤 2 开始）。
如果整数数超过 32 位有符号整数范围 [−231,  231 − 1] ，需要截断这个整数，使其保持在这个范围内。具体来说，小于 −231 的整数应该被固定为 −231 ，大于 231 − 1 的整数应该被固定为 231 − 1 。
返回整数作为最终结果。
注意：

本题中的空白字符只包括空格字符 ' ' 。
除前导空格或数字后的其余字符串外，请勿忽略 任何其他字符。
链接：https://leetcode-cn.com/problems/string-to-integer-atoi

输入：s = "42"
输出：42
解释：加粗的字符串为已经读入的字符，插入符号是当前读取的字符。
第 1 步："42"（当前没有读入字符，因为没有前导空格）
		 ^
第 2 步："42"（当前没有读入字符，因为这里不存在 '-' 或者 '+'）
		 ^
第 3 步："42"（读入 "42"）
		   ^
解析得到整数 42 。
由于 "42" 在范围 [-231, 231 - 1] 内，最终结果为 42 。
*/
func myAtoi(_ s: String) -> Int {
	return 0
}

// MARK: - 最长公共前缀  ✨
/*
编写一个函数来查找字符串数组中的最长公共前缀。
如果不存在公共前缀，返回空字符串 ""。
输入：strs = ["flower","flow","flight"]
输出："fl"
示例 2：
输入：strs = ["dog","racecar","car"]
输出：""
解释：输入不存在公共前缀
链接：https://leetcode-cn.com/problems/longest-common-prefix
方法一：横向扫描
*/
func longestCommonPrefix(_ strs: [String]) -> String {
	return ""
}

// MARK: - 有效的括号 ✨
/*
给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。
有效字符串需满足：
左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。
输入：s = "()"
输出：true
输入：s = "()[]{}"
输出：true
输入：s = "(]"
输出：false
链接：https://leetcode-cn.com/problems/valid-parentheses
*/
func isValid(_ s: String) -> Bool {
	false
}

// MARK: - 实现 strStr() ✨
/*
实现 strStr() 函数。
给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。
当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。
输入：haystack = "hello", needle = "ll"
输出：2
输入：haystack = "aaaaa", needle = "bba"
输出：-1
链接：https://leetcode-cn.com/problems/implement-strstr
*/
func strStr(_ haystack: String, _ needle: String) -> Int {
0
	}

// MARK: - 最小覆盖子串 ✨✨✨
/*
给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。
对于 t 中重复字符，我们寻找的子字符串中该字符数量必须不少于 t 中该字符数量。
如果 s 中存在这样的子串，我们保证它是唯一的答案。
输入：s = "ADOBECODEBANC", t = "ABC"
输出："BANC"
输入：s = "a", t = "a"
输出："a"
输入: s = "a", t = "aa"
输出: ""
解释: t 中两个字符 'a' 均应包含在 s 的子串中，
因此没有符合条件的子字符串，返回空字符串。
方法一：滑动窗口
链接：https://leetcode-cn.com/problems/minimum-window-substring
*/
func minWindow(_ s: String, _ t: String) -> String {
""
	}

// MARK: -  至少有 K 个重复字符的最长子串
/*
给你一个字符串 s 和一个整数 k ，请你找出 s 中的最长子串， 要求该子串中的每一字符出现次数都不少于 k 。返回这一子串的长度。
示例 1：

输入：s = "aaabb", k = 3
输出：3
解释：最长子串为 "aaa" ，其中 'a' 重复了 3 次。
示例 2：

输入：s = "ababbc", k = 2
输出：5
解释：最长子串为 "ababb" ，其中 'a' 重复了 2 次， 'b' 重复了 3 次。
方法一：分治
方法二：滑动窗口
链接：https://leetcode-cn.com/problems/longest-substring-with-at-least-k-repeating-characters
*/
func longestSubstring(_ s: String, _ k: Int) -> Int {
0
	}
