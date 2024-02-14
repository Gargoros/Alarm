//
//  SplashScreenView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 7.02.24.
//

import SwiftUI

struct SplashScreenView: View {
    //MARK: - Variables
    @State private var isActive: Bool = false
    @State private var opacity: CGFloat = 0.3
    @State private var fontSize: CGFloat = 12.0
    
    //MARK: - Views
    var body: some View {
        if isActive {
            MainAlarmView()
        }
        else {
            ZStack(){
                FourCoolCircles(color1: Color.blue, color2: Color.clear)
                
                VStack(){
                    VStack(alignment: .leading, spacing: 0){
                        CoolTextView(text: LocalizedStringKey("hello there!"), size: fontSize)
                        CoolTextView(text: LocalizedStringKey("let's add an alarm"), size: fontSize)
                    }
                    .multilineTextAlignment(.center)
                    .padding()
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.5)){
                            opacity = 1.0
                            fontSize = 36.0
                        }
                    }
                    
                    Spacer()
                    
                    Image(welcome)
                        .resizable()
                        .scaledToFit()
                        .opacity(0.7)
                    
                    Spacer()
                }
                
                
                
            }
            .opacity(opacity)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                    withAnimation(){
                        isActive = true
                    }
                }
            }
            .onTapGesture {
                withAnimation(){
                    isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
        .environmentObject(LocalNotificationManager())
}
