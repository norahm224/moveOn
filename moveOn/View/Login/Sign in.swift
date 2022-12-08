//
//  Login.swift
//  flow2
//
//  Created by asayel on 14/05/1444 AH.
//

import SwiftUI
import LocalAuthentication
import AuthenticationServices

struct Sign_in: View {
    
    @State var username = ""
    @State var Password = ""
    @State var unlocked = false
    @State var text = ""
    @State var showinghomescreen = false
    @State var showingsignupscreen = false
    @State var showingIDscreen = false
    
    
    var body: some View {
        
        NavigationStack{
            
            ZStack {
            
            Image("green")
                .padding(.trailing,170)
                .padding(.bottom,690)
            Image("3")
                .resizable()
                .frame(width:200, height: 200)
                .padding(.top,617.0)
                .padding(.leading,183)
            
            
            Text("حياك الله معنا")
                .font(.title)
                .fontWeight(.regular)
                .padding()
                .padding(.leading,175)
                .foregroundColor(Color("p"))
                .padding(.bottom,500)
            
                
                
            Text("الاسم/اللقب :")
                .font(.body)
                .fontWeight(.regular)
                .padding()
                .padding(.leading,250)
                .foregroundColor(Color("p"))
                .padding(.bottom,270)
                .padding()
            
            Rectangle()
                .fill(Color("p"))
                .frame(width: 316, height: 2)
                .cornerRadius(23.5)
                .padding(.bottom,160)
                
                
                TextField("" , text: self.$username)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing,50)
                    .padding(.bottom,200)
            
            VStack{
                ZStack{
                    Text("كلمة السر :")
                        .font(.body)
                        .fontWeight(.regular)
                        .padding()
                        .padding(.leading,250)
                        .foregroundColor(Color("p"))
                        .padding(.bottom,100)
                        .padding()
                    
                    Rectangle()
                        .fill(Color("p"))

                        .frame(width: 316, height: 2)
                        .cornerRadius(23.5)
                        .padding(.top,15)
                                            
                    SecureField("" , text: $Password)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing)
                        .padding(.trailing,50)
                        .padding(.bottom,30)
                    
                    Text("ما عندك حساب ؟")
                        .foregroundColor(.gray)
                        .padding(.top,390)
                        .padding(.leading,130)
                    
                    Button(" سجل الان  ") {
                        showingsignupscreen = true
                    } .foregroundColor(Color("p"))
                        .navigationDestination(isPresented: $showingsignupscreen) {
                            EmptyView()
                            
                        }.padding(.top,390)
                        .padding(.trailing,85)
                    
                  
                    
                }
            }
                    
                
                
                Button("دخول") {
                    showinghomescreen = true
                } .foregroundColor(Color("p"))
                    .frame(width: 316, height: 47) .background (Color("g"))  .cornerRadius(23.5)
                    .navigationDestination(isPresented: $showinghomescreen) {
                        HomeView()
                            //.navigationBarBackButtonHidden()
                    }.padding(.top,150)
                
                
                
                Text(text)
                    .bold()
                Button("Sign in with Apple Face ID") { authenticate()
                    
                }.foregroundColor(.white)
                    .frame(width: 316, height: 47)
                    .background (Color.black)
                    .cornerRadius(23.5)
                    .navigationDestination(isPresented: $showinghomescreen) {
                        EmptyView()
                            .navigationBarBackButtonHidden()
                    }.padding(.top,300)
                
                
              
            
        }
        
            
        }
    }
    func authenticate() {
        
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "This is for security reasons") { success, authenticationError in
                
                
                if success {
                    text = ""
                    showinghomescreen = true
                }
                else { text = "There was a problem!"
                    
                }
                
            }
        } else {
            text = "Phone does not have Biometrics"
                
            
        }
    }
    
    
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        Sign_in()
    }
}
