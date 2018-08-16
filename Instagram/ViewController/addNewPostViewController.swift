//
//  addNewPostViewController.swift
//  Instagram
//
//  Created by Mayank Gandhi on 16/08/18.
//  Copyright © 2018 Mayank Gandhi. All rights reserved.
//

import UIKit

class addNewPostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var PostImage: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func AddPost(_ sender: Any)
    {
        print("add Posr Pressed")
        let caption = captionField.text
        let image = PostImage.image
        
        Post.postUserImage(image: image, withCaption: caption, withCompletion: nil)
    }
    
    @IBAction func takeAPicture(_ sender: Any)
    {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        PostImage.image = editedImage
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
