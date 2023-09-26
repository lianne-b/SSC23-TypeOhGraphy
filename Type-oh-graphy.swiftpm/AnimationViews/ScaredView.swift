//
//  ScaredView().swift
//  Type-oh-graphy
//
//  Created by Ye Eun Choi on 2023/04/09.
//

import SwiftUI

struct ScaredView: View {
    
    @State private var textSize: CGFloat = 70
    @State private var blinkingAnimation: Bool = false

    var body: some View {
        VStack {
            Text("↓ tap on the text")
                .padding(.bottom, 50)
                .opacity(blinkingAnimation ? 1.0 : 0.0)
                .animation(Animation.linear(duration: 1.5).repeatForever())
                .onAppear {
                    withAnimation {
                        blinkingAnimation = true
                    }
                }
            
            Text("I feel insecure.")
                .font(.system(size: textSize))
                .onTapGesture {
                    textSize -= 2
                }
                .offset(y: self.textSize)
                
        }
        
    }
    
}

struct ScaredView_Previews: PreviewProvider {
    static var previews: some View {
        ScaredView()
            .preferredColorScheme(.dark)
    }
}
