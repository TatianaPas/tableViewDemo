//
//  Student.swift
//  tableViewDelo
//
//  Created by Tatiana Pasechnik on 6/04/23.
//

import Foundation
import UIKit
class Student : NSObject, NSCoding
{
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(address, forKey: "address")
        coder.encode(pic, forKey: "pic")
    }
    
    required init?(coder: NSCoder) {
        self.id = coder.decodeInteger(forKey: "id")
        self.name = coder.decodeObject(forKey: "name") as! String
        self.address = coder.decodeObject(forKey: "address") as! String
        self.pic = coder.decodeObject(forKey: "pic") as! UIImage
    }
    
    var id: Int = 0
    var name : String
    var address: String
    var pic : UIImage
    
    init(id:Int, name:String, address:String, pic:UIImage) {
        self.id = id;
        self.name = name;
        self.address = address;
        self.pic = pic
    }
}
