//
//  ContentView.swift
//  SunoAnimation
//
//  Created by Erison Veshi on 10.4.24.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    let text = Array("1234567890abcdefg")
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<text.count, id: \.self) { i in
                    Text(String(self.text[i]))
                        .font(.title)
                        .rotationEffect(self.rotation(for: i))
                        .position(self.position(for: i, in: geometry.size))
                        .rotationEffect(self.animate ? .degrees(360) : .degrees(0))
                }
            }
        }
        .frame(width: 300, height: 300)
        .onAppear {
            withAnimation(Animation.linear(duration: 20).repeatForever(autoreverses: false)) {
                self.animate = true
            }
        }
    }
    
    func position(for i: Int, in size: CGSize) -> CGPoint {
        let angle = 2 * CGFloat.pi / CGFloat(text.count) * CGFloat(i)
        let radius = min(size.width, size.height) / 2
        let x = size.width / 2 + radius * cos(angle)
        let y = size.height / 2 + radius * sin(angle)
        return CGPoint(x: x, y: y)
    }
    
    func rotation(for i: Int) -> Angle {
        let angle = 2 * CGFloat.pi / CGFloat(text.count) * CGFloat(i)
        return Angle(radians: Double(angle))
    }
}
#Preview {
    ContentView()
}
