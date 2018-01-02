//
//  LoginController+handlers.swift
//  gameofchats
//
//  Created by Terry Cheng on 12/30/17.
//  Copyright © 2017 Terry Cheng. All rights reserved.
//

import UIKit
import Firebase

extension LoginController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func handleRegister() {
        guard let email = emailTextField.text, let password = passwordTextField.text,
            let name = nameTextField.text else {print("Form is not valid"); return}
        
        Auth.auth().createUser(withEmail: email, password: password) {(user, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            guard let uid = user?.uid else {
                return
            }
            
            //successfully authenticated user
            let imageName = NSUUID().uuidString
            
            let storageRef = Storage.storage().reference().child("profile_images").child("\(imageName).png")
            
            if let uploadData = UIImageJPEGRepresentation(self.profileImageView.image!, 0.2) {
            //if let uploadData = UIImagePNGRepresentation(self.profileImageView.image!) {
                storageRef.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                    if error != nil {
                        print(error)
                        return
                    }
                    
                    if let profileImageUrl = metadata?.downloadURL()?.absoluteString {
                        
                        let values = ["name" : name, "email" : email, "profileImageUrl" : profileImageUrl]
                        
                        self.registerUserIntoDatabaseWithUID(uid : uid, values: values as [String : AnyObject])
                    }
                })
            }
        }
    }
    
    private func registerUserIntoDatabaseWithUID(uid: String, values: [String : AnyObject]) {
        
        let ref = Database.database().reference()
        
        let usersReference = ref.child("users").child(uid)
        
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
            
            if err != nil {
                print(err)
                return
            }
            
//            self.messageController?.navigationItem.title = values["name"] as? String
            let user = User(dictionary: values)
            self.messageController?.setupNavBarWithUser(user: user)
            
            self.dismiss(animated: true, completion: nil)
            print("Successfully user account created")
        })
    }
    
    @objc func handleSelectProfileImageView() {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var seletedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            seletedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            seletedImageFromPicker = originalImage
        }
        
        if let selectedImage = seletedImageFromPicker {
            profileImageView.image = selectedImage
            // profileImageView.layer.radius = profileImageView.frame.width / 2
            // profileImageView.layer.masksToBounds = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceled picker")
        dismiss(animated: true, completion: nil)
    }
    
}
