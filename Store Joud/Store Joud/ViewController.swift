//
//  ViewController.swift
//  Store Joud
//
//  Created by ahmed on 3/20/21.
//

import UIKit
import Alamofire
class ViewController: UIViewController,UITextFieldDelegate {
    
    //MARK:- IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fullNameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordAgainView: UIView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordtextField: UITextField!
    @IBOutlet weak var passwordAgainTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    //MARK:- VARS
    
    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    //MARK:- LifeCycle


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let textField = UITextField()
        self.hideKeyboardWhenTappedAround()
        textField.delegate = self
        fullNameTextField.delegate = self
        emailTextField.delegate = self
        passwordtextField.delegate = self
        passwordAgainTextField.delegate = self
        signUpButton.layer.cornerRadius = 5
        
        fullNameView.layer.cornerRadius =  5
        fullNameView.layer.borderWidth = 0.5
        fullNameView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
        emailView.layer.cornerRadius =  5
        emailView.layer.borderWidth = 0.5
        emailView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
        passwordView.layer.cornerRadius =  5
        passwordView.layer.borderWidth = 0.5
        passwordView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
        passwordAgainView.layer.cornerRadius =  5
        passwordAgainView.layer.borderWidth = 0.5
        passwordAgainView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK:- Helpers Function
    
    func registerApi (){
        guard  let fullName = fullNameTextField.text , !fullNameTextField.text!.isEmpty  else {return}
        guard let email = emailTextField.text ,!emailTextField.text!.isEmpty else {return }
        guard let phone = passwordtextField.text , !passwordtextField.text!.isEmpty else {return}
        guard let passwordgain = passwordAgainTextField.text , !passwordAgainTextField.text!.isEmpty else {return }
        let parms = ["full_name":fullName,
                     "email":email,
                     "phone":phone,
        "password":passwordgain] as [String:Any]
        let headers = ["Accept":"application/json","Content-Type":"application/json"]
        let url =  "https://storejoud.com/api/register"
        
        Alamofire.request(url, method: .post, parameters: parms, encoding: JSONEncoding.default, headers: headers).responseJSON { (respose) in
            switch respose.result{
            case.success(let value):
            print(value)
            case.failure(let error):
                print(error)
            }
        }
        }
  

    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField.isFirstResponder {
            if textField.tag == 0 {
                fullNameView.layer.borderColor = .init(red: 1, green: 0.5, blue: 0, alpha: 1)
            }else if textField.tag == 1 {
                emailView.layer.borderColor = .init(red: 1, green: 0.5, blue: 0, alpha: 1)
            }else if textField.tag == 2{
                passwordView.layer.borderColor = .init(red: 1, green: 0.5, blue: 0, alpha: 1)
                
            }else if textField.tag == 3 {
                passwordAgainView.layer.borderColor = .init(red: 1, green: 0.5, blue: 0, alpha: 1)
                
            }
        }
        
        scrollView.setContentOffset(CGPoint(x: 0, y: (textField.superview?.frame.origin.y)! - 300 ), animated: true)
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField.resignFirstResponder(){
            if  textField.tag == 0 {
                fullNameView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
                
            }else if textField.tag == 1 {
                emailView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
                
            }else if textField.tag == 2 {
                passwordView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
                
            }else if textField.tag == 3 {
                passwordAgainView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
                
            }
            
        }
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        
    }
    @IBAction func signUpButton(_ sender: UIButton) {
        registerApi()
    }
}





//MARK: - Control with keyBoard
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}




    




