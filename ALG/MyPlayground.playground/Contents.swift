
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
