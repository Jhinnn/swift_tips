//
//  TSNetworkTool.swift
//  TestSwift
//
//  Created by Arthur on 2017/8/7.
//  Copyright © 2017年 Arthur. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class DSNetworkTool: NSObject {

    static let  shareNetworkTool = DSNetworkTool()
    
    func loadNewsInfo(finished: @escaping (_ homeItems: [NewsItem]) -> ()) {
        Alamofire.request("http://qt.qq.com/php_cgi/news/php/varcache_getnews.php?id=73&page=0&plat=ios&version=9678&version=9689").responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                
                let code = dict["next"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.show(withStatus: code)
                    return
                }
                SVProgressHUD.dismiss()
                if let items = dict["list"].arrayObject {
                    var newsItems = [NewsItem]()
                    for item in items {
                        let newItem = NewsItem(dict: item as! [String: AnyObject])
                        newsItems.append(newItem)
                    }
                    finished(newsItems)
                }
              
            }
        }
    }
    
    func uploadImages(url: String, param: [String: String], data: [Data], success: @escaping(_ response: [String: AnyObject])->(), fail:@escaping(_ error: Error) -> ()) {
        let headers = ["content-type":"multipart/form-data"]
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
//            多张图片上传
//            let flag = param["flag"]
//            let userId = param["userId"]
//            
//            multipartFormData.append((flag?.data(using: String.Encoding.utf8))!, withName: "flag")
//            multipartFormData.append((userId?.data(using: String.Encoding.utf8))!, withName: "userId")
            
            for i in 0..<data.count{
                //设置图片的名字
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyyMMddHHmmss"
                let string = formatter.string(from: Date())
                let filename = "\(string).jpg"
                multipartFormData.append(data[i], withName: "img", fileName: filename, mimeType: "image/jpeg")
            }
        }, to: url, headers: headers, encodingCompletion:{ encodingResult in
            switch encodingResult{
            case .success(request: let upload,_,_):
                upload.responseJSON(completionHandler: { (response) in
                    if let value = response.result.value as? [String : AnyObject]{
                        success(value)
                    }
                })
            case .failure(let error):
                fail(error)
            }
        })
    }
    
    
    //闭包作为函数参数
    func loadNewsData(completion: @escaping (_ result: [String]) ->()) ->() {
        DispatchQueue.global().async {
            let json = ["张三","历史","王五"]
            
            DispatchQueue.main.async {
                completion(json)
            }
        }
    }
    
}
