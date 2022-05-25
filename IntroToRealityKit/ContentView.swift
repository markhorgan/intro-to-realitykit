//
//  ContentView.swift
//  IntroToRealityKit
//
//  Created by Mark Horgan on 25/05/2022.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let anchorEntity = AnchorEntity(plane: .horizontal)
        let mesh = MeshResource.generateBox(size: 0.2)
        let material = SimpleMaterial(color: .red, isMetallic: false)
        let modelEntity = ModelEntity(mesh: mesh, materials: [material])
        anchorEntity.addChild(modelEntity)
        arView.scene.anchors.append(anchorEntity)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
