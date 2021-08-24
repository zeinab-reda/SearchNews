//
//  Helper.swift
//  NewsAppTask
//
//  Created by Zeinab Reda on 18/08/2021.
//

import Foundation

class Helper :NSObject{
    static let userDef = UserDefaults.standard
    
    // insert and retreive object or primitave data type in user defualt

    static func saveUserDefault(key: String, value: Any) {
        userDef.set(value, forKey: key)
        userDef.synchronize()

    }
    static func getUserDefault(key: String)->Any {
        return userDef.object(forKey: key) as Any
    }
    static func removeKeyUserDefault(key: String) {
        userDef.removeObject(forKey: key)
        userDef.synchronize()

    }

    static func isKeyPresentInUserDefaults(key: String) -> Bool {
        return userDef.object(forKey: key) != nil
    }
    


 


}
