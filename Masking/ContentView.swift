//
//  ContentView.swift
//  Inverted-Masking
//
//  Created by CS Prasad on 01/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isInverted = false
    
    var body: some View {
        ZStack {
            // First image as full-screen background
            isInverted ? AnyView(InvertedMask()) : AnyView(NormalMask())


            // Button at the bottom
            VStack {
                Spacer()
                Button(action: {
                    isInverted.toggle()
                }) {
                    Text(isInverted ? "Switch to normal mask" : "Switch to inverted Mask")
                        .padding()
                        .font(.headline)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.orange]), startPoint: .leading, endPoint: .trailing))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.bottom, 20)
            }
        }
        .compositingGroup()
                .shadow(color: .gray, radius: 15, x: -10, y: 10)
    }
}



// Normal Mask
struct NormalMask: View {
    var body: some View {
        Image("sequoia")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .mask {
                Image(systemName: "apple.logo")
                    .font(.system(size: 300))
            }
            .shadow(radius: 10)
    }
}

// Inverted Mask
struct InvertedMask: View {
    var body: some View {
        Image("sequoia")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()

        // Centered second image
        VStack {
            Spacer()
            Image(systemName: "apple.logo")
                .font(.system(size: 300))
                .blendMode(.destinationOut)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
