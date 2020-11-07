//
//  HouseViewController.swift
//  CustomTableTest
//
//  Created by 张佳盈 on 2020/2/25.
//  Copyright © 2020 lottagrandpa. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    var gryffindor: [Person]!
    var slytherin: [Person]!
    var hufflepuff: [Person]!
    var ravenclaw: [Person]!
    var index: Int!
    
    @IBOutlet weak var iCarouselView: iCarousel!
    
    
    
    var imgArr = [  UIImage(named:"Gryffindor_ClearBG"),
                    UIImage(named:"Slytherin_ClearBG") ,
                    UIImage(named:"Hufflepuff_ClearBG") ,
                    UIImage(named:"RavenclawCrest") ,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iCarouselView.type = .rotary
        iCarouselView.contentMode = .scaleAspectFill
        iCarouselView.isPagingEnabled = true
        
        let parser = XMLPeopleParser(name: "characters.xml")
        parser.parsing()
        gryffindor = parser.gryffindor
        slytherin = parser.slytherin
        hufflepuff = parser.hufflepuff
        ravenclaw = parser.ravenclaw
        index = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToMainMenu(sender: UIStoryboardSegue) {}

}

extension HouseViewController: iCarouselDelegate, iCarouselDataSource {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return imgArr.count
    }


        
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel){
        index = carousel.currentItemIndex
    }

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        var imageView: UIImageView!
        if view == nil {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 250))
            imageView.contentMode = .scaleAspectFit
        } else {
            imageView = view as? UIImageView
        }
        
        imageView.image = imgArr[index]
        imageView.isUserInteractionEnabled = true

        
        let singleTap =  UITapGestureRecognizer(target: self, action: #selector(singleTapping(recognizer:)))

        singleTap.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(singleTap)
        self.view.addSubview(imageView)
        return imageView
    }
    
    @objc func singleTapping(recognizer: UIGestureRecognizer) {
        performSegue(withIdentifier: "Segue0", sender: 0)
    }
        

  // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CustomTableViewController
        switch(index){
            case 0:
                vc.data = gryffindor
            case 1:
                vc.data = slytherin
            case 2:
                vc.data = hufflepuff
            case 3:
                vc.data = ravenclaw
        default: break
                
        }
    }
}
