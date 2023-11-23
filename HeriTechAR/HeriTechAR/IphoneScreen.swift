//
//  IphoneScreen.swift
//  HeriTechAR
//
//  Created by Soham Ghugare on 06/10/23.
//

import Foundation
import SwiftUI

struct IphoneScreen: View {
    @State private var isARViewPresented = false
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                
                Text("HeriTech")
                    .font(.system(size: 45))
                    
                Spacer()
                
                NavigationLink(destination: ARContentView()){
                    Text("Immersive Museum")
                        .foregroundStyle(.black)
                        .padding()
                        .frame(width: 150, height: 150)
                        .background(Color(red: 130/255, green: 247/255, blue: 255/255))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.black, lineWidth: 2)
                        )
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .padding(.bottom, 40)
                    
                }
                .sheet(isPresented: $isARViewPresented, content: {
                    ARContentView()
                })
                
                Spacer()
            }
        }
    }
}
