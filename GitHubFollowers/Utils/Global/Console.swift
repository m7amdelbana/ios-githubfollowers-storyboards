//
//  Console.swift
//  GitHubFollowers
//
//  Created by Mohamed Elbana on 3/31/20.
//  Copyright ยฉ 2020 Mohamed Elbana. All rights reserved.
//

import Foundation

open class Console {
    
    static func logAPI(_ url: String, _ headers: [String:String], _ body: Any, _ statusCode: Int, _ response: String, _ error: Error?) {
        LOG("โคด๏ธ Url", url)
        LOG("๐๐ป Headers", headers)
        LOG("๐๐ป Body", body)
        LOG("๐๐ป Status Code", statusCode)
        LOG("โคต๏ธ Response", response)
        switch statusCode {
        case 200...299:
            LOG("๐๐ป State: \(url.replacingOccurrences(of: API.BASE_URL, with: ""))", "๐ Success โน")
            break
        default:
            LOG("๐๐ป State: \(url.replacingOccurrences(of: API.BASE_URL, with: ""))", "๐ฅ Error: \(String(describing: error)) โน")
            break
        }
    }
    
    static func logError(_ type: ErrorType) {
        Console.LOG("๐ฅ Error", "\(type)")
    }
    
    static func LOG(_ tag: String, _ text: Any) {
        #if DEBUG
        print("\(tag): \(text)")
        #endif
    }
}


