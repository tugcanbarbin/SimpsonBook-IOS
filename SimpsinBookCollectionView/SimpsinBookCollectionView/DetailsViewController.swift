//
//  DetailsViewController.swift
//  SimpsinBookCollectionView
//
//  Created by Tugcan barbin on 2/19/23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var jobLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(selectedSimpson!.name)
        
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = UIImage(named: selectedSimpson!.image)
    }


}
