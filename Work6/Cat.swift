//
//  Cat.swift
//  Work6
//
//  Created by 彭有駿 on 2022/3/24.
//

import UIKit

class Cat: UIViewController {
    
    @IBOutlet weak var catSegment: UISegmentedControl!
    
    @IBOutlet weak var catScroll: UIScrollView!
    
    @IBOutlet weak var catPage: UIPageControl!
    
    @IBOutlet weak var introduceCatMoive: UIScrollView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    var catcurrent = 0
    var catMovieImageArray = ["遇見街貓","貓女","黑貓魯道夫","加菲貓"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func catSegmentControl(_ sender: UISegmentedControl) {
        catcurrent = catSegment.selectedSegmentIndex
        changeCat()
        
    }
    
    
    @IBAction func catBackButton(_ sender: UIButton) {
        if catcurrent > 0 {
            catcurrent -= 1
        }
        changeCat()
        
    }
    
    @IBAction func catNextButton(_ sender: UIButton) {
        if catcurrent < 4 {
            catcurrent += 1
        }
        changeCat()
        
    }
    
    @IBAction func catPageControl(_ sender: UIPageControl) {
        catcurrent = sender.currentPage
        changeCat()
        
    }
    
    

    @IBAction func catSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            catcurrent += 1
            if catcurrent < 4 {
                changeCat()
            }else{
                catcurrent = 0
                changeCat()
            }
        }
        if sender.direction == .right {
            catcurrent -= 1
            if catcurrent > -1 {
                changeCat()
            }else {
                catcurrent = 3
                changeCat()
            }
        }
        
    }
    
    
    
    
    
    
    
    func changeCat(){
        catSegment.selectedSegmentIndex = catcurrent
        catScroll.contentOffset.x = CGFloat(catcurrent*250)
        catPage.currentPage = catcurrent
        introduceCatMoive.contentOffset.x = CGFloat(catcurrent*370)
        
        if catcurrent == 0{
            backButton.isHidden = true
            nextButton.isHidden = false
        }
        else if catcurrent == 3{
            backButton.isHidden = false
            nextButton.isHidden = true
        }else{
            backButton.isHidden = false
            nextButton.isHidden = false
        }
    }
    
}
