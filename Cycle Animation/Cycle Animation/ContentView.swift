//
//  ContentView.swift
//  Cycle Animation
//
//  Created by rutik maraskolhe on 05/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var rightPedaling = false
    @State private var jumping = false
    @State private var leftPedaling = false
    
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black
            , Color.black
            ]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
                .scaleEffect(1.2)
            ZStack {
                
                Image("leg_l")  // Left Leg
                    .animation(Animation.interpolatingSpring(stiffness: 200, damping: 50).speed(3).repeatForever(autoreverses: true))
                    .rotationEffect(.degrees(leftPedaling ? -5 : 15), anchor: .topLeading)
                    .offset(x: -30, y: leftPedaling ? -50 : -65)
                    .onAppear() {
                    self.leftPedaling.toggle()
                    }
                Image("biker")  // Biker
                    .offset(y: -95)
                
                Image("tyres")  // Tyres
                    .foregroundColor(Color.red)
               
                Image("leg_r") // Right leg
                    .animation(Animation.interpolatingSpring(stiffness: 200, damping: 50).speed(3).repeatForever(autoreverses: true))
                    .rotationEffect(.degrees(rightPedaling ? 15 : -15), anchor: .topLeading)
                    .offset(x: -40, y: rightPedaling ? -45 : -60)
                    .onAppear() {
                        self.rightPedaling.toggle()
                        }
            }.animation(Animation.interpolatingSpring(stiffness: 200, damping: 50).speed(3).repeatForever(autoreverses: true))
             .offset(y: jumping ? -1 : 1)
             .onAppear() {
                self.jumping.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
