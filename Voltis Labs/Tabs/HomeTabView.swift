//
//  HomeTabView.swift
//  Voltis Labs
//
//  Created by Macintosh HD on 21/02/2025.
//

import SwiftUI

struct HomeTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    ExploreView()
                case 2:
                    CaptureView()
                case 3:
                    InfinityView()
                case 4:
                    ProfileView()
                default:
                    HomeView()
                }
            }
            CustomTabBar(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}



#Preview {
    HomeTabView()
}







struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        HStack {
            TabBarItem(icon: Image("HomeIcon"), isSelected: selectedTab == 0) {
                selectedTab = 0
            }
            TabBarItem(icon: Image("SearchIcon"), isSelected: selectedTab == 1) {
                selectedTab = 1
            }
            TabBarItem(icon: Image("CenterIcon"), isSelected: selectedTab == 2) {
                selectedTab = 2
            }
            
            TabBarItem(icon: Image("InfinityIcon"), isSelected: selectedTab == 3) {
                selectedTab = 3
            }
            CustomProfileTabItem(isSelected: selectedTab == 4) {
                selectedTab = 4
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .padding(.bottom)
        .background(
            Color.white
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: -2)
        )
        
    }
}


struct TabBarItem: View {
    let icon: Image
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                icon
                    .font(.system(size: 24))
                    .foregroundColor(isSelected ? .brown : .gray)
                
            }
            .frame(maxWidth: .infinity)
        }
    }
}


struct CustomProfileTabItem: View {
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                ZStack {
                    Circle()
                        .stroke(Color.brown, lineWidth: 2)
                        .foregroundStyle(.vlBrown)
                        .frame(width: 40, height: 40)
                    Image("dp")
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 36, height: 36)
                }
                
            }
            .frame(maxWidth: .infinity)
        }
    }
}













