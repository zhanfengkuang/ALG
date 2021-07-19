import UIKit
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
		(0..<count).forEach { index in
			shuffleArray.swapAt(index, Int.random(in: 0..<count))
		}
		return shuffleArray
	}
}

let shuffle = ShuffleSloution([1, 2, 3, 4, 5])
print(shuffle.shuffle())
print(shuffle.reset())
