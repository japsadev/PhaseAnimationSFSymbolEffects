//
//  ContentView.swift
//  PhaseAnimationSFSymbolEffects
//
//  Created by japsa on 12.06.2024.
//

import SwiftUI

struct PhaseAnimatorAPITtutorial: View {

    @State private var switchSymbols: Bool = false
    var body: some View {
        PhaseAnimator(SFImages.allCases, trigger: switchSymbols) { symbol in

            Circle().fill(symbol.color.gradient).frame(height: 100)
                .shadow(color:symbol.color.opacity(0.5),radius: 10)
                .overlay(alignment: .center) {
                    Image(systemName:symbol.rawValue)
                        .font(.system(size: 40))
                        .foregroundStyle(.white)
                        .symbolEffect(.bounce, value: switchSymbols) 

                }
                .onTapGesture {
                    switchSymbols.toggle()
                }

        } animation: { animation in
            switch animation {

            case .settings: .linear

            case .world: .bouncy

            case .iphone: .smooth

            }
        }

    }
}

#Preview {
    PhaseAnimatorAPITtutorial()
}

enum SFImages:String,CaseIterable {
    case settings = "gear"
    case world = "globe.desk.fill"
    case iphone = "iphone"

    var color: Color {
        switch self {

        case .settings: .blue

        case .world: .green

        case .iphone: .red

        }
    }

}
