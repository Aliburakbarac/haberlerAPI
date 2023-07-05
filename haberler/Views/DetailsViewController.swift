//
//  DetailsViewController.swift
//  haberler
//
//  Created by Ali Burak Baraç on 28.06.2023.
//

import UIKit
import AVKit


class DetailsViewController: UIViewController {

    @IBOutlet weak var haberImg: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var haber: haberModel.News?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = haber?.title
        descriptionLabel.text = haber?.spot
       
       
            
        
        
    }
    func playVideo(){
        
        guard let videoURLString = haber?.videoUrl,
                  let videoURL = URL(string: videoURLString) else {
                return
            }
            
            let player = AVPlayer(url: videoURL)
            let avController = AVPlayerViewController()
        
            avController.player = player
            present(avController, animated: true){
            player.play()
        }
        
    }

    
     @IBAction func playVideoClicked(_ sender: Any) {
         playVideo()
     }
    

}
