//
//  ARContentView.swift
//  HeriTechAR
//
//  Created by Soham Ghugare on 06/10/23.
//

import Foundation
import SwiftUI
import ARKit

//struct ARContentView: View {
//    var body: some View {
//        ARViewContainer().edgesIgnoringSafeArea(.all)
//    }
//}

struct ARContentView: View {
    @State
    var url: URL?
    
    var body: some View {
        VStack {
            
            
            Text("Explore the magic of AR through Immersive Museum")
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
                .padding(.vertical, 50)
            
                
            Button("Start AR") {
                url = Bundle.main.url(forResource: "Infoframe", withExtension: "reality")
            }
            .quickLookPreview($url)
            .foregroundColor(.black)
            .padding()
            .frame(width: 150, height: 40)
            .background(.green)
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black, lineWidth: 2)
                    
            }
            
            
            
        }
        
    }
}

#Preview {
    ARContentView()
}
