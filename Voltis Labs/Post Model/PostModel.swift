//
//  PostModel.swift
//  Voltis Labs
//
//  Created by Macintosh HD on 21/02/2025.
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    let displayPicture: String
    let postImage: [String]
    let firstName: String
    let lastName: String
    let description: String?
    let location: String?
}

let samplePosts: [Post] = [
    Post(displayPicture: "FeedDP1",
         postImage: ["FeedImage1", "FeedImage2", "FeedImage1", "FeedImage2", "FeedImage1"],
         firstName: "Jennifer",
         lastName: "Lewis",
         description: "Unleash your style with our revolutionary product. Elevate your fashion game like never before. Use our product today and get the best out of premium #FashionForward #Fashio...**Read more...**",
         location: nil),
    Post(displayPicture: "FeedImage2",
         postImage: ["FeedImage2", "FeedImage1", "FeedImage2", "FeedImage1", "FeedImage2"],
         firstName: "Samantha",
         lastName: "Joan",
         description: "Unleash your style with our revolutionary product. Elevate your fashion game like never before. Use our product today and get the best out of premium #FashionForward.",
         location: "Manchester Gallery, Manchester UK"),
    Post(displayPicture: "FeedImage3",
         postImage: ["FeedImage3"],
         firstName: "Matthew",
         lastName: "Jonas",
         description: "Unleash your style with our revolutionary product.",
         location: "Manchester Gallery, Manchester UK"),
    Post(displayPicture: "FeedImage4",
         postImage: ["FeedImage4"],
         firstName: "Oliver",
         lastName: "Myers",
         description: nil,
         location: "Manchester Gallery, Manchester UK")
]
