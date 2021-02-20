//
//  ContentView.swift
//  RomanKeller_testcase
//
//  Created by Роенко Денис on 20.02.2021.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    
    var scene2: SCNScene {
        guard let scene = SCNScene(named: "Cube.scn") else {
            fatalError("[SceneKit] Cube.scn load fail!")
        }

        return scene
    }
    
    
    var body: some View {
        VStack {
            BoxView(scene: scene2, options: [])
                .frame(height: 300)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
