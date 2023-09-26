import SwiftUI

struct ContentView: View {
    @State var isLoading: Bool = true
    
    var body: some View {
        
        ZStack {
            OnBoardingView()
                .zIndex(0)
            
            // Launch Screen
            // TODO: - Add animation
            if isLoading {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    Text("Type-oh!-graphy")
                        .font(.largeTitle)
                        .transition(.opacity).zIndex(1)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.7, execute: {
                isLoading.toggle()
            })
        }
        
        
    }
    
    
    
    
}
