
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

func maxArea(_ nums: [Int]) -> Int {
	var front = 0, tail = nums.count - 1, area = min(nums[front], nums[tail]) * (tail - front)
	while front < tail {
		area = max(min(nums[front], nums[tail]) * (tail - front), area)
		if nums[front] <= nums[tail] {
			front += 1
		} else {
			tail -= 1
		}
	}
	return area
}
