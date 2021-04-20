//
//  nextViewController.swift
//  SlideshowApp
//
//  Created by Ami Hirahara on 2021/04/19.
//

import UIKit

class nextViewController: UIViewController {
    //2画面目のImageをStoryboardでこのViewControllerにIBOutletとして接続しておく
    @IBOutlet weak var nextImage: UIImageView!
    var imageData = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextImage.image = imageData
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
