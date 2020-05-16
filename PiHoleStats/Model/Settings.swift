//
//  Settings.swift
//  PiHoleStats
//
//  Created by Fernando Bunn on 11/05/2020.
//  Copyright © 2020 Fernando Bunn. All rights reserved.
//

import Foundation
import Combine

private enum SettingsKey: String {
    case host = "SettingsKeyHost"
}

class Settings: ObservableObject {
    var keychainToken = APIToken()

    @Published var host: String = UserDefaults.standard.object(forKey: SettingsKey.host.rawValue) as? String ?? "" {
        didSet {
            UserDefaults.standard.set(host, forKey: SettingsKey.host.rawValue)
        }
    }
    
    var apiToken: String  {
        set {
            keychainToken.token = newValue
        } get {
            keychainToken.token
        }
    }
}