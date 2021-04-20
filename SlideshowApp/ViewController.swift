//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Ami Hirahara on 2021/04/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var theNextButton: UIButton!
    @IBOutlet weak var theBackButton: UIButton!
    @IBAction func onTapImage(_ sender: Any) {
        //segueを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のnextViewControllerを取得する
        let nextView = segue.destination as! nextViewController
        nextView.imageData = ImageView.image!
    }
    var imageIndex = 0
    var timer: Timer!
    
    let images = [UIImage(named: "A"), UIImage(named: "B"), UIImage(named: "C")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let imageView = images[0]
        ImageView.image = imageView
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //進むボタン
    @IBAction func nextImage(_ sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        ImageView.image = images[imageIndex]
    }
    //戻るボタン
    @IBAction func backImage(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        ImageView.image = images[imageIndex]
    }
    //再生 停止ボタン
    @IBAction func startStop(_ sender: UIButton) {
        if self.timer != nil{
            sender.setTitle("再生", for: UIControl.State.normal)
            timer!.invalidate()
            timer = nil
            theNextButton.isEnabled = true
            theBackButton.isEnabled = true
        } else {
            sender.setTitle("停止", for: UIControl.State.normal)
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            theNextButton.isEnabled = false
            theBackButton.isEnabled = false
        }
    }
    @objc func onTimer(_ timer: Timer){
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        ImageView.image = images[imageIndex]
    }
}
