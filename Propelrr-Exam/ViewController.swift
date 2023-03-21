//
//  ViewController.swift
//  Propelrr-Exam
//
//  Created by Jao Garcia on 3/21/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var middleInitial: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var emailAd: UITextField!
    @IBOutlet weak var birthDate: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    
    
    @IBAction func submitButton(_ sender: Any) {
        //First Name:
        if firstName.text != nil {
            if allowedCharacters(inputStringParam: firstName.text!) {
                firstName.textColor = UIColor.black
                print(capitalizeFirstLetterOfEachWord(in: firstName.text!))
            } else{
                firstName.textColor = UIColor.red
                errorAlert(messageParam: "Cannot contain special characters except comma and periods")
            }
        } else {
            errorAlert(messageParam: "Text must not be empty")
        }
        
        //Middle Initial
        let middInitLength:Int = (middleInitial.text! as NSString).length
        if middInitLength <= 3 {
            middleInitial.textColor = UIColor.black
            print(middleInitial.text!.uppercased())
            
        } else {
            middleInitial.textColor = UIColor.red
            errorAlert(messageParam: "Middle Initial can only have up to 3 characters")
        }
        
        //Last Name
        if lastName.text != nil {
            if allowedCharacters(inputStringParam: lastName.text!){
                print(capitalizeFirstLetterOfEachWord(in: lastName.text!))
            }
        } else{
            errorAlert(messageParam: "Text must not be empty or cannot contain special characters except comma and periods")
        }
        
        //Mobile number
        //  Keyboard was fixed to integers only in mobile
//        if mobileNumber.text != nil {
//            if mobileNumber.text!.count == 11 && mobileNumber.text!.hasPrefix("09"){
//            print(mobileNumber.text!)
//
//        } else {
//            errorAlert(messageParam: "Must be validated in the right format for PH mobile numbers e.g. 09171234567")
//        }
        
        
    
        print(emailAd.text)
        //UIPicker
        print(birthDate.date)
    
    }
    
    
    //MARK: - Functions:
    
    //Capitalize all first names:
    func capitalizeFirstLetterOfEachWord(in string: String) -> String {
        let words = string.components(separatedBy: " ")
        var capitalizedWords = [String]()
        for word in words {
            let capitalizedWord = word.prefix(1).uppercased() + word.dropFirst()
            capitalizedWords.append(capitalizedWord)
        }
        return capitalizedWords.joined(separator: " ")
    }
    
    //Error Function
    func errorAlert(messageParam:String){
        let alert = UIAlertController(title: "ERROR", message: messageParam , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert,animated: true)
    }
    
    
    //Checks if character name is allowed
    func allowedCharacters(inputStringParam:String) -> Bool{
        let inputString = inputStringParam
        let allowedCharacters = CharacterSet(charactersIn: "., ")
        let specialCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890").inverted.subtracting(allowedCharacters)

        if inputString.rangeOfCharacter(from: specialCharacters) != nil {
            //String contains special characters.
            return false
        } else {
            //String does not contain special characters.
            return true
        }
    }
    
}


    
    
    
    
