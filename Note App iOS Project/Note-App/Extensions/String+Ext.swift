//
//  String+Ext.swift
//  Note-App
//
//  Created by Mateusz Zacharski on 27/12/2020.
//

import Foundation

extension String {
    func modifyStringToJSONString() -> String {
        let changedStringWithLines = self.replacingOccurrences(of: "\n", with: "@*&^")
        let changedStringWithPolishSign1 = changedStringWithLines.replacingOccurrences(of: "ó", with: "&@^$)")
        let changedStringWithPolishSign2 = changedStringWithPolishSign1.replacingOccurrences(of: "Ó", with: "&@^$*")
        return changedStringWithPolishSign2
    }
    
    func modifyJSONStringToString() -> String {
        let changedStringWithLines = self.replacingOccurrences(of: "@*&^", with: "\n")
        let changedStringWithPolishSign1 = changedStringWithLines.replacingOccurrences(of: "&@^$)", with: "ó")
        let changedStringWithPolishSign2 = changedStringWithPolishSign1.replacingOccurrences(of: "&@^$*", with: "Ó")
        return changedStringWithPolishSign2
    }
    
    func utf8EncodedString() -> String {
        let messageData = self.data(using: .nonLossyASCII)
        let text = String(data: messageData!, encoding: .utf8)
        return text!
    }
    
    func utf8DecodedString() -> String {
        let data = self.data(using: .utf8)
        if let message = String(data: data!, encoding: .nonLossyASCII){
            return message
        }
        return ""
    }
}
