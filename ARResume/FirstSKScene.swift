//
//  FirstSKScene.swift
//  ARResume
//
//  Created by Jasmeet Kaur on 06/02/18.
//  Copyright © 2018 Jasmeet Kaur. All rights reserved.
//

import Foundation
import SpriteKit
protocol finishSKSceneDelegate:class {
    func completedFirstScene()
    func completedIntroductionScene()
  
}
class FirstSKScene:SKScene{
    var textNode:SKMultilineLabel!
    var sprite:SKSpriteNode!
    var backRectangle:SKShapeNode!
    var rectangle:SKShapeNode!
    var node:SKNode?
    var widthOfScene:CGFloat!
    var heightOfScene:CGFloat!
    var factorX:CGFloat = 1
    var factorY:CGFloat = 1
    
    
 weak var delgate:finishSKSceneDelegate?
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = .clear
        node = SKNode()
    
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
        
        rectangle = createRectangle()
        self.node?.addChild(rectangle)
        sprite = createSpriteLine()
        self.node?.addChild(sprite)
        
        
        
        textNode = SKMultilineLabel(text:"Hello! \n My Name is \n Jasmeet Kaur", labelWidth:Int(widthOfScene-20/factorX), pos:CGPoint(x:widthOfScene-60/factorX,y:heightOfScene-70/factorY), fontName:"San Fransisco",fontSize:8,fontColor:UIColor.white, alignment: .left)
        
        self.node?.addChild(textNode)
        textNode.alpha = 0.0
        
        
        animateSprite(sprite: sprite){
            
            self.animatelabelNode(labelNode: self.textNode){
                
              self.hideAnimationofTextNode()
            }
        }
        
        
        
        
        
        
    }
    
    
    func hideAnimationofTextNode(){
        
        self.backRectangle = self.createBackRect()
        
        self.rectangle.addChild(self.backRectangle)
        
      
        self.rectangle.zPosition = 0.3
        self.sprite.zPosition = 0.2
        self.textNode.zPosition = 0
        
        
        let actionMove = SKAction.moveTo(x: widthOfScene, duration: 1.0)
        let actionMoveRect = SKAction.moveTo(x:widthOfScene, duration: 1.8)
        
        let scaleAction = SKAction.scaleX(to: 200, duration: 1.0)
        
        let actionSmall = SKAction.resize(toHeight: 0, duration: 0.8)
        let actionSequence = SKAction.sequence([actionMove,actionSmall])
        
         let waitAction = SKAction.wait(forDuration: 0.4)
        
        
        self.backRectangle.alpha = 0.0
        self.backRectangle.run(actionMoveRect,completion: {

            self.backRectangle.alpha = 0.0
                                self.sprite.alpha = 0.0
                                self.textNode.alpha = 0.0
                                let actionMoveOut = SKAction.moveTo(x: self.widthOfScene, duration: 0.8)
                                self.rectangle.run(actionMoveOut, completion: {
            
                                    self.removeAllChildren()
                                    self.delgate?.completedFirstScene()
                                })
            


        })
//
      
        
        self.sprite.run(actionSequence)
        
    }
    
    func animatelabelNode(labelNode:SKMultilineLabel,completion:@escaping ()->Void){
        
        
        let appearaction = SKAction.fadeAlpha(to: 1.0, duration: 1.8)
        
        labelNode.run(appearaction, completion: {
            
            completion()
        })
        
        
        
        
    }
    func createSpriteLine() -> SKSpriteNode{
        
        let topColor = #colorLiteral(red: 0, green: 0.7333333333, blue: 0.3882352941, alpha: 1)
        let bottomColor = #colorLiteral(red: 0, green: 0.8509803922, blue: 0.4, alpha: 1)
        
        let topColorCi = CIColor(color:topColor)
        let bottomColorCi = CIColor(color:bottomColor)
        let texture = SKTexture(size: CGSize(width:3, height:10), color1: topColorCi, color2: bottomColorCi, direction: GradientDirection.up)
        texture.filteringMode = .nearest
        
        let frame = CGRect(x: widthOfScene-15/factorX, y: heightOfScene-102/factorY, width: 0.5, height: 0)
        let sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPoint(x:widthOfScene-15/factorX, y:heightOfScene-102/factorY)
        sprite.size = frame.size
        
        
        
        return sprite
        
    }
    
    
    func createRectangle()->SKShapeNode{
        
        let rectangle = SKShapeNode(rect: CGRect(x: 0, y: 0, width: widthOfScene, height: heightOfScene), cornerRadius: 10*widthOfScene/200)
        rectangle.fillColor = SKColor.black
        rectangle.strokeColor = SKColor.black
        //rectangle.fillTexture = SKTexture.init(image: UIImage(named: "blurred_background")!)
        rectangle.lineWidth = 5
        rectangle.alpha = 1.0
        
        return rectangle
    }
    
    func animateSprite(sprite:SKSpriteNode,completion:@escaping ()->Void){
        
        let waitAction = SKAction.wait(forDuration: 0.4)
        let scaleUpAction = SKAction.resize(toHeight: 100*widthOfScene/200, duration: 0.5)
        let moveAction = SKAction.moveTo(x: 30*widthOfScene/200, duration: 0.5)
        
        let actionSequence = SKAction.sequence([waitAction,scaleUpAction,moveAction])
        
        sprite.run(actionSequence) {
            completion()
        }
        //sprite.run(actionSequence)
        
    }
    
    func createBackRect()->SKShapeNode{
        let rectangle = SKShapeNode(rect: CGRect(x:-widthOfScene+28*widthOfScene/200 , y: 0, width:widthOfScene  , height: heightOfScene), cornerRadius:0)
        rectangle.fillColor = SKColor.black
        rectangle.strokeColor = SKColor.black
        rectangle.zPosition = 0.6
        //rectangle.fillTexture = SKTexture.init(image: UIImage(named: "blurred_background")!)
        //rectangle.lineWidth = 5
        rectangle.alpha = 1.0
        
        
        
        return rectangle
        
        
    }
    
    
    
}
