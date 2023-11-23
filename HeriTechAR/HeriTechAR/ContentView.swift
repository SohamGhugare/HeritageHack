//
//  ContentView.swift
//  HeriTechAR
/*
    This file contains all the initial code including the SplashScreen and
    the transition to the HomePage.
    Delay for Splash Disappear => 2 sec
*/
//
//  Created by Soham Ghugare on 06/10/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    @State private var showHomePage = false
    
    var body: some View {
        if showHomePage {
            HomePageView()
        } else {
            SplashScreenView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                        withAnimation {
                            showHomePage = true
                        }
                    }
                }
        }
    }
}



#Preview {
    ContentView()
}
