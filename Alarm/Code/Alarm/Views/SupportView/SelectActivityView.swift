//
//  SelectActivityView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct SelectActivityView: View {
    //MARK: - Variables
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String
    
    var currentColor: Color {
        return Color.mainColors[currentColorIndex]
    }
    var nextIndex: Int {
        return (currentColorIndex + 1) % Color.mainColors.count
    }
    
    //MARK: - Views
    var body: some View {
        HStack(spacing: 10) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 30) {
                    ForEach(activities, id: \.self) {activity in
                        let isSelectedActivity = activity == currentActivity
                        Image(systemName: activity)
                            .font(isSelectedActivity ? .title2 : .subheadline)
                            .foregroundStyle(isSelectedActivity ? currentColor : Color.appColorNickel)
                            .opacity(isSelectedActivity ? 1.0 : 0.7)
                            .onTapGesture {
                                withAnimation(){
                                    currentActivity = activity
                                }
                            }
                    }
                }
            }
            Circle()
                .fill(
                    currentColor
                )
                .frame(width: 20, height: 20)
                .shadow(color: currentColor.opacity(0.7), radius: 10, x: 0, y: 5)
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3)
                )
                .onTapGesture {
                    withAnimation(){
                        currentColorIndex = nextIndex
                    }
                }
        }
        .padding(5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.appColorNickel, lineWidth: 1)
        )
    }
}

#Preview {
    SelectActivityView(
        currentColorIndex: .constant(0),
        currentActivity: .constant(activities[0]))
    .padding(.horizontal)
}
