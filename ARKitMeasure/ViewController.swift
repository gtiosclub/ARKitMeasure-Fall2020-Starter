//
//  ViewController.swift
//  AR Measure
//
//  Created by Phil Zakharchenko on 21/06/18.
//  Copyright © 2018 Phil Zakharchenko. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    private var measurementTextNode = SCNNode()
    
    private var dotNodes = [SCNNode]()
    
    private var currentSessionStatus = ARSessionStateStatus.initialized

    // MARK: Lifecycle
    // 1. setup sceneView and statusLabel
    // 2. create a traking configuration and update session
    // 3. pause the session when we leave the app or the vc
    
    // MARK: - Touch Delegates
    // add/remove dot marks to/from the space, perform measuring logic as needed
    
    // MARK: Distance Util
    // measure distance between two dots
    
    // MARK: UI Helpers
    func addNewDot(at hitResult: ARHitTestResult) {
        // adding a dot at the user's tap location
        let redDotGeometry = SCNSphere(radius: 0.003)
        let redDotMaterial = SCNMaterial()
        redDotMaterial.diffuse.contents = UIColor.red
        redDotGeometry.materials = [redDotMaterial]
        let redDotNode = SCNNode(geometry: redDotGeometry)
        redDotNode.position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
        sceneView.scene.rootNode.addChildNode(redDotNode)
        dotNodes.append(redDotNode)
        
        // if we have 2 dots, go ahead and measure?
    }
    
    func updateText(text lableText: String, atPosition position:SCNVector3)  {
        measurementTextNode.removeFromParentNode()
        let textGeometry = SCNText(string: lableText, extrusionDepth: 1.0)
        textGeometry.firstMaterial?.diffuse.contents = UIColor.red
        measurementTextNode = SCNNode(geometry: textGeometry)
        measurementTextNode.position = SCNVector3(position.x, position.y + 0.01, position.z)
        measurementTextNode.scale = SCNVector3(0.01, 0.01, 0.01)
        sceneView.scene.rootNode.addChildNode(measurementTextNode)
    }
    
}

// MARK: - ARSCNViewDelegate
extension ViewController: ARSCNViewDelegate {
    // session lifecycle events
    // didFailWithError
    // sessionWasInterrupted
    // sessionInterruptionEnded
}
