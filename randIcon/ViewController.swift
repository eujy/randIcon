//
//  ViewController.swift
//  randIcon
//
//  Created by Riku Uchida on 2018/08/30.
//  Copyright © 2018年 eujy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var key: UITextField!
    @IBOutlet weak var gazou: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        kbToolBar.barStyle = UIBarStyle.default  // スタイルを設定
        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.commitButtonTapped))
        kbToolBar.items = [spacer, commitButton]
        key.inputAccessoryView = kbToolBar
        
        // Screen Size の取得
        let screenWidth = self.gazou.bounds.width
        let screenHeight = self.gazou.bounds.height
        let screenX = self.gazou.frame.origin.x
        let screenY = self.gazou.frame.origin.y
        
        let testDraw = Draw(frame: CGRect(x: screenX, y: screenY,
                                              width: screenWidth, height: screenHeight))
        self.view.addSubview(testDraw)
    
    }
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

