//
//  ViewController.swift
//  Propelrr-Exam
//
//  Created by Jao Garcia on 3/21/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var middleInitial: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var emailAd: UITextField!
    @IBOutlet weak var birthDate: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstName.delegate = self
        middleInitial.delegate = self
        lastName.delegate = self
        mobileNumber.delegate = self
        emailAd.delegate = self
    }
    
    //Keyboard Setup:
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        firstName.endEditing(true)
//        middleInitial.endEditing(true)
        textField.resignFirstResponder()
        print("Returned")
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Ended Succsessfully")
    }
    
    

    @IBAction func submitButton(_ sender: Any) {
        //First Name:
        if firstName.text != "" {
            if allowedCharacters(inputStringParam: firstName.text!) {
                firstName.textColor = UIColor.black
                print(capitalizeFirstLetterOfEachWord(in: firstName.text!))
            } else{
                firstName.textColor = UIColor.red
                errorAlert(messageParam: "Cannot contain special characters except comma and periods")
            }
        } else {
            errorAlert(messageParam: "First name must not be empty")
            return
        }
        
        //Middle Initial
        let middInitLength:Int = (middleInitial.text! as NSString).length
        if middInitLength <= 3 && middInitLength != 0{
            middleInitial.textColor = UIColor.black
            print(middleInitial.text!.uppercased())
        } else if middInitLength > 3 {
            middleInitial.textColor = UIColor.red
            errorAlert(messageParam: "Middle Initial can only have up to 3 characters")
        } else {
            errorAlert(messageParam: "Middle name must not be empty")
            return
        }
        
        //Last Name
        if lastName.text != "" {
            if allowedCharacters(inputStringParam: lastName.text!){
                print(capitalizeFirstLetterOfEachWord(in: lastName.text!))
            }
        } else{
            errorAlert(messageParam: "Text must not be empty or cannot contain special characters except comma and periods")
            return
        }
        
        //Mobile number
        //  Keyboard was fixed to integers only in mobile
        if mobileNumber.text != "" {
            if mobileNumber.text!.count == 11 && mobileNumber.text!.hasPrefix("09") {
                //Success
                print(mobileNumber.text!)
            }else {
                errorAlert(messageParam: "Must have 11 characters and must start with 09")
            }
        }  else{
            errorAlert(messageParam: "Cellphone number must not be empty")
        }
        
        //Email
        if emailAd.text != "" {
            if checkEmailFormat(emailParam: emailAd.text!) {
                print(emailAd.text)
            } else {
                errorAlert(messageParam: "Incorrect email format")
            }
    
        } else {
            errorAlert(messageParam: "Email must not be empty")
        }
        
        
        //Birth Day
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
    
    //Check email Format:
    func checkEmailFormat(emailParam:String) -> Bool {
        let inputString = emailParam
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        if NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: inputString) {
            // Valid email!
            return true
        } else {
            //Invalid email.
            return false
        }
    }
    
}


    
    
    
    
