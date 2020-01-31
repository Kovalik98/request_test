//
//  PhotoViewController.swift
//  request_test
//
//  Created by Nazar Kovalik on 31.01.2020.
//  Copyright © 2020 Nazar Kovalik. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var mainPhoto: UIImageView!
    var titlePhoto = ""
    var onlyImage : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        mainPhoto.image = onlyImage
        self.navigationItem.title = titlePhoto
        // Do any additional setup after loading the view.
    }


}
