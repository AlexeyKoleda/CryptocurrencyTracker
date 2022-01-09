//
//  LaunchView.swift
//  CryptocurrencyTracker
//
//  Created by Alexey Koleda on 09.01.2022.
//

import SwiftUI

struct LaunchView: View {
    
    @Binding var showLaunchView: Bool
    @State private var loadingText: [String] = "Loading your portfolio...".map { String($0) }
    @State private var showLoadingTest: Bool = false
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.launch.backgound
                .ignoresSafeArea()
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                if showLoadingTest {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.launch.accent)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingTest.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1
                }
            }
        })
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
