//
//  AppStorage.swift
//  GalleryRickAndMorty
//
//  Created by Angelina on 14.02.2021.
//

import Foundation

class AppStorage {
    
    var userDefaults: UserDefaults {
        return UserDefaults.standard
    }
    
    var isOnlineNow: Bool? {
        get {
            return UserDefaults.standard.bool(forKey: #function)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: #function)
        }
    }
    var image: [String]? {
        get {
            return UserDefaults.standard.stringArray(forKey: #function)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: #function)
        }
    }
    var date: String? {
        get {
            return UserDefaults.standard.string(forKey: #function)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: #function)
        }
    }
    var name: [String]? {
        get {
            return UserDefaults.standard.stringArray(forKey: #function)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: #function)
        }
    }

}

