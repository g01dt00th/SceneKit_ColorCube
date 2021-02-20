//
//  BoxView.swift
//  RomanKeller_testcase
//
//  Created by Роенко Денис on 20.02.2021.
//

import SceneKit
import SwiftUI

struct BoxView: UIViewRepresentable {
    
    var scene: SCNScene
    var options: [Any]
    
    var view = SCNView()
    
    func makeUIView(context: Context) -> SCNView {
        
        // Make scene
        view.scene = scene
        view.pointOfView = scene.rootNode.childNode(withName: "camera", recursively: true)
        view.allowsCameraControl = true
        view.backgroundColor = .clear
        
        // Add gesture recognizer for planes
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }
    
    func updateUIView(_ view: SCNView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(view)
    }
    
    class Coordinator: NSObject {
        
        private let view: SCNView
        
        init(_ view: SCNView) {
            self.view = view
            super.init()
        }
        
        @objc func handleTap(_ gestureRecognize: UIGestureRecognizer) {
            // Colors for planes
            let colors: [UIColor]  = [.red, .orange, .yellow, .green, .cyan, .blue, .magenta]
            
            
            // check what nodes are tapped
            let p = gestureRecognize.location(in: view)
            let hitResults = view.hitTest(p, options: [:])
            
            // hittest magic
            if let result = hitResults.first, let material = result.node.geometry?.materials[(result.geometryIndex)] {
        
                material.diffuse.contents = colors.randomElement()
                
            }
        }
    }
}
