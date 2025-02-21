//
//  InfinityView.swift
//  Voltis Labs
//
//  Created by Macintosh HD on 21/02/2025.
//

import SwiftUI

struct InfinityView: View {
    var body: some View {
        ZStack {
            Color.pink.opacity(0.1).edgesIgnoringSafeArea(.all)
            Text("Infinity")
                .font(.largeTitle)
        }
    }
}

#Preview {
    InfinityView()
}
