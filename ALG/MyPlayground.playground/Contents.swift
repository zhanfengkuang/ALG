import UIKit
let s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
	let words = Set(wordDict)
	let n = s.count
	var dp = Array<Bool>(repeating: false, count: n + 1)
	(0...n).forEach { i in
		(0..<i).forEach { j in
			let startIndex = s.index(s.startIndex, offsetBy: j)
			let endIndex = s.index(s.startIndex, offsetBy: i - 1)
			let word = s[startIndex...endIndex]
			if (dp[j] && words.contains(String(word))) {
				dp[i] = true
			}
		}
	}
	return dp[n]
}
wordBreak(s, wordDict)
wordBreak("aaaaa", ["aa", "aaa"])
