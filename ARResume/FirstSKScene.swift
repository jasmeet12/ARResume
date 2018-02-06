//
//  FirstSKScene.swift
//  ARResume
//
//  Created by Jasmeet Kaur on 06/02/18.
//  Copyright © 2018 Jasmeet Kaur. All rights reserved.
//

import Foundation
import SpriteKit

class FirstSKScene:SKScene{
    var textNode:SKMultilineLabel!
    var sprite:SKSpriteNode!
    var backRectangle:SKShapeNode!
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = .clear
        
        createskScene()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createskScene(){
        
        self.addChild(createRectangle())
        sprite = createSpriteLine()
        self.addChild(sprite)
        
        
        
        textNode = SKMultilineLabel(text:"Hello! \n My Name is \n Jasmeet Kaur", labelWidth:180, pos:CGPoint(x:140,y:130), fontName:"San Fransisco",fontSize:16,fontColor:UIColor.white, alignment: .left)
        
        self.addChild(textNode)
        textNode.alpha = 0.0
        
        
        animateSprite(sprite: sprite){
            
            
            self.animatelabelNode(labelNode: self.textNode){
                
                self.backRectangle = self.createBackRect()
                
                
                self.addChild(self.backRectangle)
                self.sprite.zPosition = 1
                
                self.textNode.zPosition = 0
                let actionMove = SKAction.moveTo(x: 160, duration: 1.0)
                let actionMoveRect = SKAction.moveTo(x: 135, duration: 1.0)
                ///let actionLarge = SKAction.scaleX(to: 50, duration: 1.8)
                //let waitAction = SKAction.wait(forDuration: 0.4)
                let actionSmall = SKAction.resize(toHeight: 0, duration: 0.8)
                let actionSequence = SKAction.sequence([actionMove,actionSmall])
                
                self.backRectangle.run(actionMoveRect)
                //let actionSeq = SKAction.sequence([waitAction,actionLarge])
                self.sprite.run(actionSequence)
                
                
                
                //rectangle.run(actionMove)
            }
        }
        
        
        
        
        
        
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
        
        let frame = CGRect(x: 185, y: 98, width: 2, height: 0)
        let sprite = SKSpriteNode(texture: texture)
        sprite.position = CGPoint(x:185, y:98)
        sprite.size = frame.size
        
        
        
        return sprite
        
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
    
    func animateSprite(sprite:SKSpriteNode,completion:@escaping ()->Void){
        
        let waitAction = SKAction.wait(forDuration: 0.4)
        let scaleUpAction = SKAction.resize(toHeight: 100, duration: 0.5)
        let moveAction = SKAction.moveTo(x: 30, duration: 0.5)
        
        let actionSequence = SKAction.sequence([waitAction,scaleUpAction,moveAction])
        
        sprite.run(actionSequence) {
            completion()
        }
        //sprite.run(actionSequence)
        
    }
    
    func createBackRect()->SKShapeNode{
        let rectangle = SKShapeNode(rect: CGRect(x: -154, y: 0, width: 180, height: 200), cornerRadius: 10)
        rectangle.fillColor = SKColor.black
        rectangle.strokeColor = SKColor.black
        //rectangle.fillTexture = SKTexture.init(image: UIImage(named: "blurred_background")!)
        rectangle.lineWidth = 5
        rectangle.alpha = 1.0
        
        return rectangle
        
        
    }
    
    
    
}
