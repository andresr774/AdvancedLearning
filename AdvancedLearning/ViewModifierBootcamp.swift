//
//  ViewModifierBootcamp.swift
//  AdvancedLearning
//
//  Created by Andres camilo Raigoza misas on 24/12/21.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

extension View {
    
    func withDefaultButtonFormatting(backgroundColor: Color = .blue) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
    
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack {
            Text("hello world!".capitalized)
                .withDefaultButtonFormatting(backgroundColor: .pink)
                .padding()
            
            Text("hello!".capitalized)
                .withDefaultButtonFormatting()
            
            Text("hello, everyone!".capitalized)
                .withDefaultButtonFormatting(backgroundColor: .green)
        }
    }
}

struct ViewModifierBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierBootcamp()
    }
}
