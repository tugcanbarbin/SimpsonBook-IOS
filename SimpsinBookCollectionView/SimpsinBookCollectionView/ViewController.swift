//
//  ViewController.swift
//  SimpsinBookCollectionView
//
//  Created by Tugcan barbin on 2/19/23.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate{
    
    
    
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var mySimpsons = [Simpson]()
    var chosenSimpson : Simpson?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        //Simpson Objects
        
        let homer = Simpson(simpsonName: "Homer Simpson", simpsonJob: "Nuclear Safety", simpsonImage: "homer")
        
         let marge = Simpson(simpsonName: "Marge Simpson", simpsonJob: "Housewife", simpsonImage: "marge")
        
         let bart = Simpson(simpsonName: "Bart Simpson", simpsonJob: "Student", simpsonImage: "bart")
        
         let lisa = Simpson(simpsonName: "Lisa Simpson", simpsonJob: "Student", simpsonImage: "lisa")
         
         let maggie = Simpson(simpsonName: "Maggie Simpson", simpsonJob: "Baby", simpsonImage: "maggie")
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // myData is the array of items
        return mySimpsons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! CustomCell
            
                
        let simpson = mySimpsons[indexPath.row]
        cell.simpsonImageView.image = UIImage(named: simpson.image)
    
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // add the code here to perform action on the cell
        chosenSimpson = mySimpsons[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "VCtoDetailsVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VCtoDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedSimpson = chosenSimpson
        }
    }

}

