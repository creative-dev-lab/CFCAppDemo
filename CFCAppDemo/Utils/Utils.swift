//
//  Utils.swift
//  CFCAppDemo
//
//  Created by King on 2/17/23.
//

import Foundation
import UIKit

class Utils {
    static func closeKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
