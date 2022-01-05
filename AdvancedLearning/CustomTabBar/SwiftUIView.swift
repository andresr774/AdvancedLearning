//
//  SwiftUIView.swift
//  AdvancedLearning
//
//  Created by Andres camilo Raigoza misas on 28/12/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var count = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .bold()
            Button {
                count += 1
            } label: {
                Text("Click")
                    .withDefaultButtonFormatting()
            }
            .opacity((count > 3 && count < 6) ? 0.0 : 1.0)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
