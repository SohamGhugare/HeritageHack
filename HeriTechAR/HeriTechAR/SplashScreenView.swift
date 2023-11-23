//
//  SplashScreen.swift
//  HeriTechAR
//
/*
    This file contains all the necessary code for the SplashScreen View
    The Image is imported thru the assets directly.
 */
//  Created by Soham Ghugare on 06/10/23.
//

import Foundation
import SwiftUI
import RealityKit

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color(red:254/255, green: 235/255, blue: 220/255)
            
            Image("SplashIcon")
                .resizable()
                .frame(width: 1000, height: 650)
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    SplashScreenView()
}
