//
//  AnimateableDataBootcamp.swift
//  AdvancedLearning
//
//  Created by Andres camilo Raigoza misas on 26/12/21.
//

import SwiftUI

struct AnimateableDataBootcamp: View {
    
    @State private var animate = false
    @State private var move = false
    
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: animate ? 100 : 0)
//            RectangleWithSingleCornerAnimation(cornerRadius: animate ? 60 : 0)
//            RectangleWithCustomCorners(corners: [.bottomLeft, .topRight], cornerRadius: animate ? 100 : 0)
            
            HStack {
                Pacman(offsetAmount: animate ? 20 : 0)
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100, alignment: .leading)
                    .offset(x: move ? UIScreen.main.bounds.width * 0.67 : 0)
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            withAnimation(Animation.easeInOut.repeatForever()) {
                animate.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                    move.toggle()
                }
            }
        }
    }
}

struct AnimateableDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimateableDataBootcamp()
    }
}

struct RectangleWithSingleCornerAnimation: Shape {
    
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct RectangleWithCustomCorners: Shape {
    
    let corners: UIRectCorner
    var cornerRadius: CGFloat
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { cornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

struct Pacman: Shape {
    
    var offsetAmount: Double
    
    var animatableData: Double {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: offsetAmount),
                endAngle: Angle(degrees: 360 - offsetAmount),
                clockwise: false)
        }
    }
}
