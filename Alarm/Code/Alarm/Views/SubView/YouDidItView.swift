//
//  YouDidItView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 9.02.24.
//

import SwiftUI

struct YouDidItView: View {
    //MARK: - Variables
    let youDidItText: LocalizedStringKey = "you did it! here you can manage your alarm, change time and other things"
    let width: CGFloat
    let height: CGFloat
    //MARK: - Views
    var body: some View {
        ZStack{
            MainGradient(endRadius: 120, scaleX: 1.5, yellowColor: Color.appColorDarkYellow)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(height: height)
                .overlay(
                    HStack {
                        GrayedTextView(text: youDidItText)
                            .padding(.horizontal)
                            .multilineTextAlignment(.leading)
                            .minimumScaleFactor(0.7)
                            .frame(width: width / 2)
                        
                        Spacer()
                        
                        Image(beach)
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal)
                            .opacity(0.9)
                    }
                )
                .padding(.horizontal)
                .padding(.top, 10)
        }
    }
}

#Preview {
    ZStack {
        Color.myBlack
            .ignoresSafeArea()
        YouDidItView(width: 200, height: 300)
    }
}
