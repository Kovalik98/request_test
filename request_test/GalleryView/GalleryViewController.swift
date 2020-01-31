//
//  ViewController.swift
//  request_test
//
//  Created by Nazar Kovalik on 31.01.2020.
//  Copyright © 2020 Nazar Kovalik. All rights reserved.
//

import UIKit



class GalleryViewController: UIViewController {
    var firstImage : UIImage?
    var secondImage : UIImage?
    var text = ""
    
    @IBOutlet weak var first_photo: UIImageView!
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var second_photo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        first_photo.image = firstImage
        second_photo.image = secondImage

            
    }
    
    @IBAction func firstButton(_ sender: Any) {
       
    }
    @IBAction func secondButton(_ sender: Any) {
       
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.identifier == "first_photo" {

                   let vc = segue.destination as! PhotoViewController
                   vc.onlyImage = firstImage
                   vc.titlePhoto = "600 x 600"
               }
                if segue.identifier == "second_photo" {

                               let vc = segue.destination as! PhotoViewController
                               vc.onlyImage = secondImage
                               vc.titlePhoto = "150 x 150"
                           }
           }

}

