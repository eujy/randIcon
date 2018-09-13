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
    @IBAction func DrawPic(_ sender: Any) {
        // Screen Size の取得
        let screenWidth = self.gazou.bounds.width
        let screenHeight = self.gazou.bounds.height
        let screenX = self.gazou.frame.origin.x
        let screenY = self.gazou.frame.origin.y
        
        let testDraw = Draw(frame: CGRect(x: screenX, y: screenY,
                                          width: screenWidth, height: screenHeight))
        self.view.addSubview(testDraw)
    }
    
    @IBAction func Save(_ sender: Any) {
//        // UIImage の画像をカメラロールに画像を保存
//        UIImageWriteToSavedPhotosAlbum(gazou, self, #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @objc func commitButtonTapped() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

