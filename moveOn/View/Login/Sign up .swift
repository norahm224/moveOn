//
//  Signup.swift
//  flow3
//
//  Created by asayel on 18/05/1444 AH.
//

import SwiftUI

struct Sign_up: View {
    @State var username = ""
    @State var Password = ""
    @State var email = ""
    @State var showinghomescreen = false
    @State var showingloginscreen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("mnri")
                   .padding(.bottom,679)
                   
                
                Text("  اهلا والله نورتنا")
                    .font(.title)
                    .fontWeight(.regular)
                    .padding()
                    .padding(.leading,170)
                    .foregroundColor(Color("p"))
                    .padding(.bottom,500)
                
                Text("الاسم/اللقب :")
                    .font(.body)
                    .fontWeight(.regular)
                    .padding(.leading,219)
                    .foregroundColor(Color("p"))
                    .padding(.bottom,270)
                    .padding()
                
                Rectangle()
                    .fill(Color("p"))
                    .frame(width: 316, height: 2)
                    .cornerRadius(23.5)
                    .padding(.bottom,160)
                
                
                TextField("jyyyyyyyj" , text: self.$username)
                    .multilineTextAlignment(.trailing)
                    .padding(.trailing,50)
                    .padding(.bottom,200)
                
                
                
                ZStack{
                    Text("كلمة السر :")
                        .font(.body)
                        .fontWeight(.regular)
                        .padding(.leading,250)
                        .foregroundColor(Color("p"))
                        .padding(.bottom,100)
                        .padding()
                    
                    Rectangle()
                        .fill(Color("p"))
                    
                        .frame(width: 316, height: 2)
                        .cornerRadius(23.5)
                        .padding(.top,15)
                    
                    SecureField("gggggggg" , text: $Password)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing)
                        .padding(.trailing,30)
                        .padding(.bottom,30)
                    
                    
                    
                    
                    Text("الايميل:")
                        .font(.body)
                        .fontWeight(.regular)
                        .padding(.leading,260)
                        .foregroundColor(Color("p"))
                        .padding(.top,70)
                        .padding()
                    
                    Rectangle()
                        .fill(Color("p"))
                        .frame(width: 316, height: 2)
                        .cornerRadius(23.5)
                        .padding(.top,189)
                    
                    
                    TextField("jyyyyyyyj" , text: self.$email)
                        .multilineTextAlignment(.trailing)
                        .padding(.trailing,50)
                        .padding(.top,130)
                    
                    Text("عندك حساب ؟")
                        .foregroundColor(.gray)
                        .padding(.top,430)
                        .padding(.leading,115)
                    
                    
                    Button(" سجل دخول") {
                        showingloginscreen = true
                    } .foregroundColor(Color("p"))
                        .navigationDestination(isPresented: $showingloginscreen) {
                            Sign_in()
                            
                        }.padding(.top,430)
                        .padding(.trailing,85)
                    
                    
                    Button("حساب جديد ") {
                        showinghomescreen = true
                    } .foregroundColor(Color("p"))
                        .frame(width: 316, height: 47) .background (Color("g"))  .cornerRadius(23.5)
                        .navigationDestination(isPresented: $showinghomescreen) {
                            EmptyView()
                                //.navigationBarBackButtonHidden()
                        }.padding(.top,350)
                }
                
                Image("a[ni")
                   .padding(.top,700)
                   .padding()
                
            }
            
                }
                
        
        
    }
}

struct Signup_Previews: PreviewProvider {
    static var previews: some View {
        Sign_up()
    }
}
