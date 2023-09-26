//
//  AnimationView.swift
//  Type-oh-graphy
//
//  Created by Ye Eun Choi on 2023/04/07.
//

import SwiftUI

struct AnimationView: View {
    
    @Binding var tab: CategoryEnum
    
    var body: some View {
        switch tab {
        case .scared:
            ScaredView()
        case .lazy:
            LazyView()
        case .loved:
            LovedView()
        case .excited:
            ExcitedView()
        case .confused:
            ConfusedView()
        default:
            EmptyView()
        }
    }
}


//struct AnimationView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimationView()
//    }
//}
