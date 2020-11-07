//
//  FirstViewController.swift
//  CustomTableTest
//
//  Created by 张佳盈 on 2020/3/1.
//  Copyright © 2020 lottagrandpa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITabBarDelegate {
    
    var personData : Person!
    
    var effect : UIVisualEffect!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var bloodLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var tabBar: UITabBar!
    
    //mark
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet var infoView: UIView!
    @IBOutlet weak var infoImage: UIImageView!
    
    @IBAction func addAction(_ sender: Any) {
        animateIn()
    }
    @IBAction func dismissPopup(_ sender: Any) {
        animateOut()
    }
    
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if( item.title == "More" ){
            performSegue(withIdentifier: "Segue3", sender: self)
        }else if( item.title == "Home" ){
            performSegue(withIdentifier: "Unwind2", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = personData.name
        birthLabel.text = personData.dateOfBirth
        bloodLabel.text = personData.blood
        imageView.image = UIImage(named: personData.image)
        infoImage.image = UIImage(named:personData.image)
        houseLabel.text = personData.house
        speciesLabel.text = personData.species
        tabBar.delegate = self
        effect = visualEffectView.effect
        visualEffectView.effect = nil
        infoView.layer.cornerRadius = 5
        
}
    
    func animateIn(){
        self.view.addSubview(infoView)
        infoView.center = self.view.center
        infoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        infoView.alpha = 0
        
        UIView.animate(withDuration:0.4){
            self.visualEffectView.effect = self.effect
            self.infoView.alpha = 1
            self.infoView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut(){
        UIView.animate(withDuration: 0.3, animations: {
            self.infoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.infoView.alpha = 0
            self.visualEffectView.effect = nil
        }) { (success:Bool) in
            self.infoView.removeFromSuperview()
        }
    }
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        switch segue.destination {
        case let text as TextViewController:
            text.personData = personData
        case let home as HouseViewController:
            break
        default:
            break
        }
    }
    


}
