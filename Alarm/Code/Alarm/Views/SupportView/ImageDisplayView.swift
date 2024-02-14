//
//  ImageDisplayView.swift
//  Alarm
//
//  Created by MIKHAIL ZHACHKO on 14.02.24.
//

import SwiftUI

struct ImageDisplayView: View {
    //MARK: - Variables
    let name: String
    let width: CGFloat
    
    //MARK: - Views
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: width)
    }
}

#Preview {
    HStack {
        ImageDisplayView(name: standardType, width: 50.0)
        Spacer()
        ImageDisplayView(name: circularType, width: 50.0)
    }
    .padding()
}
