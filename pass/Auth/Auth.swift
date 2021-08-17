//
//  Auth.swift
//  pass
//
//  Created by User on 17.08.2021.
//

import UIKit
import LocalAuthentication

class Auth{
    let authenticationContext = LAContext()
           var error:NSError?
    func authentification(){
           guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
               print("No Biometric Sensor Has Been Detected. This device does not support Touch Id.")
               return
           }
           authenticationContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Only device owner is allowed", reply: { (success, error) -> Void in

               if( success ) {
                   print("Fingerprint recognized. You are a device owner!")
               } else {
                   
                   // Check if there is an error
                   if let errorObj = error {
                       print("Error took place. \(errorObj.localizedDescription)")
                   }
                   
               }
           })
    }
}
