//
//  BreedBrowseVC.swift
//  CatBreeds
//
//  Created by Joshua Adams on 2/12/18.
//  Copyright © 2018 Josh Adams. All rights reserved.
//

import UIKit

//class BreedBrowseVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
//  @IBOutlet var table: UITableView!
//  private let breeds = Breeds()
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    table.dataSource = self
//    table.delegate = self
//    title = "Browse"
//  }
//
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return breeds.breedCount
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = table.dequeueReusableCell(withIdentifier: "\(BreedCell.self)") as! BreedCell
//    let breed = breeds.breedAtIndex(indexPath.row)
//    cell.configure(name: breed.name, photo: breed.photo)
//    return cell
//  }
//
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let viewController = BreedDetailVC.getViewController(breed: breeds.breedAtIndex(indexPath.row))
//    tableView.deselectRow(at: indexPath, animated: false)
//    navigationController?.pushViewController(viewController, animated: true)
//  }
//}

class BreedBrowseVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let breeds = Breeds() // the model
    // 0
    var breedBrowseView: BreedBrowseView {
        return view as! BreedBrowseView
    }
    
    // 1
    override func loadView() {
        view = BreedBrowseView(frame: UIScreen.main.bounds)
        title = "Browse"
        breedBrowseView.setupTable(dataSource: self, delegate: self)
    }
    // gets rid of choppy transition...
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        breedBrowseView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.breedCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = breedBrowseView.table.dequeueReusableCell(withIdentifier: "\(BreedCell.self)") as! BreedCell
        let breed = breeds.breedAtIndex(indexPath.row)
        cell.configure(name: breed.name, photo: breed.photo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BreedCell.thumbnailHeightWidth
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let breedDetailVC = BreedDetailVC.getViewController(breed: breeds.breedAtIndex(indexPath.row))
        breedBrowseView.isHidden = true // gets rid of choppy transition...
        navigationController?.pushViewController(breedDetailVC, animated: true)
    }
}
