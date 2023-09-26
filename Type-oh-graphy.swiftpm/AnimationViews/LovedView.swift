//
//  SwiftUIView.swift
//  
//
//  Created by Ye Eun Choi on 2023/04/09.
//

import SwiftUI

struct LovedView: View {
    let letters = Array("LOVE LOVE LOVE LOVE LOVE LOVE").split(separator: " ")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var blinkingAnimation: Bool = false
        
    
    var body: some View {
        HStack {
            ZStack {
                Text("I'm filled with")
                    .font(.system(size: 20))
                    .foregroundColor(.pink)
                ForEach(0..<letters.count) { num in
                    Text(String(letters[num]))
                        .font(.system(size: 55))
                        .fontWeight(.heavy)
                        .offset(dragAmount)
                        .foregroundColor(.pink)
                        .mask({
                            ZStack {
                                ZStack {
                                    Circle()
                                        .frame(width: 80, height: 80)
                                        .offset(x: -33)
                                    Circle()
                                        .frame(width: 80, height: 80)
                                        .offset(x: 33)
                                }
                                
                                TriangleShape()
                                    .fill(Color.red)
                                    .frame(width: 130, height: 100)
                                    .offset(y: 75)
                            }
                            
                        })
                        .opacity(0.2)
                        .animation(.interpolatingSpring(stiffness: 170, damping: 15).delay(Double(num) / 10), value: dragAmount)
                }
                
            }
            .scaleEffect(3)
            .padding()
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                // _ ignore the value coming in this time
                    .onEnded { _ in
                        withAnimation{
                            dragAmount = .zero
                            enabled.toggle()
                        }
                    }
            )
            
            VStack(spacing: 10) {
                Text("drag down")
                    .font(.system(size: 20))
                Text("↓")
                    .font(.system(size: 30))
            }
            .offset(x: 150)
            .opacity(blinkingAnimation ? 1.0 : 0.0)
            .animation(Animation.linear(duration: 1.5).repeatForever())
            .onAppear {
                withAnimation {
                    blinkingAnimation = true
                }
            }
        }
    }
    
    
    
    
}



struct TriangleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.closeSubpath()
        
        return path
    }
}


struct LovedView_Preview: PreviewProvider {
    static var previews: some View {
        LovedView()
            .preferredColorScheme(.dark)
    }
}
