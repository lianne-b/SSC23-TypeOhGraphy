//
//  CategoryTabSection.swift
//  Type-oh-graphy
//
//  Created by Ye Eun Choi on 2023/04/07.
//

import SwiftUI


struct CategoryTabSection: View {
    
    @Binding var tab: CategoryEnum
    
    var body: some View {
     
        Picker("", selection: $tab) {
            ForEach(CategoryEnum.allCases, id: \.self) { option in
                Text(option.rawValue)
                    .font(.system(size: 30))
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()

    }
}




//struct CategoryTabSection_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryTabSection()
//    }
//}
