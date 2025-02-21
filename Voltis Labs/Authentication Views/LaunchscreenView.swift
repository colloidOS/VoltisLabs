//
//  LaunchscreenView.swift
//  Voltis Labs
//
//  Created by Macintosh HD on 20/02/2025.
//

import SwiftUI

struct LaunchscreenView: View {
    var body: some View {
        ZStack{
            Image("LaunchImage")
                .resizable()
                .ignoresSafeArea()
            
            Text("WELCOME TO VMODEL")
                .foregroundStyle(.white)
                .font(.system(size: 14))
                .fontWeight(.medium)
            VStack{
                
                Spacer()
                VStack{
                    NavigationLink{
                        LogInView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.white)
                                .frame(width: 152, height: 40)
                            Text("Log In")
                                .font(.system(size: 14))
                                .foregroundStyle(.vlBrown)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    Button{
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.vlBrown)
                                .frame(width: 152, height: 40)
                            Text("Sign Up")
                                .font(.system(size: 14))
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.top, 12)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 3)
                            .foregroundStyle(.white)
                            .frame(width: 77, height: 25)
                        Text("BETA")
                            .font(.system(size: 14))
                            .foregroundStyle(.vlBrown)
//                            .fontWeight(.semibold)
                    }
                    
                    .padding(.top, 40)
                    .padding(.bottom, 10)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea(edges: [.bottom])
            }
        }
    }
}

#Preview {
    LaunchscreenView()
}
