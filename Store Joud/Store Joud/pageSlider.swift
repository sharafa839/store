//
//  pageSlider.swift
//  Store Joud
//
//  Created by ahmed on 3/20/21.
//

import UIKit

class pageSlider: UICollectionViewCell {
    
    @IBOutlet weak var ImageInSlider: UIImageView!
    
    func  loadImage(url:String)  {
        
        DispatchQueue.global().async { [weak self] in
            if let data  = try? Data(contentsOf: URL(string: url)!){
               
                    DispatchQueue.global().async {
                        self?.ImageInSlider.image = UIImage(data: data)
                        
                        
                    
                    
                }
                    
                }
            }
        }
}
