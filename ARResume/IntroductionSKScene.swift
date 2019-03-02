//
//  IntroductionSKScene.swift
//  ARResume
//
//  Created by Jasmeet Kaur on 06/02/18.
//  Copyright © 2018 Jasmeet Kaur. All rights reserved.
//

import Foundation
import SpriteKit
import ARKit


class IntroductionSKScene: SKScene{
    var rectangle:SKShapeNode!
    var textNode:SKMultilineLabel!
    var sprite:SKSpriteNode!
    var node:SKNode!
    var widthOfScene:CGFloat!
    var heightOfScene:CGFloat!
    var factorX:CGFloat = 1
    var factorY:CGFloat = 1
    var resumeNode:SKShapeNode!
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = .black
        
        
        widthOfScene = 180
        heightOfScene = 160
        
        factorX = 200/widthOfScene
        factorY = 200/heightOfScene
        createskScene()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
 
    
    func createskScene(){
        node = SKNode()
        resumeNode = SKShapeNode(rect: CGRect(x: 0, y: 0, width: widthOfScene, height: -800), cornerRadius: 2)
        resumeNode.fillColor = .black
        resumeNode.strokeColor = .black
        resumeNode.alpha = 0.4
        rectangle = createRectangle()
        self.node?.addChild(resumeNode)
        self.resumeNode.addChild(rectangle)
        
        
        textNode = SKMultilineLabel(text:"I have 4+ years of professional experience in the development. I have worked on native as well as on hybrid mobile application. Wide experience from e-commerce to on demand service Application.", labelWidth:Int(widthOfScene-80/factorX), pos:CGPoint(x:widthOfScene-60/factorX,y:heightOfScene-80/factorY), fontName:"San Fransisco",fontSize:5,fontColor:UIColor.white, alignment: .left)
        
        self.node?.addChild(textNode)
        textNode.alpha = 1.0
        
//        let Image = UIImage(named:"user-image")
//        let Texture = SKTexture(image: Image!)
//        let imageNode = SKShapeNode(rect: CGRect(x: 30, y: 90, width: 50, height: 50), cornerRadius: 10)
//        imageNode.fillTexture = Texture
        
        
//
        
        var image = UIImage(named:"user-image")
        image = image?.scaleImage(toSize: CGSize(width:20*widthOfScene/200,height:30*heightOfScene/200))
       // print(image?.size)
        let imageNode = SKSpriteNode(imageNamed: "user-image")
        let factor:CGFloat = 1.0
        imageNode.size = CGSize(width: (image?.size.width)! * factor, height: (image?.size.height)! * factor)
        imageNode.position = CGPoint(x: widthOfScene-150/factorX, y: heightOfScene-70/factorY)
        imageNode.zPosition = 0
        self.node?.addChild(imageNode)
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
//        self.node?.addChild(cropNode)
//        cropNode.addChild(tile)
//
//        let imageNode = SKShapeNode(rect: CGRect(x: 20, y: 80, width: 60, height: 50), cornerRadius: 10)
//        imageNode.fillColor = SKColor.white
//        imageNode.strokeColor = SKColor.white
//        imageNode.fillTexture = SKTexture.init(image: UIImage(named: "user-image")!)
//        imageNode.lineWidth = 2
//        imageNode.alpha = 1.0
        
  
        //self.node?.addChild(cropNode)
        
        
        let nameRect = SKLabelNode(text:"Jasmeet Kaur")
        nameRect.fontName = "San Fransisco"
        nameRect.fontSize = 14*widthOfScene/200
        nameRect.fontColor = UIColor.white
        nameRect.position = CGPoint(x:widthOfScene-90/factorX,y:heightOfScene-40/factorY)
        nameRect.verticalAlignmentMode = .center
        nameRect.zPosition = 2
 
        let backRect = SKSpriteNode(color:#colorLiteral(red: 0, green: 0.7333333333, blue: 0.3882352941, alpha: 1),size:CGSize(width:widthOfScene-80/factorX,height:30*widthOfScene/200))
        backRect.position = CGPoint(x:widthOfScene-80/factorX,y:heightOfScene-40/factorY)
        backRect.alpha = 0.4
        backRect.zPosition = 1
        
        
        self.node?.addChild(backRect)
    
        self.node?.addChild(nameRect)
        
        
        
    }
    
    func createRectangle()->SKShapeNode{
        
        let rectangle = SKShapeNode(rect: CGRect(x: 0, y: 0, width: widthOfScene, height: heightOfScene), cornerRadius: 2)
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

