//
//  SelectView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 14.02.24.
//

import SwiftUI

struct SelectView: View {
    //MARK: - Variables
    let width: CGFloat
    @Binding var addEditViewType: AddEditViewType
    //@Binding var isActive: Bool
    
    var isStandardView: Bool {
        return addEditViewType == .standard
    }
    var isCircularView: Bool {
        return addEditViewType == .circular
    }
    
    //MARK: - Views
    var body: some View {
        HStack {
            Button(action: {
                withAnimation(){
                    addEditViewType = .standard
                    //isActive = true
                }
            }, label: {
                ImageDisplayView(name: standardType, width: 50.0)
                    .scaleEffect(isStandardView ? 1.2 : 1.0)
                    .shadow(color: .blue, radius: isStandardView ? 5: 0, x: 0, y: 0)
            })
            
            Spacer()
            Button(action: {
                withAnimation {
                    addEditViewType = .circular
                    //isActive = false
                }
            }, label: {
                ImageDisplayView(name: circularType, width: 50.0)
                    .scaleEffect(isCircularView ? 1.2 : 1.0)
                    .shadow(color: .blue, radius: isCircularView ? 5: 0, x: 0, y: 0)
            })
            
        }
        .padding()
    }
}

#Preview {
    SelectView(width: 50, addEditViewType: .constant(.standard))
}
