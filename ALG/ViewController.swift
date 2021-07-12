//
//  ViewController.swift
//  ALG
//
//  Created by ctrip on 2021/7/6.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		//回溯 + 动态规划预处理
	}
	@IBAction func click(_ sender: Any) {
		var nums = [2, 4, 5, 0, 0, 0]
		merge(&nums, 3, [1, 3, 6], 3)
		print(nums)
	}
}


