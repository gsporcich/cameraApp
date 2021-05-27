//
//  ViewController.swift
//  camera
//
//  Created by period6 on 5/19/21.
//  Copyright © 2021 period6. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @IBOutlet weak var pictureView : UIImageView!
    let pickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerController.delegate = self
        pickerController.allowsEditing = true
    }
    @IBAction func cameraAction(_ sender: Any) {

  pickerController.mediaTypes = ["public.image", "public.movie"]
  pickerController.sourceType = .camera
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
               // imageViewPic.contentMode = .scaleToFill
            pictureView.image = pickedImage
           }
           picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        }
    @IBAction func libraryAction(_ sender: Any) {
openGallary()
        }
    

func openCamera()
{
    if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
    {
        pickerController.sourceType = UIImagePickerController.SourceType.camera
        pickerController.allowsEditing = true
        self.present(pickerController, animated: true, completion: nil)
    }
    else
    {
        let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

func openGallary()
{
    pickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
    pickerController.allowsEditing = true
    self.present(pickerController, animated: true, completion: nil)
}

}
