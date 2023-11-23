//
//  ExploreView.swift
//  HeriTechAR
//
/*
    This file contains the code for ExploreView and redirects to the quick look
    for different Reality Models.
 */
//  Created by Soham Ghugare on 06/10/23.
//

import Foundation
import SwiftUI

struct ExploreView: View {
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Image("ExploreImage").padding(.top, 20)
                Spacer()
                Text("What would you like to view?")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 45))
                    .padding(.bottom, 80)
                HStack{
                    Spacer()
                    MenuButton(text: "Interactive Museum", color: Color(red: 253/255, green: 244/255, blue: 236/255), file: "AnimatedSword")
                    Spacer()
                    MenuButton(text: "Immersive Museum", color: Color(red: 221/255, green: 225/255, blue: 252/255), file: "AnimatedSword")
                    Spacer()
                    
                }
                MenuButton(text: "Cannon Demo", color: Color(red: 225/255, green: 255/255, blue: 221/255), file: "Cannon")
                
                
                Text("Glimpses of HeriTech")
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
                    .font(.system(size: 45))
                    .padding(.bottom, 30)
                CarouselView()
                
                Spacer()
            }
        }
    }
}

#Preview {
    ExploreView()
}

// Menu Button Subview, args: text(String), color(Color)
struct MenuButton: View {
    @State var url: URL?
    
    var text: String
    var color: Color
    var file: String
    
    var body: some View {
        Button(text){
            url = Bundle.main.url(forResource: file, withExtension: "reality")
        }
        .quickLookPreview($url)
        .foregroundStyle(.black)
        .padding()
        .frame(width: 250, height: 150)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2)
        )
        .font(.system(size: 30))
        .fontWeight(.bold)
        .padding(.bottom, 40)
            
    }
    
}
