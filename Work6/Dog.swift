//
//  Dog.swift
//  Work6
//
//  Created by 彭有駿 on 2022/3/23.
//

import UIKit

class Dog: UIViewController {
    
    //狗電影的類別(利用UISegmented)
    @IBOutlet weak var dogSegment: UISegmentedControl!
    
    //狗電影的照片和名稱(利用ScrollView去做的UI)
    @IBOutlet weak var dogScroll: UIScrollView!
    
    //切換狗電影的照片和名稱(就是那四個小圓點)
    @IBOutlet weak var dogPage: UIPageControl!
    
    //狗狗電影的介紹(利用ScrollView去做的UI)
    @IBOutlet weak var introduceDogMoive: UIScrollView!
    
    //切換電影的按鈕(狗狗圖旁邊向右的箭頭)
    @IBOutlet weak var backButton: UIButton!
    
    //切換電影的按鈕(狗狗圖旁邊向左的箭頭)
    @IBOutlet weak var nextButton: UIButton!
    
    //設定參數
    var dogcurrent = 0
   
    //var dogMovieImageArray = ["為了與你相遇","極地守護犬","雷霆戰狗","比佛利拜金狗"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Segment的邏輯
    @IBAction func dogTypeSegment(_ sender: UISegmentedControl) {
        dogcurrent = dogSegment.selectedSegmentIndex//讀取資料
        changePage()
    }
    
    //Button的邏輯(返回)
    @IBAction func back(_ sender: UIButton) {
        if dogcurrent > 0{
            dogcurrent = dogcurrent - 1
            // dogcurrent -= 1
        }
        changePage()
    }
    
    //Button的邏輯(下一頁)
    @IBAction func next(_ sender: UIButton) {
        if dogcurrent < 4 {
            dogcurrent = dogcurrent + 1
            // dogcurrent += 1
        }
        changePage()
    }
    
    
    
    //PageControl的邏輯
    @IBAction func dogPageControl(_ sender: UIPageControl) {
        //讀取資料
        dogcurrent = sender.currentPage
        changePage()
    }
    
    //Swipe手勢邏輯
    @IBAction func dogImageSwipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {//向左滑動
            dogcurrent += 1
            if dogcurrent < 4 {
                changePage()
            }else{
                dogcurrent = 0
                changePage()
            }
        }
        if sender.direction == .right {//向右滑動
            dogcurrent -= 1
            if dogcurrent > -1{
                changePage()
        }else{
            dogcurrent = 3
            changePage()
        }
    }
}
    
    
    
    //換圖的方法和邏輯
    func changePage(){
        dogSegment.selectedSegmentIndex = dogcurrent//要記得如果有四張圖是[0,1,2,3喔]第一張在Index[]裡面的位置是0
        dogScroll.contentOffset.x = CGFloat(dogcurrent*250)
        dogPage.currentPage = dogcurrent
        
        introduceDogMoive.contentOffset.x = CGFloat(dogcurrent*370)
        //控制按鈕的邏輯(當按鈕在首頁的時候back按鈕要隱藏)
        if dogcurrent == 0{
            backButton.isHidden = true
            nextButton.isHidden = false
        }
        else if dogcurrent == 3{
            backButton.isHidden = false
            nextButton.isHidden = true
        }else{
            backButton.isHidden = false
            nextButton.isHidden = false
        }
    }
    
    

 }

