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
    var IMG: UIImage!
    @IBAction func DrawPic(_ sender: Any) {
        // Screen Size の取得
        let screenWidth = self.gazou.bounds.width
        let screenHeight = self.gazou.bounds.height
        let screenX = self.gazou.frame.origin.x
        let screenY = self.gazou.frame.origin.y
        
        let testDraw = Draw(frame: CGRect(x: screenX, y: screenY,
                                          width: screenWidth, height: screenHeight))
        self.view.addSubview(testDraw)
        
        // キャプチャする範囲を取得する
        let rect = CGRect(x: screenX, y: screenY,
                          width: screenWidth, height: screenHeight)
        
        // ビットマップ画像のcontextを作成する
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context : CGContext = UIGraphicsGetCurrentContext()!
        
        // view内の描画をcontextに複写する
        view.layer.render(in: context)
        
        // contextのビットマップをUIImageとして取得する
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        // contextを閉じる
        UIGraphicsEndImageContext()
        
        IMG = image
       
    }
    
    @IBAction func Save(_ sender: Any) {
        

        // UIImage の画像をカメラロールに画像を保存
//        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
        if IMG != nil {
            UIImageWriteToSavedPhotosAlbum(IMG, self,
                                           #selector(self.showResultOfSaveImage(_:didFinishSavingWithError:contextInfo:)), nil)
        }
        else{
           print("save failed")
        }
    }
    
    // 保存を試みた結果をダイアログで表示
    @objc func showResultOfSaveImage(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        
        var title = "保存完了"
        var message = "カメラロールに保存しました"
        
        if error != nil {
            title = "エラー"
            message = "保存に失敗しました"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // OKボタンを追加
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // UIAlertController を表示
        self.present(alert, animated: true, completion: nil)
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

