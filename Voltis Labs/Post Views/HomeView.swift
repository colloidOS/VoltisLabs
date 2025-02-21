//
//  HomeView.swift
//  Voltis Labs
//
//  Created by Macintosh HD on 21/02/2025.
//

import SwiftUI

struct HomeView: View {
    var posts: [Post] = samplePosts
    var body: some View {
        VStack{
            HStack(spacing: 15){
                VStack(spacing: 5){
                    ForEach(0..<2) {_ in
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.vlBrown)
                            .frame(width: 20, height: 9)
                    }
                }
                
                HStack(spacing: 5){
                    ForEach(0..<2) {_ in
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.vlBrown)
                            .opacity(0.15)
                            .frame(width: 9, height: 20)
                    }
                }
                
                Spacer()
                
                Text("Feed")
                    .foregroundStyle(.vlBrown)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image("VideoIcon")
                
                Image("NotificationIcon")
                    .overlay(alignment: .topTrailing) {
                        Circle()
                            .foregroundStyle(.red)
                            .frame(height: 12)
                            .offset(x: 2, y: -2)
                        Text("1")
                            .foregroundStyle(.white)
                            .font(.system(size: 9))
                            .offset(x: 2, y: -2)
                    }
                    
                
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            ScrollView(showsIndicators: false){
                LazyVStack(spacing: 20) {
                        ForEach(posts) { post in
                            PostView(post: post)
                        }
                    }
                    .padding(.vertical)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomeView()
}

struct PostView: View {

    let post: Post
    @State private var isLiked: Bool = false
        var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                HStack(alignment: .top, spacing: 10) {
                    ZStack {
                        Image(post.displayPicture)
                            .resizable()
                            .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        
                        Circle()
                            .stroke(lineWidth: 2)
                            .foregroundColor(.vlBrown)
                            .frame(width: 40, height: 40)
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text(post.firstName)
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundStyle(.vlBrown) +
                        Text(" \(post.lastName)")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundStyle(.vlBrown)
                        if let loc = post.location {
                                Text(loc)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                    }
                    
                }
                
                
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.system(size: 24))
                    .foregroundColor(.vlBrown)
            }
            .padding(.horizontal, 10)
            
            if post.postImage.count > 1 {
                CarouselFeedImageView(images: post.postImage)
                                .frame(height: 300)
                        } else {
                            Image(post.postImage.first ?? "")
                                .resizable()
                                .scaledToFill()
                            HStack(spacing: 16) {
                                Button(action: {
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            isLiked.toggle()
                                        }
                                    }) {
                                        Image(systemName: isLiked ? "heart.fill" : "heart")
                                            .font(.system(size: 24))
                                            .foregroundColor(.vlBrown)
                                            .scaleEffect(isLiked ? 1.1 : 1.0)
                                    }
                                
                                Image("BookMarkIcon")
                                    .font(.system(size: 24))
                                    .foregroundColor(.vlBrown)
                                Spacer()
                                
                                
                                
                                Spacer()
                                Image("PlaneIcon")
                                    .font(.system(size: 24))
                                    .foregroundColor(.vlBrown)
                                
                                Image("ShareIcon")
                                    .font(.system(size: 24))
                                    .foregroundColor(.vlBrown)
                            }
                            .padding(.horizontal, 15)
                            .padding(.vertical, 6)
                            .font(.title2)
                        }
            
            
            
            if let description = post.description   {
                ExpandableDescription(prefix: post.firstName, description: description)
                .padding(.horizontal, 12)
            }
            
            

        }
        Divider()
    }
}


struct CarouselFeedImageView: View {
    @State private var currentPage: Int = 0
    @State private var isLiked: Bool = false
    let images: [String]
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack(spacing: 16) {
                Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            isLiked.toggle()
                        }
                    }) {
                        Image(systemName: isLiked ? "heart.fill" : "heart")
                            .font(.system(size: 24))
                            .foregroundColor(.vlBrown)
                            .scaleEffect(isLiked ? 1.1 : 1.0)
                    }
                
                Image("BookMarkIcon")
                    .font(.system(size: 24))
                    .foregroundColor(.vlBrown)
                Spacer()
                
                CustomPageIndicator(currentPage: currentPage, totalPages: images.count)
                
                Spacer()
                Image("PlaneIcon")
                    .font(.system(size: 24))
                    .foregroundColor(.vlBrown)
                
                Image("ShareIcon")
                    .font(.system(size: 24))
                    .foregroundColor(.vlBrown)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 6)
        }
    }
}

struct CustomPageIndicator: View {
    var currentPage: Int
    var totalPages: Int

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<totalPages, id: \.self) { index in
                Circle()
                    .fill(index == currentPage ? Color.black : Color.gray)
                    .frame(width: indicatorSize(for: index), height: indicatorSize(for: index))
                    .animation(.easeInOut(duration: 0.3), value: currentPage)
            }
        }
    }
    
    func indicatorSize(for index: Int) -> CGFloat {
        if index == currentPage {
            return 7
        } else if abs(index - currentPage) <= 1 {
            return 5
        } else {
            return 3
        }
    }
}


