//
//  User.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import Foundation
import VFNetwork

struct User: VCodable {
    let user: UserResponse?
}

struct UserResponse: VCodable {
    let name: String?
}
