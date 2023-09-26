//
//  SwiftUIView.swift
//  
//
//  Created by Ye Eun Choi on 2023/04/09.
//

import SwiftUI

// TODO: 코드 공부티비........... 이건 내께 아냐 
struct LazyView: View {
    
    let lazyString = Array("I'm feeling lazy. Please don't try to move me around.")
    
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var blinkingAnimation = false
    
    var body: some View {
        VStack {
            Text("drag the text & see what happens")
                .opacity(blinkingAnimation ? 1.0 : 0.0)
                .animation(Animation.linear(duration: 1.5).repeatForever())
                .onAppear {
                    withAnimation {
                        blinkingAnimation = true
                    }
                }
            
            HStack() {
                ForEach(0..<lazyString.count) { num in
                    Text(String(lazyString[num]))
                        .font(.largeTitle)
                        .padding(-5)
                        .rotationEffect(.degrees(enabled ? 0 : 360), anchor: .bottom)
                        .offset(dragAmount)
                        .animation(.interpolatingSpring(stiffness: 170, damping: 5).delay(Double(num) / 20), value: dragAmount)
                }
            }
            .padding()
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation{
                            dragAmount = .zero
                            enabled.toggle()
                        }
                    }
            )
            
        }
    }
}

struct LazyView_Previews: PreviewProvider {
    static var previews: some View {
        LazyView()
            .preferredColorScheme(.dark)
    }
}
