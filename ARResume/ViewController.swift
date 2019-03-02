//
//  ViewController.swift
//  ARResume
//
//  Created by Jasmeet Kaur on 26/01/18.
//  Copyright © 2018 Jasmeet Kaur. All rights reserved.
//

import UIKit
import SceneKit
import ARKit


enum screenType{
    
    case First
    case Introduction
    
}
class ViewController: UIViewController, ARSKViewDelegate,finishSKSceneDelegate, ARSessionDelegate {
    
    

    @IBOutlet var sceneView: ARSKView!
    var scene:SCNScene!
    var plane:SCNPlane!
   // var node:SCNNode!
    var currentScreenType:screenType = .First
    var anchor:ARAnchor!
    var node:SKNode!
  //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        sceneView.session.delegate = self
       
        
        // Create a new scene
        //createSceneKitScene()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
        
      
        //sceneView.session.add(anchor: <#T##ARAnchor#>)
        createFirstScene()
    }

    

    
    // MARK: - ARSessionDelegate
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        print(#function, sceneView.session.currentFrame)
        guard (anchor == nil) else {
            return
        }
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -0.5
         translation.columns.3.x = -0.1
          translation.columns.3.y = -0.1
        let transform = simd_mul((sceneView.session.currentFrame?.camera.transform)!, translation)
        
        anchor = ARAnchor(transform: transform)
        sceneView.session.add(anchor: anchor)
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////        if anchors.count > 1 {
////            startBouncing()
////            return
////        }
//
//        if let currentFrame = sceneView.session.currentFrame {
//            var translation = matrix_identity_float4x4
//            translation.columns.3.z = -0.3
//            let transform = simd_mul(currentFrame.camera.transform, translation)
//
//            let anchor = ARAnchor(transform: transform)
//            sceneView.session.add(anchor: anchor)
//            //anchors.append(anchor)
//        }
//    }
   
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // Create and configure a node for the anchor added to the view's
        // session.
//        let labelNode = SKLabelNode(text: "👾")
//        labelNode.horizontalAlignmentMode = .center
//        labelNode.verticalAlignmentMode = .center
//        return labelNode;
        
        switch currentScreenType {
        case .Introduction:
            let introScene = IntroductionSKScene(size: CGSize(width:120,height:100))
            introScene.scaleMode = .resizeFill

            return introScene.node
        default:
            let firstSkScene = FirstSKScene(size: CGSize(width:120,height:100))
            firstSkScene.delgate = self
            firstSkScene.scaleMode = .resizeFill
           // node = firstSkScene.node
            return firstSkScene.node
        }
    }

    
    func createFirstScene(){
        
        
        
       let firstSkScene = FirstSKScene(size:  CGSize(width:120,height:100))
        firstSkScene.delgate = self

        firstSkScene.scaleMode = .resizeFill
        sceneView.presentScene(firstSkScene)
        
    }
    
 
    func createIntroductionScene(){
        
        let introScene = IntroductionSKScene(size:  CGSize(width:120,height:100))
        introScene.scaleMode = .resizeFill
        //self.node = introScene.node
        anchor = nil
        sceneView.presentScene(introScene)
        
    }
    
    func completedFirstScene() {
        currentScreenType = .Introduction
        createIntroductionScene()
    }
    
    func completedIntroductionScene() {
        createIntroductionScene()
    }
   
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

