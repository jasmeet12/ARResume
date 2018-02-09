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



class ViewController: UIViewController, ARSCNViewDelegate,finishSKSceneDelegate {
    
    

    @IBOutlet var sceneView: ARSCNView!
    var scene:SCNScene!
    var plane:SCNPlane!
    var node:SCNNode!
  //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        createSceneKitScene()
        
    }
    
    
    
    func createFirstScene(){
        
        
        
       let firstSkScene = FirstSKScene(size: CGSize(width: 200, height: 200))
        firstSkScene.delgate = self
        
        let material = SCNMaterial()
        material.isDoubleSided = true
        material.diffuse.contents = firstSkScene
        material.diffuse.contentsTransform = SCNMatrix4MakeScale(1,-1,1);
        material.diffuse.wrapT = SCNWrapMode.repeat
        plane.materials = [material]
        
        node = SCNNode(geometry: plane)
        node.position = SCNVector3(x:0,y:0,z:-0.6)
        scene.rootNode.addChildNode(node)
        
        //plane.materials.first?.diffuse.contents = firstSkScene
        //createskScene(skScene: skScene)
       
        
    }
    
    func createSceneKitScene(){
        
        scene = SCNScene()
        plane = SCNPlane(width: 0.35, height: 0.25)
        
       
        //labelNode.run(SKAction.repeat(SKAction.rotate(byAngle: .pi, duration: 2), count: 1))
        sceneView.scene = scene
        
        createFirstScene()
        
    }
    
    func createIntroductionScene(){
        
        let introScene = IntroductionSKScene(size: CGSize(width: 200, height: 200))
        let material = SCNMaterial()
        material.isDoubleSided = true
        material.diffuse.contents = introScene
        material.diffuse.contentsTransform = SCNMatrix4MakeScale(1,-1,1);
        material.diffuse.wrapT = SCNWrapMode.repeat
        plane.materials = [material]
        
        node = SCNNode(geometry: plane)
        node.position = SCNVector3(x:0,y:0,z:-0.6)
        scene.rootNode.addChildNode(node)
      
        
        
        
        
        
    }
    
    func completedFirstScene() {
        createIntroductionScene()
    }
    
    func completedIntroductionScene() {
        createIntroductionScene()
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
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

