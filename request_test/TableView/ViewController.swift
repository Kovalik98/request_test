//
//  ViewController.swift
//  request_test
//
//  Created by Nazar Kovalik on 31.01.2020.
//  Copyright © 2020 Nazar Kovalik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var tblPhotos: UITableView!
    var photos = [PhotoImg]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblPhotos.dataSource = self
        // Do any additional setup after loading the view.
        let service = Service(baseUrl: "https://jsonplaceholder.typicode.com/")
        service.getAllPhotoName(endPoint: "photos")
        service.completionHandler { [weak self] (photos, status, message) in
            if status {
                guard let self = self  else {return }
                guard let _photos = photos else {return}
                self.photos = _photos
                self.tblPhotos.reloadData()
            }
        }
    }
    func imagefoto(urlLink: String) -> UIImage{
    let url = URL(string: urlLink)
    let data = try? Data(contentsOf: url!)
    let img = UIImage(data: data!)
        return img!
    }
    
   
}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell") as! TableViewCell
        }
        let photo = photos[indexPath.row]
        cell.titleTVC.text = photo.title
        cell.idTVC.text = "Album " + " \(photo.id)"
     
        cell.imgTVC.image = imagefoto(urlLink: photo.url)
       
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if segue.identifier == "gallery" {

                 let indexPath = self.tblPhotos.indexPathForSelectedRow?.row
                 let vc = segue.destination as! GalleryViewController
                vc.firstImage = imagefoto(urlLink: photos[indexPath!].url)
                vc.secondImage = imagefoto(urlLink: photos[indexPath!].thumbnailUrl)
             }
         }
}
