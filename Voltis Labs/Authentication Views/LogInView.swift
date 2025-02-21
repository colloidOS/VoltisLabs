//
//  LogInView.swift
//  Voltis Labs
//
//  Created by Macintosh HD on 20/02/2025.
//

import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordHidden = true
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                Text("Log in")
                    .foregroundStyle(.vlBrown)
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .padding(.top, 15)
                VStack(spacing: 8) {
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .focused($focusedField, equals: .email)
                        .padding(.vertical, 8)
                    
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.vlBrown.opacity(0.15))
                            Rectangle()
                                .foregroundColor(.vlBrown)
                                .frame(width: focusedField == .email ? geometry.size.width : 0, height: 2)
                                .animation(.easeOut(duration: 0.3), value: focusedField)
                        }
                    }
                    .frame(height: 2)
                }
                
                VStack(spacing: 8) {
                    HStack {
                        if isPasswordHidden {
                            
                            SecureField("Password", text: $password)
                                .focused($focusedField, equals: .password)
                                .padding(.vertical, 8)
                                                    
                        } else {
                            TextField("Password", text: $password)
                                .focused($focusedField, equals: .password)
                                .padding(.vertical, 8)
                        }
                        
                        Spacer()
                        
                            Image(systemName: isPasswordHidden ? "eye.slash" : "eye")
                                .font(.system(size: 20))
                            .foregroundStyle(.vlBrown)
                            .onTapGesture {
                                isPasswordHidden.toggle()
                            }
                            .padding(.vertical, 5)
                        
                        
                    }
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .frame(height: 2)
                                .foregroundColor(Color.vlBrown.opacity(0.15))
                            Rectangle()
                                .foregroundColor(.vlBrown)
                                .frame(width: focusedField == .password ? geometry.size.width : 0, height: 2)
                                .animation(.easeOut(duration: 0.3), value: focusedField)
                        }
                    }
                    .frame(height: 2)
                    HStack{
                        NavigationLink{
                            
                        } label: {
                            Text("Forgot password?")
                                .foregroundStyle(.vlBrown)
                                .font(.system(size: 14))
                            .fontWeight(.medium)
                        }
                        Spacer()
                    }
                    .padding(.top)
                }
                
                
                NavigationLink{
                    HomeTabView()
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.vlBrown)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top, 15)
                
                Text("or")
                    .foregroundStyle(.vlBrown)
                    .opacity(0.5)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                
                VStack(spacing: 12){
                    Button{
                        
                    } label: {
                        HStack{
                            Image("facebook")
                            Spacer()
                            Text("Continue with Facebook")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                                .padding(.trailing, 10)
                            
                            Spacer()

                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke()
                                .foregroundStyle(.gray)
                        }
                           
                            
                    }
                    
                    Button{
                        
                    } label: {
                        HStack{
                            Image("google")
                            Spacer()
                            Text("Continue with Google")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                                .padding(.trailing, 10)
                            
                            Spacer()

                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke()
                                .foregroundStyle(.gray)
                        }
                           
                            
                    }
                    
                    Button{
                        
                    } label: {
                        HStack{
                            Image(systemName: "apple.logo")
                                .foregroundStyle(.black)
                                .font(.system(size: 24))
                            
                            Spacer()
                            Text("Continue with Apple")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                                .padding(.trailing, 10)
                            
                            Spacer()

                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke()
                                .foregroundStyle(.gray)
                        }
                           
                            
                    }
                    
                    HStack{
                        Text("Don't have an account?")
                            .foregroundStyle(.vlBrown)
                            .opacity(0.5)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                        
                        Button{
                            
                        } label: {
                            Text("Join")
                                .foregroundStyle(.vlBlue)
                                .font(.system(size: 14))
                                .fontWeight(.medium)
                        }
                    }
                    .padding(.top, 15)
                }
                
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    
                    Button{
                        dismiss()
                    } label: {
                        Image("BackArrow")
                    }
                }
            }
        .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    LogInView()
}




enum Field: Hashable {
    case email, password
}

