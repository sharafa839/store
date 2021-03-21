//
//  HomeViewController.swift
//  Store Joud
//
//  Created by ahmed on 3/20/21.
//

import UIKit
import Alamofire
class HomeViewController: UIViewController {
    
    @IBOutlet weak var pageSlider: UIPageControl!
    @IBOutlet weak var categorisCollectionView: UICollectionView!
    @IBOutlet weak var imageSliderCollectionView: UICollectionView!
    let teams = [UIImage(named: "download (2)"),UIImage(named: "download (3)"),UIImage(named: "download (1)")]
    var timer : Timer?
    var counter = 0
    var payloads = [payload]()
    var ImageOfSlider = [URL]()
    var linksOfImage = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        pageSlider.currentPage = 0
        // Do any additional setup after loading the view.
        startTimer()
       
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Alamofire.request("https://storejoud.com/api/banners", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Accept":"application/json"]).responseData {  (response) in
                let dexoder = try! JSONDecoder().decode(ImageSlider.self, from: response.data!)
            self.payloads.append(contentsOf: dexoder.payload)
            self.returnStringToImage()

            
            
            
            print(self.linksOfImage)
        }
    }
        
        
        
        
        
        
        
        
        func returnStringToImage(){
            var url = ""
            var store = ""
            
            for link in payloads{
                url = link.url
                store = link.media_links[0]
                let links = url + store
                linksOfImage.append(links)
            }
            
           
            
        }
        func startTimer()  {
            timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
            
        }
        @objc func updateSlider(){
            if counter < teams.count {
                counter += 1
            }else {
                counter = 0
            }
            imageSliderCollectionView.scrollToItem(at: IndexPath(item: counter, section: 0), at: .centeredHorizontally, animated: true)
            pageSlider.currentPage = counter
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
    extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collectionView.tag == 1 {
                return 2
            }
            return teams.count
            
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = imageSliderCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! pageSlider
            print(linksOfImage)
            DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                cell.loadImage(url: self.linksOfImage[indexPath.row])
            }
            
        
       
            if collectionView.tag == 1 {
                let catCell = categorisCollectionView.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath) as! CategoryCollectionViewCell
                catCell.categoryImage.image = UIImage(named: "love")
                return catCell
                
            }
            return cell
        }
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
    }
