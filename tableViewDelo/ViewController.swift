//
//  ViewController.swift
//  tableViewDelo
//
//  Created by Tatiana Pasechnik on 6/04/23.
//

import UIKit
func readData()->[Student]
{
    if UserDefaults.standard.value(forKey: "students") != nil
    {
        let data = UserDefaults.standard.value(forKey: "students") as! Data
        let students = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)as! [Student]
        return students
    } else
    {
        return [Student]()
    }
}


func showMessage(msg:String, controller: UIViewController)

{
    let alert = UIAlertController(title: "", message: msg, preferredStyle: .actionSheet);
    let action = UIAlertAction(title: "OK", style: .default)
    {
        action
        in
        controller.dismiss(animated: true, completion: nil)
    }
    alert.addAction(action)
    controller.present(alert, animated: true, completion :nil)
    
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addresTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func browseImageBtn(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let spic = info[.originalImage] as! UIImage
        imageView.image = spic
        dismiss(animated: true)
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        let sid = (Int)(idTextField.text!)
        let sname = nameTextField.text!
        let saddress = addresTextField.text!
        let spic = imageView.image

        let st = Student(id: sid!, name: sname, address: saddress, pic: spic!)

        var students = readData()
        students.append(st)
        let data = try! NSKeyedArchiver.archivedData(withRootObject: students, requiringSecureCoding: false)
        UserDefaults.standard.set(data, forKey: "students")
        
        showMessage(msg: "Student added successfully", controller: self)
        
    }
}

