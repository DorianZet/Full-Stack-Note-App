//
//  APIFunctions.swift
//  Note-App
//
//  Created by Mateusz Zacharski on 24/12/2020.
//

import UIKit
import Alamofire

// MARK: - Protocols

protocol DataDelegate {
    func updateArray(newArray: String)
}

// MARK: - Functions that interact with API. INSERT YOUR IPv4 ADDRESS IN THE REQUESTS BELOW, OTHERWISE THE NETWORKING FUNCTIONS WON'T WORK!
class APIFunctions {
    
    var delegate: DataDelegate?
    
    static let functions = APIFunctions()
    
    func fetchNotes(for VC: UIViewController) {
        AF.request("http://000.000.0.000:8081/fetch").response { [weak self] (response) in
            guard let responseData = response.data, let _ = response.response, response.error == nil else {
                VC.presentAlertOnMainThread()
                return
            }
            
            let data = String(data: responseData, encoding: .utf8)?.utf8DecodedString()

            self?.delegate?.updateArray(newArray: data!)
        }
    }
    
    func addNote(date: String, title: String, note: String) {
        AF.request("http://000.000.0.000:8081/create", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title.utf8EncodedString(), "date": date, "note": note.utf8EncodedString()]).responseJSON { (response) in
            print(response)
        }
    }
    
    func updateNote(date: String, title: String, note: String, id: String) {
        AF.request("http://000.000.0.000:8081/update", method: .post, encoding: URLEncoding.httpBody, headers: ["title": title.utf8EncodedString(), "date": date, "note": note.utf8EncodedString(), "id": id]).responseJSON { (response) in
            print(response)
        }
    }
    
    func deleteNote(id: String) {
        AF.request("http://000.000.0.000/delete", method: .post, encoding: URLEncoding.httpBody, headers: ["id": id]).responseJSON { (response) in
            print(response)
        }
    }
    
    
}
