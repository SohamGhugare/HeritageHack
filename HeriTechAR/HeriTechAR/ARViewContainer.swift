//
//  ARViewContainer.swift
//  HeriTechAR
//
//  Created by Soham Ghugare on 06/10/23.
//

import SwiftUI
import RealityKit
import QuickLook

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        
    }
    
}
