//
//  ViewController.swift
//  randIcon
//
//  Created by Riku Uchida on 2018/08/30.
//  Copyright © 2018年 eujy. All rights reserved.
//

import UIKit

var SegCon = 0

class ViewController: UIViewController {
    @IBOutlet weak var key: UITextField!
    @IBOutlet weak var gazou: UIImageView!
    var IMG: UIImage!
    
    @IBAction func SegmentedControl(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex==0){
            SegCon = 0
        }else if(sender.selectedSegmentIndex==1){
            SegCon = 1
        }else if(sender.selectedSegmentIndex==2){
            SegCon = 2
        }else{
            SegCon = 3
        }
    }
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
        let rect = view.frame
        
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
        
        //IMGの切り取り
        let newrect = CGRect(x: 110, y: 460,
                             width: 1020, height: 1020)
        let newImageView = UIImageView()

        newImageView.frame = newrect

        let imgRef = image.cgImage?.cropping(to: newrect)
        IMG = UIImage(cgImage: imgRef!, scale: image.scale, orientation: image.imageOrientation)

       
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

