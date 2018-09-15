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
        line.move(to: CGPoint(x: randNum(), y: randNum()));
        // 帰着点
        line.addLine(to: CGPoint(x: randNum(), y: randNum()));
        line.addLine(to: CGPoint(x: randNum(), y: randNum()));
        // ラインを結ぶ
        line.close()
        // 色の設定
        UIColor.green.setStroke()
        if(SegCon == 3){
            UIColor.white.setStroke()
        }
        // ライン幅
        line.lineWidth = 2
        // 描画
        line.stroke();
        
        
        // 楕円 -------------------------------------
        let oval = UIBezierPath(ovalIn: CGRect(x: randNum(), y: randNum(), width: randNum(), height: randNum()))
        
        // 塗りつぶし色の設定
        UIColor.gray.setFill()
        // 内側の塗りつぶし
        oval.fill()
        
        // stroke 色の設定
        UIColor.green.setStroke()
        if(SegCon == 3){
            UIColor.white.setStroke()
        }
        // ライン幅
        oval.lineWidth = 2
        // 描画
        oval.stroke()
        
        
        // 矩形 -------------------------------------
        let rectangle = UIBezierPath(rect: CGRect(x: randNum(),y: randNum(),width: randNum(),height: randNum()))
        // stroke 色の設定
        UIColor.magenta.setStroke()
        if(SegCon == 3){
            UIColor.white.setStroke()
        }
        // ライン幅
        rectangle.lineWidth = 8
        // 描画
        rectangle.stroke()
        
        
        // 角が丸い矩形 -------------------------------------
        let roundRect = UIBezierPath(roundedRect: CGRect(x: randNum(), y: randNum(), width: randNum(), height: randNum()), cornerRadius: CGFloat(randNum()))
        // stroke 色の設定
        UIColor.yellow.setStroke()
        if(SegCon == 3){
            UIColor.white.setStroke()
        }
        roundRect.lineWidth = 6
        roundRect.stroke()
        
        
        // 円弧 -------------------------------------
        let arc = UIBezierPath(arcCenter: CGPoint(x:randNum(), y:randNum()), radius: CGFloat(randNum()),  startAngle: CGFloat(arc4random_uniform(180)), endAngle: CGFloat(arc4random_uniform(180)), clockwise: true)
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
