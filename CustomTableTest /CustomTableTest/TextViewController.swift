//
//  TextViewController.swift
//  CustomTableTest
//
//  Created by 张佳盈 on 2020/3/1.
//  Copyright © 2020 lottagrandpa. All rights reserved.
//

import UIKit
import AVFoundation

class TextViewController: UIViewController, UITabBarDelegate {
    
    var personData : Person!
    var player: AVPlayer!
    

    @IBOutlet weak var bloodLabel: UILabel!
    
    @IBOutlet weak var tabBar: UITabBar!
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if( item.title == "Role" ){
            performSegue(withIdentifier: "Segue4", sender: personData.roleLink)
        }else if( item.title == "Actor" ){
            performSegue(withIdentifier: "Segue4", sender: personData.actorLink)
        }else if( item.title == "Home" ){
            performSegue(withIdentifier: "Unwind", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundVideo()
        
        bloodLabel.text = personData.blood
        tabBar.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func playBackgroundVideo(){
        let path = Bundle.main.path(forResource: "background", ofType: ".mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        player.seek(to: CMTime.zero)
        player.play()
        self.player.isMuted = true
    }
    
    @objc func playerItemDidReachEnd(){
        player.seek(to: CMTime.zero)
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        switch segue.destination {
        case let web as WebViewController:
            web.urlString = sender as! String
        case let home as HouseViewController:
            break
        default:
            break
        }
    }

}
