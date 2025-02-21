//
//  ProfileView.swift
//  Voltis Labs
//
//  Created by Macintosh HD on 21/02/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.orange.opacity(0.1).edgesIgnoringSafeArea(.all)
            Text("Profile")
                .font(.largeTitle)
        }
    }
}

#Preview {
    ProfileView()
}
