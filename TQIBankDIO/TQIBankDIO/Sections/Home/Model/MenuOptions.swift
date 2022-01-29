//
//  MenuOptions.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import Foundation
import VFNetwork

public struct MenuOptions: VCodable {
    public init() {
        menuOptions = []
    }
    
    public var menuOptions: [MenuOption] = []
}

public struct MenuOption: VCodable {
    public var url: String = ""
    public var name: String = ""
    public var type: MenuOptionType
}

public enum MenuOptionType: String, VCodable {
    case extract = "EXTRACT"
    case pix = "PIX"
    case card = "CARD"
    case payment = "PAYMENT"
    case deposit = "DEPOSIT"
}

