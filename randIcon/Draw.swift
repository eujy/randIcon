//
//  Draw.swift
//  randIcon
//
//  Created by Riku Uchida on 2018/09/10.
//  Copyright © 2018年 eujy. All rights reserved.
//

import UIKit

class Draw: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        // 三角形 -------------------------------------
        // UIBezierPath のインスタンス生成
        let line = UIBezierPath();
        // 起点
        line.move(to: CGPoint(x: 250, y: 260));
        // 帰着点
        line.addLine(to: CGPoint(x: 100, y: 630));
        line.addLine(to: CGPoint(x: 200, y: 580));
        // ラインを結ぶ
        line.close()
        // 色の設定
        UIColor.green.setStroke()
        // ライン幅
        line.lineWidth = 2
        // 描画
        line.stroke();
        
        
        // 楕円 -------------------------------------
        let oval = UIBezierPath(ovalIn: CGRect(x: randNum(), y: randNum(), width: 90, height: 140))
        
        // 塗りつぶし色の設定
        UIColor.gray.setFill()
        // 内側の塗りつぶし
        oval.fill()
        
        // stroke 色の設定
        UIColor.green.setStroke()
        // ライン幅
        oval.lineWidth = 2
        // 描画
        oval.stroke()
        
        
        // 矩形 -------------------------------------
        let rectangle = UIBezierPath(rect: CGRect(x: 200,y: 270,width: 120,height: 100))
        // stroke 色の設定
        UIColor.magenta.setStroke()
        // ライン幅
        rectangle.lineWidth = 8
        // 描画
        rectangle.stroke()
        
        
        // 角が丸い矩形 -------------------------------------
        let roundRect = UIBezierPath(roundedRect: CGRect(x: 50, y: 200, width: 210, height: 70), cornerRadius: 10)
        // stroke 色の設定
        UIColor.yellow.setStroke()
        roundRect.lineWidth = 6
        roundRect.stroke()
        
        
        // 円弧 -------------------------------------
        let arc = UIBezierPath(arcCenter: CGPoint(x:180, y:170), radius: 85,  startAngle: 0, endAngle: CGFloat(Double.pi)*4/3, clockwise: true)
        // 透明色設定
        let aColor = UIColor(red: 1, green: 1, blue: 0.6, alpha: 0.8)
        aColor.setStroke()
        arc.lineWidth = 10
        
        
        // 点線のパターンをセット
        let dashPattern:[CGFloat] = [ 1 , 4 ]
        arc.setLineDash(dashPattern, count: 2, phase: 0)
        arc.stroke()
        
    }
    
    func randNum() -> Int{
        let randValue = arc4random_uniform(243)
        return Int(randValue)
    }

}
