//
//  SwiftUIView.swift
//  ChessClone
//
//  Created by Teacher on 12/08/25.
//

import SwiftUI

struct ChessLoginView: View {
    @State private var usernameOrEmail = ""
    @State private var password = ""
    @State private var rememberMe = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20) {
                Spacer().frame(height: 40)
                
                // Logo and title
                HStack(spacing: 8) {
                    Image("logochess")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 100)
                        .foregroundColor(.green)
                    
                    Spacer()
                }
                .padding(.horizontal,120)
                
                // Input fields
                VStack(spacing: 15) {
                    TextField("Username or Email", text: $usernameOrEmail)
                        .padding()
                        .background(Color(.darkGray).opacity(0.3))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.darkGray).opacity(0.3))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                    
                    HStack {
                        Toggle(isOn: $rememberMe) {
                            Text("Remember me")
                                .foregroundColor(.white)
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        Spacer()
                        Button(action: {
                            // Forgot password action
                        }) {
                            Text("Forgot Password?")
                                .foregroundColor(Color.blue)
                        }
                    }
                }
                .padding(.horizontal)
                
                // Login button
                NavigationLink(destination: HomePageView()) {
                    Text("Log In")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "81B64C"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // OR separator
                HStack {
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    Text("OR")
                        .foregroundColor(.gray)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Social login buttons
                VStack(spacing: 15) {
                    Button(action: {
                        // Apple login
                    }) {
                        HStack(spacing : 80) {
                            Image(systemName: "applelogo")
                                .resizable()
                                .frame(width: 20, height: 23)
                            Text("Log in with Apple")
                                .padding(.trailing,70)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Google login
                    }) {
                        HStack(spacing : 80){
                            Image("Googlelogo")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Log in with Google")
                                .padding(.trailing,61)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        // Facebook login
                    }) {
                        HStack(spacing : 80) {
                            Image("facebook")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Text("Log in with Facebook")
                                .padding(.trailing,42)
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Sign up link
                HStack {
                    Text("New?")
                        .foregroundColor(.gray)
                    Button(action: {
                        // Sign up action
                    }) {
                        Text("Sign up - and start playing chess!")
                            .foregroundColor(Color.blue)
                    }
                }
                .padding(.bottom, 20)
            }
            .background(Color(hex: "302E2B"))
        }
    }
    
    // Checkbox Toggle Style for the remember me checkbox
    struct CheckboxToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            Button(action: {configuration.isOn.toggle()}) {
                HStack {
                    Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                        .foregroundColor(configuration.isOn ? .green : .white)
                    configuration.label
                }
            }
        }
    }
}

struct ChessLoginView_Previews: PreviewProvider {
    static var previews: some View {
        ChessLoginView()
            .preferredColorScheme(.dark)
    }
}