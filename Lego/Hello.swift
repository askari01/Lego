//
//  Hello.swift
//  Lego
//
//  Created by Syed Askari on 07/02/2017.
//  Copyright © 2017 Syed Askari. All rights reserved.
//

import Foundation
import Firebase

@objc class Hello1 : NSObject {
    public func hi() -> String {
        return "hi"
    }
}

struct Marker {
    let key: String
    let latitude: Float
    let longitude: Float
    var title: String
    var detail: String
    let ref: FIRDatabaseReference?
    
    init(latitude: Float, longitude: Float, title: String, detail: String, key: String = "" ){
        self.key = key
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
        self.detail = detail
        self.ref = nil
    }
    
    init (snapshot: FIRDataSnapshot){
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        latitude = snapshotValue["latitude"] as! Float
        longitude = snapshotValue["longitude"] as! Float
        title = snapshotValue["title"] as! String
        detail = snapshotValue["detail"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "latitude": latitude,
            "longitude": longitude,
            "title": title,
            "detail": detail
        ]
    }
}
