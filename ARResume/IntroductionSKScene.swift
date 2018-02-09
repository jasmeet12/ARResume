//
//  IntroductionSKScene.swift
//  ARResume
//
//  Created by Jasmeet Kaur on 06/02/18.
//  Copyright © 2018 Jasmeet Kaur. All rights reserved.
//

import Foundation
import SpriteKit

class IntroductionSKScene: SKScene{
    var rectangle:SKShapeNode!
    var textNode:SKMultilineLabel!
    var sprite:SKSpriteNode!
    
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = .black
        
        createskScene()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createskScene(){
        
        rectangle = createRectangle()
        self.addChild(rectangle)
        
        
        textNode = SKMultilineLabel(text:"I have 4+ years of professional experience in the development. I have worked on native as well as on hybrid mobile application. Wide experience from e-commerce to on demand service Application.", labelWidth:150, pos:CGPoint(x:150,y:120), fontName:"San Fransisco",fontSize:9,fontColor:UIColor.white, alignment: .left)
        
        self.addChild(textNode)
        textNode.alpha = 1.0
        
//        let Image = UIImage(named:"user-image")
//        let Texture = SKTexture(image: Image!)
//        let imageNode = SKShapeNode(rect: CGRect(x: 30, y: 90, width: 50, height: 50), cornerRadius: 10)
//        imageNode.fillTexture = Texture
        
        
//
        
        var image = UIImage(named:"user-image")
        image = image?.scaleImage(toSize: CGSize(width:20,height:30))
       // print(image?.size)
        let imageNode = SKSpriteNode(imageNamed: "user-image")
        let factor:CGFloat = 1.0
        imageNode.size = CGSize(width: (image?.size.width)! * factor, height: (image?.size.height)! * factor)
        imageNode.position = CGPoint(x: 50, y: 130)
        imageNode.zPosition = 0
        self.addChild(imageNode)
//
        
//        let tile = SKSpriteNode(imageNamed: "user-image")
//        tile.size = CGSize(width: 60, height: 60)
//        tile.zPosition = 3
//        tile.name = "tile node"
//        let cropNode = SKCropNode()
//        cropNode.zPosition = 2
//        cropNode.name = "crop node"
//        let mask = SKShapeNode(rect: CGRect(x: 100, y: 130, width: 60, height: 60), cornerRadius: 10)
//        mask.fillColor = SKColor.white
//        mask.zPosition = 2
//        mask.name = "mask node"
//        cropNode.maskNode = mask
//        self.addChild(cropNode)
//        cropNode.addChild(tile)
//
//        let imageNode = SKShapeNode(rect: CGRect(x: 20, y: 80, width: 60, height: 50), cornerRadius: 10)
//        imageNode.fillColor = SKColor.white
//        imageNode.strokeColor = SKColor.white
//        imageNode.fillTexture = SKTexture.init(image: UIImage(named: "user-image")!)
//        imageNode.lineWidth = 2
//        imageNode.alpha = 1.0
        
  
        //self.addChild(cropNode)
        
        
        let nameRect = SKLabelNode(text:"Jasmeet Kaur")
        nameRect.fontName = "San Fransisco"
        nameRect.fontSize = 14
        nameRect.fontColor = UIColor.white
        nameRect.position = CGPoint(x:110,y:160)
        nameRect.verticalAlignmentMode = .center
        nameRect.zPosition = 2
 
        let backRect = SKSpriteNode(color:#colorLiteral(red: 0, green: 0.7333333333, blue: 0.3882352941, alpha: 1),size:CGSize(width:120,height:30))
        backRect.position = CGPoint(x:120,y:160)
        backRect.alpha = 0.4
        backRect.zPosition = 1
        
        
        self.addChild(backRect)
    
        self.addChild(nameRect)
        
        
        
    }
    
    func createRectangle()->SKShapeNode{
        
        let rectangle = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 200, height: 200), cornerRadius: 10)
        rectangle.fillColor = SKColor.black
        rectangle.strokeColor = SKColor.black
        //rectangle.fillTexture = SKTexture.init(image: UIImage(named: "blurred_background")!)
        rectangle.lineWidth = 5
        rectangle.alpha = 1.0
        
        return rectangle
    }
    
    
    
}


extension UIImage {
    
    func scaleImage(toSize newSize: CGSize) -> UIImage? {
        let newRect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height).integral
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        if let context = UIGraphicsGetCurrentContext() {
            context.interpolationQuality = .high
            let flipVertical = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: newSize.height)
            context.concatenate(flipVertical)
            context.draw(self.cgImage!, in: newRect)
            let newImage = UIImage(cgImage: context.makeImage()!)
            UIGraphicsEndImageContext()
            return newImage
        }
        return nil
    }
}

