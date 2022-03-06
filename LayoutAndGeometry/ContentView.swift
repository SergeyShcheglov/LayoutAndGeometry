//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Sergey Shcheglov on 04.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var fadeOut = false
    
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: min(1, 0.7), saturation: 1, brightness: 1))
                            .opacity(geo.frame(in: .global).minY <= 200 ? geo.frame(in: .global).minY / 200 : 1)
                            .scaleEffect(max(0.5, (geo.frame(in: .global).maxY + fullView.size.height / 2) / fullView.size.height - 0.1))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            
                    }
                    .frame(height: 40)
                } 
            }

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
