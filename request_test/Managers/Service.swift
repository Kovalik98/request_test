//
//  Service.swift
//  request_test
//
//  Created by Nazar Kovalik on 31.01.2020.
//  Copyright © 2020 Nazar Kovalik. All rights reserved.
//

import Foundation
import Alamofire

class Service{
    fileprivate var baseUrl = ""
    typealias photosCallBack = (_ photos:[PhotoImg]?,_ status: Bool,_ message:String) -> Void
    var callBack: photosCallBack?
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    func getAllPhotoName(endPoint:String) {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
            (responseData) in
            guard let data = responseData.data else {
                self.callBack?(nil,  false, "")
                return}
            do{
                let photos = try JSONDecoder().decode([PhotoImg].self, from: data)
                self.callBack?(photos, true,"")
            } catch{
               
                self.callBack?(nil,  false, error.localizedDescription)
            }
        }
    }
    func completionHandler(callBack: @escaping photosCallBack){
        self.callBack = callBack
    }
 
}
