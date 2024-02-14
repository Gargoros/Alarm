//
//  SelectActivityViewExpanded.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 12.02.24.
//

import SwiftUI

struct SelectActivityViewExpanded: View {
    //MARK: - Variables
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String
    
    var circleFrame: CGFloat = 25.0
    
    var currentColor: Color {
        return Color.mainColors[currentColorIndex]
    }
    
    //MARK: - Views
    var body: some View {
        
        VStack(spacing: 35) {
            //MARK: - Row of circles for selecting colours
            HStack(spacing: 30) {
                ForEach(0..<Color.mainColors.count, id: \.self) { item in
                    
                    let color = Color.mainColors[item]
                    let isSelectedColor = color == currentColor
                    
                    Circle()
                        .fill(color)
                        .frame(width: circleFrame, height: circleFrame)
                        .shadow(color: color.opacity(0.7), radius: 10, x: 0.0, y: 5.0)
                        .scaleEffect(isSelectedColor ? 1.1 : 1.0)
                        .overlay(
                            Circle()
                                .stroke(lineWidth: isSelectedColor ? 3.0 : 0.5)
                        )
                        .onTapGesture {
                            withAnimation(){
                                currentColorIndex = item
                            }
                        }
                    
                    
                }
            }
            
            //MARK: - Row of activities
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(activities, id: \.self){ activity in
                        let isSelectedActivity = activity == currentActivity
                        Image(systemName: activity)
                            .font(isSelectedActivity ? .headline : .subheadline)
                            .foregroundStyle(isSelectedActivity ? currentColor : Color.appColorNickel)
                            .opacity(isSelectedActivity ? 1.0 : 0.7)
                            .onTapGesture {
                                withAnimation(){
                                    currentActivity = activity
                                }
                            }
                            .padding(7)
                            .background(
                                Circle()
                                    .fill(isSelectedActivity && currentColor != Color.appColorBlack ? .black.opacity(0.9) : .clear)
                            )
                            .overlay(
                                Circle()
                                    .stroke(
                                        isSelectedActivity ? currentColor : .black,
                                        lineWidth: isSelectedActivity ? 1.0 : 0.0
                                    )
                            )
                    }
                }
            }
            .padding(.horizontal)
            
            
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.appColorNickel, lineWidth: 1)
        )
    }
}

#Preview {
    SelectActivityViewExpanded(
        currentColorIndex: .constant(0),
        currentActivity: .constant(activities[0]))
    .padding()
}
