//
//  ViewController.swift
//  test
//
//  Created by ovr on 19.05.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let networkManager = NetworkManager()
    private var dragons: [Dragon] = []
    private var selectedDragon: Dragon?
    
    let cellReuseIdentifier = "DragonCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DragonCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        let nib = UINib.init(nibName: cellReuseIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellReuseIdentifier)
        
        // networkManager.getDragon(id: "5e9d058759b1ff74a7ad5f8f")
        
        networkManager.getDragonList { dragonsResult in
            debugPrint(dragonsResult)
            self.dragons = dragonsResult
            self.tableView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDragonDetails" {
            let vc = segue.destination as! DragonDetailsViewController
            vc.dragon = selectedDragon
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dragons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! DragonCell
        cell.setup(dragon: dragons[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        selectedDragon = dragons[indexPath.row]
        performSegue(withIdentifier: "toDragonDetails", sender: self)
    }
}


