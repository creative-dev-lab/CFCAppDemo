//
//  Env.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import Foundation

class BaseEnv {
    let dict: NSDictionary

    init(resourceName: String) {
        guard let filePath = Bundle.main.path(forResource: resourceName, ofType: "plist"),
              let plist = NSDictionary(contentsOfFile: filePath) else {
                  fatalError("Couldn't find file '\(resourceName)' plist")
              }
        self.dict = plist
    }
}

// We might need to have DebugEnv and ProdEnv separately
class Env: BaseEnv, APIKeyable {
    init() {
        super.init(resourceName: "API_KEY")
    }

    var API_KEY: String {
        dict.object(forKey: "API_KEY") as? String ?? ""
    }
}

protocol APIKeyable {
    var API_KEY: String { get }
}
