//
//  ConfusedView.swift
//  Type-oh-graphy
//
//  Created by Ye Eun Choi on 2023/04/09.
//

import SwiftUI

// TODO: 모든 코드 공부티비..
struct WidthPreferenceKey: PreferenceKey {
    static var defaultValue: Double = 0
    static func reduce(value: inout Double, nextValue: () -> Double) {
        value = nextValue()
    }
}

struct Sizeable: View {
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: WidthPreferenceKey.self, value: geometry.size.width)
        }
    }
}


// MARK: - Circular label
struct CircleLabelView: View {
    var text: String
    var texts: [(offset: Int, element: Character)] {
        return Array(text.enumerated())
    }
    var radius: Double
    var size: CGSize = .init(width: 600, height: 600)
    
    
    @State var textWidths: [Int:Double] = [:]
    @State var isAnimated: Bool = false
    
    
    var body: some View {
        ZStack {
            ForEach(texts, id: \.offset) { index, letter in
                VStack {
                    Text(String(letter))
                        .background(Sizeable())
                        .onPreferenceChange(WidthPreferenceKey.self, perform: { width in
                            textWidths[index] = width
                        })
                        .task {
                            withAnimation(.linear(duration: 1).speed(7).repeatForever()) {
                                isAnimated.toggle()
                            }
                        }
                    Spacer()
                }
                .rotationEffect(angle(at: index))
            }
        }
        .frame(width: size.width, height: size.height)
    }
    
    func angle(at index: Int) -> Angle {
        guard let labelWidth = textWidths[index] else { return .radians(0) }
        
        let circumference = radius * 2 * .pi
        
        let percent = labelWidth / circumference
        let labelAngle = percent * 2 * .pi
        
        let widthBeforeLabel = textWidths.filter{$0.key < index}.map{$0.value}.reduce(0, +)
        let percentBeforeLabel = widthBeforeLabel / circumference
        let angleBeforeLabel = percentBeforeLabel * 2 * .pi
        
        return .radians(angleBeforeLabel + labelAngle)
    }
}



struct ConfusedView: View {
    
    // viewState: position value
    // CGSize.zero: initial position
    @State private var viewState = CGSize.zero
    @State private var isRotating = 0.0
    @State private var strength = 0.0
    @State private var blinkingAnimation = false
    
    var body: some View {
        VStack {
            Text("↓ spin the wheel")
                .padding(.bottom, 50)
                .opacity(blinkingAnimation ? 1.0 : 0.0)
                .animation(Animation.linear(duration: 1.5).repeatForever())
                .onAppear {
                    withAnimation {
                        blinkingAnimation = true
                    }
                }
            
            CircleLabelView(
                text: "I'm confused......I'm confused......I'm confused......I'm confused......I'm confused......I'm confused......".uppercased(), radius: 220
            )
            .font(.system(size: 20, design: .monospaced))
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        viewState = value.translation
                        strength = value.translation.height
                        
                        withAnimation(.easeInOut(duration: strength * 0.3)
                            .speed(0.1 * strength)) {
                                isRotating = strength * 10
                            }
                    })
                    .onEnded({ value in
                        withAnimation(.easeInOut) {
                            self.viewState = .zero
                            self.strength = 0.0
                        }
                    })
            )
            .rotationEffect(.degrees(isRotating))
        .modifier(WiggleModifier())
        }
        
        
    }
    
}


// MARK: - Wiggle animation
struct WiggleModifier: ViewModifier {
    @State private var isWiggling = false
    @State var size: CGFloat = 0.5
    
    private static func randomize(interval: TimeInterval, withVariance variance: Double) -> TimeInterval {
        let random = (Double(arc4random_uniform(1000)) - 500.0) / 500.0
        return interval + variance * random
    }
    
    private let bounceAnimation = Animation
        .easeInOut(
            duration: WiggleModifier.randomize(
                interval: 0.18,
                withVariance: 0.025
            )
        )
        .repeatForever(autoreverses: true)
    
    
    var repeatingAnimation: Animation {
           Animation
               .easeInOut(duration: 2) //.easeIn, .easyOut, .linear, etc...
               .repeatForever()
       }
    
    
    func body(content: Content) -> some View {
        content
            .onAppear() {
                isWiggling.toggle()
                withAnimation(self.repeatingAnimation) { self.size = 1.3 }
            }
//            .scaleEffect(isWiggling ? 1.0 : 1.3)
//            .animation(.easeIn, value: isWiggling)
            
    }
}


//struct ConfusedView_Previews: PreviewProvider {
//    static var previews: some View {
//        ConfusedView(confusedString: "dd").preferredColorScheme(.dark)
//    }
//}
