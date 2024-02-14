//
//  AboutView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 8.02.24.
//

import SwiftUI

struct AboutView: View {
    //MARK: - Variables
    
    //MARK: - Views
    var body: some View {
        
        GeometryReader {geometry in
            
            let screenWidth: CGFloat = geometry.size.width
            let screenHeight: CGFloat = geometry.size.height
            
            ZStack {
                
                MainGradient(endRadius: screenHeight * 0.5)
                    .opacity(0.8)
                    .ignoresSafeArea()
                
                VStack {
                    VStack (spacing: 30){
                        CoolTextView(text: "About", size: 32)
                        CoolTextView(text: "The UI for this nice Alarm app was largely inspired by the amazing work of Anton Leogky.", size: 24)
                    }
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.1)
                    .padding()
                    
                    Spacer()
                    
                    Image(appImageSamples)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: screenWidth * 0.9)
                    
                    Spacer()
                    
                    if let url = URL(string: "https://dribbble.com/antonleogky") {
                        Link(destination: url,
                             label: {
                            ButtonView(text: "to Anton's page")
                                .padding()
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    AboutView()
}
