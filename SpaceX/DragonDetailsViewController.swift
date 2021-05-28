//
//  DragonDetailsViewController.swift
//  SpaceX
//
//  Created by ovr on 23.05.2021.
//

import UIKit

class DragonDetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var flightLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dragon: Dragon?
    private let cellReuseIdentifier = "DragonImageCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = "Description: \(dragon?.description ?? "")"
        weightLabel.text = "Weight in kg: \(dragon?.dryMassKg ?? 0)"
        heightLabel.text = "Height: \(dragon?.heightWithTrunk.meters ?? 0)"
        flightLabel.text = "Date of first flight: \(dragon?.firstFlight ?? "")"
        
        title = dragon?.name
        let nib = UINib.init(nibName: cellReuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dragon?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! DragonImageCell
        cell.setup(imageURL: dragon?.images[indexPath.row])
        return cell
    }
    @IBAction func wikiLinkAction(_ sender: Any) {
        guard let wikipedia = dragon?.wikipedia else { return }
        UIApplication.shared.open(wikipedia)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size 
    }
}
