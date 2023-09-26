//
//  OnBoardingView.swift
//  Type-oh-graphy
//
//  Created by Ye Eun Choi on 2023/04/07.
//

import SwiftUI

struct OnBoardingView: View {
    @State var currentTab: Int = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: $currentTab,
                    content: {
                
                VStack(alignment: .leading) {
                    Text("Kinetic Typography is moving text that express various messages. \nIt can be a strong communication tool in conveying emotions via textual context.")
                        .font(.system(size: 80))
                    Spacer()
                }
                .tag(0)
                
                
                VStack(alignment: .leading) {
                    Text("To learn more about \nhow moving types communicate messages, tap on the button below ⬇️")
                        .font(.system(size: 80))
                    Spacer()
                    
                    NavigationLink {
                        MainView()
                    } label: {
                        Text("Explore kinetic types")
                    }
                    Spacer()
                }
                .tag(1)
            })
            .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
