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
	}
	@IBAction func click(_ sender: Any) {
		let s = "apppenapp", wordDict = ["app", "pen"]
		let result: Bool = wordBreak(s, wordDict)
		print(result)
//		let s2 = "aaaaa", wordDict2 = ["aa", "aaa"]
//		let result2: Bool = wordBreak(s2, wordDict2)
//		print(result2)
//		let s3 = "aaaaa", wordDict3 = ["aa"]
//		let result3: Bool = wordBreak(s3, wordDict3)
//		print(result3)
	}
}


