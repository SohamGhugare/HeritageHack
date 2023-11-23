//
//  HomePageView.swift
//  HeriTechAR
//
/*
    This fiel contains all the code for the Home Page
    The button navigates to the ExploreView which pops up from the bottom
 */
//  Created by Soham Ghugare on 06/10/23.
//

import Foundation
import SwiftUI

struct HomePageView: View {
    @State private var isExploreViewPresented = false
    
    var body: some View {
        ZStack {
            Image("HomeImage")
            
            VStack{
                Spacer()
                Button(action: {
                    isExploreViewPresented.toggle()
                }) {
                    Text("Let's Explore")
                        .foregroundStyle(.black)
                        .padding()
                        .frame(width: 400, height: 90)
                        .background(Color(red: 254/255, green: 235/255, blue: 220/255))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.black, lineWidth: 2)
                        )
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding(.bottom, 150)
                    
                }.sheet(isPresented: $isExploreViewPresented){
                    ExploreView()
                }
            }
        }
    }
}

#Preview {
    HomePageView()
}
