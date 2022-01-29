//
//  HomeService.swift
//  TQIBankDIO
//
//  Created by Roberth Diorges on 29/01/22.
//

import Foundation
import VFNetwork

class HomeService: RequestService<HomeAPI> {
    
    func getMenus(completion: @escaping (Result<MenuOptions, Error>) -> Void) {
        execute(.menus, responseType: MenuOptions.self, completion: completion)
    }
}
