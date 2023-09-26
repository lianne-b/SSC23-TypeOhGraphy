//
//  SwiftUIView.swift
//  
//
//  Created by Ye Eun Choi on 2023/04/09.
//

import SwiftUI

struct ExcitedView: View {
    
    @State private var weightController: Double = 1
    @State private var isAnimated = false
    @State private var blinkingAnimation = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                Text("As you can tell,")
                    .font(.title2)
                Text("I am \nSOooooo \nEXCITED!")
                    .font(.system(size: 150))
                    .fontWeight(setFontWeight())
                    .offset(x: isAnimated ? -2 : 2, y: isAnimated ? -2 : 2)
                    .task {
                        withAnimation(.linear(duration: 1).speed(7).repeatForever()) {
                            isAnimated.toggle()
                        }
                    }

            }
            
            Spacer()
            
            Text("tell me how excited you are") .opacity(blinkingAnimation ? 1.0 : 0.0)
                .animation(Animation.linear(duration: 1.5).repeatForever())
                .onAppear {
                    withAnimation {
                        blinkingAnimation = true
                    }
                }
            
            Slider(value: $weightController, in: 0...9) {
                Text("")
            } minimumValueLabel: {
                Text("um-hmm")
                    .font(.caption)
            } maximumValueLabel: {
                Text("Suuuupeerrrrrr")
                    .font(.caption)
            }
                .frame(width: 500)
        }
    }
    
    
    // MARK: - Method: set fontWeight according to slider value
    func setFontWeight() -> Font.Weight {
        switch weightController {
        case 0..<1:
            return Font.Weight.ultraLight
        case 1..<2:
            return Font.Weight.thin
        case 2..<3:
            return Font.Weight.light
        case 3..<4:
            return Font.Weight.regular
        case 4..<5:
            return Font.Weight.medium
        case 5..<6:
            return Font.Weight.semibold
        case 6..<7:
            return Font.Weight.bold
        case 7..<8:
            return Font.Weight.heavy
        case 8..<10:
            return Font.Weight.black
            
        default:
            return Font.Weight.regular
        }
    }
}

struct ExcitedView_Previews: PreviewProvider {
    static var previews: some View {
        ExcitedView()
    }
}





//struct StrokeText: View {
//    let text: String
//    let width: CGFloat
//    let color: Color
//
//    var body: some View {
//        ZStack{
//            ZStack{
//                Text(text).offset(x:  width, y:  width)
//                Text(text).offset(x: -width, y: -width)
//                Text(text).offset(x: -width, y:  width)
//                Text(text).offset(x:  width, y: -width)
//            }
//            .foregroundColor(color)
//            Text(text)
//        }
//    }
//}
