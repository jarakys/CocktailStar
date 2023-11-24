//
//  FollowFingerModifier.swift
//  CocktailStar
//
//  Created by Kyrylo Chernov on 24.11.2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func followFinger() -> some View {
        self.modifier(FollowFingerModifier())
    }
}

fileprivate struct FollowFingerModifier: ViewModifier {
    @State private var point = CGPoint(x: 0, y: 0)
    @State private var degrees: Double = 0
    @State private var draging: Bool = false
    func body(content: Content) -> some View {
        GeometryReader { proxy in
            content
                .rotation3DEffect(.degrees(degrees), axis: (x: point.x, y: point.y, z: 0))
            
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ gesture in
                            let centerX = proxy.size.width / 2
                            let centerY = proxy.size.height / 2
                            let x = 0 - (gesture.location.y / centerY - 1)
                            let y = (gesture.location.x / centerX - 1)
                            let x1 = gesture.location.x - centerX
                            let y1 = gesture.location.y - centerY
                            let range = sqrt(x1 * x1 + y1 * y1)
                            let degreesFactor = range / sqrt(2 * centerX * centerX)
                            withAnimation {
                                point = CGPoint(x: x, y: y)
                                degrees = Double(30 * degreesFactor.clamped(0, 1))
                            }
                            draging = true
                        })
                        .onEnded(onDragEndedAction(gesture:))
                )
        }
    }
    private func onDragEndedAction(gesture: DragGesture.Value) -> Void {
        withAnimation {
            point = CGPoint(x: 0, y: 0)
            degrees = 0
        }
        draging = false
    }
}
fileprivate extension Comparable {
    func clamped(_ f: Self, _ t: Self)  ->  Self {
        var r = self
        if r < f { r = f }
        if r > t { r = t }
        return r
    }
}
