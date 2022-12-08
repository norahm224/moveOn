//
//  SignFace.swift
//  flow3
//
//  Created by asayel on 24/05/1444 AH.
//

import SwiftUI
import LocalAuthentication

struct SignFace: View {
    @State var showingsignupscreen = false
    @State var text = ""
    var body: some View {
        
        
        Button("Sign in with Apple Face ID") { authenticate()
            
        }.foregroundColor(.white)
            .frame(width: 250, height: 45)
            .background (Color.black)
            //.cornerRadius(23.5)
            .navigationDestination(isPresented: $showingsignupscreen) {
                EmptyView()
                    .navigationBarBackButtonHidden()
            }.padding(.top,300)
        
        
    }
        
        func authenticate() {
            
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "This is for security reasons") { success, authenticationError in
                    
                    
                    if success {
                        text = ""
                        showingsignupscreen = true
                    }
                    else { text = "There was a problem!"
                        
                    }
                    
                }
            } else {
                text = "Phone does not have Biometrics"
                    
                
            
        }
    }
}

struct SignFace_Previews: PreviewProvider {
    static var previews: some View {
        SignFace()
    }
}
