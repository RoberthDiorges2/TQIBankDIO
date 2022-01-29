//
//  HomeAPI.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import Foundation
import VFNetwork

enum HomeAPI {
    case menus
}

extension HomeAPI: APIBuilder {
    var path: URLPath {
        switch self {
        case .menus:
            return .plain("menus/home")
        }
    }
    
    var httpMethod: HTTPMethods {
        switch self {
        case .menus:
            return .get
        }
    }
    
    var headers: HTTPHeader {
        switch self {
        case .menus:
            return .empty
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .menus:
            return .request
        }
    }
}
