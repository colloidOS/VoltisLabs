//
//  CaptureView.swift
//  Voltis Labs
//
//  Created by Macintosh HD on 21/02/2025.
//

import SwiftUI

struct CaptureView: View {
    var body: some View {
        ZStack {
            Color.red.opacity(0.1).edgesIgnoringSafeArea(.all)
            Text("Capture")
                .font(.largeTitle)
        }
    }
}

#Preview {
    CaptureView()
}
