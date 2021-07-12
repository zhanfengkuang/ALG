import UIKit

let weight = [2, 2, 4, 6, 3], n = 5, w = 9
func maxW() -> Int {
	var result: [[Bool]] = []
	result[0][0] = weight[0] <= w
	(0..<n).forEach { i in
		(0..<w).forEach { j in
			if (result[i][j]) {
				
			}
		}
	}
	return 0
}
