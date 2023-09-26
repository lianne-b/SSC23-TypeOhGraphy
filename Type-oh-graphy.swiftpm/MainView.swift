//
//  MainView.swift
//  Type-oh-graphy
//
//  Created by Ye Eun Choi on 2023/04/07.
//

import SwiftUI

struct MainView: View {
    
    @State var currentCategory: CategoryEnum = .scared
    
    /// Custom tab color
    init(){
           UISegmentedControl.appearance().selectedSegmentTintColor = .black
       }
    
    var body: some View {
        VStack {
            // MARK: - Categories of emotion on top
            CategoryTabSection(tab: $currentCategory)
                .padding(.bottom, 50)
            
            Spacer()
            
            // MARK: - Canvas area where animation takes place
            AnimationView(tab: $currentCategory)
            
            Spacer()
        }
        .padding(.horizontal, 20)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
