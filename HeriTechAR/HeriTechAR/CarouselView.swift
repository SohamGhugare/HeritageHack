//
//  CarouselView.swift
//  HeriTechAR
//
//  Created by Soham Ghugare on 07/10/23.
//

import Foundation
import SwiftUI

struct Item: Identifiable {
    var id: Int
    var title: String
    var image: Image
}

class Store: ObservableObject {
    @Published var items: [Item]
    
    let images: [Image] = [Image("Cannon"), Image("Statue"), Image("Cannon"), Image("Figure")]
    
    // dummy data
    init() {
        items = []
        for i in 0...3 {
            let new = Item(id: i, title: "Item \(i)", image: images[i])
            items.append(new)
        }
    }
}

struct CarouselView: View {
    
    @StateObject var store = Store()
        @State private var snappedItem = 0.0
        @State private var draggingItem = 0.0
        @State var activeIndex: Int = 0
    
    var body: some View {
        ZStack {
            ForEach(store.items) { item in
                            
                // article view
                ZStack {
                    item.image
                        .resizable()
                        .border(Color.black, width: 2)
                }
                .frame(width: 280, height: 150)
                
                .scaleEffect(1.0 - abs(distance(item.id)) * 0.2 )
                .opacity(1.0 - abs(distance(item.id)) * 0.3 )
                .offset(x: myXOffset(item.id), y: 0)
                .zIndex(1.0 - abs(distance(item.id)) * 0.1)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    draggingItem = snappedItem + value.translation.width / 100
                }
                .onEnded { value in
                    withAnimation {
                        draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                        draggingItem = round(draggingItem).remainder(dividingBy: Double(store.items.count))
                        snappedItem = draggingItem
                        
                        //Get the active Item index
                        self.activeIndex = store.items.count + Int(draggingItem)
                        if self.activeIndex > store.items.count || Int(draggingItem) >= 0 {
                            self.activeIndex = Int(draggingItem)
                        }
                        print(self.activeIndex)
                    }
                }
            )
        }
        
        func distance(_ item: Int) -> Double {
            return (draggingItem - Double(item)).remainder(dividingBy: Double(store.items.count))
        }
        
        func myXOffset(_ item: Int) -> Double {
            let angle = Double.pi * 2 / Double(store.items.count) * distance(item)
            return sin(angle) * 220
        }
    
}

#Preview {
    CarouselView()
}
