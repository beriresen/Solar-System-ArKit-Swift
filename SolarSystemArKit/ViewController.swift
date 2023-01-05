//
//  ViewController.swift
//  SolarSystemArKit
//
//  Created by Berire Şen Ayvaz on 5.01.2023.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //----küp oluştur
//        let myBox =   SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01) //metre
//        let boxMaterial = SCNMaterial()  //görünümü ortya çıkaran materyal
//        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/green")
//        myBox.materials = [boxMaterial]
//
//        let node = SCNNode() //oluşturduğum materyolı node da göstercem
//        node.position = SCNVector3(0, 0.1, -0.5)  //node pozisyonu
//        node.geometry = myBox  //boxu noduma atıyorum
//        sceneView.scene.rootNode.addChildNode(node)  //oluşturduğum nodu sahnede görüntüle
        
        let sun = createSPhere(radius: 0.1, content: "sun.png", vector: SCNVector3(0, -0.2, -1))
        sceneView.scene.rootNode.addChildNode(sun)
        sceneView.automaticallyUpdatesLighting = true //ortam ışığını iyileştirir
        
        let world = createSPhere(radius: 0.1, content: "world.png", vector: SCNVector3(0.5, -0.2, -1))
        sceneView.scene.rootNode.addChildNode(world)
        
        let mars = createSPhere(radius: 0.3, content: "mars.png", vector: SCNVector3(1, -0.2, -1))
        sceneView.scene.rootNode.addChildNode(mars)

        let venus = createSPhere(radius: 0.2, content: "venus.png", vector: SCNVector3(2.5, -0.2, -1))
        sceneView.scene.rootNode.addChildNode(venus)

    }
    func createSPhere(radius: CGFloat, content: String, vector :SCNVector3) -> SCNNode {
        //---- küre oluştur
        let mySphere = SCNSphere(radius: radius)
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        mySphere.materials = [sphereMaterial]
        
        let node = SCNNode()
        node.position = vector
        node.geometry = mySphere
        
        return node
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
