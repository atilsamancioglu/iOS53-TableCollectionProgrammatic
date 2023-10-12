//
//  CollectionViewController.swift
//  TableCollectionProgrammatic
//
//  Created by Atil Samancioglu on 12.10.2023.
//

import UIKit

class CollectionViewController: UIViewController {

    var countries = [Country]()
    var countryCollectionView:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Countries App"
        self.view.backgroundColor = .white
        setupUI()
        
        countryCollectionView?.dataSource = self
        countryCollectionView?.delegate = self

        
        if let path = Bundle.main.path(forResource: "countrydataset", ofType: "json")  {
            do {
                let data = try Data(contentsOf: URL(filePath: path))
                
                countries = try JSONDecoder().decode([Country].self, from: data)
                self.countryCollectionView?.reloadData()
                
            } catch {
                print("error in json parsing")
            }
        }
    }
    

    private func setupUI() {
        
        self.navigationItem.title = "Country App"
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 180, height: 160)
        
        countryCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        countryCollectionView?.register(CountryCollectionViewCell.self, forCellWithReuseIdentifier: "countryCollectionCell")
        countryCollectionView?.backgroundColor = UIColor.white
        
        
        view.addSubview(countryCollectionView ?? UICollectionView())
    }

}


extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "countryCollectionCell", for: indexPath) as! CountryCollectionViewCell
        collectionViewCell.countryNameLabel.text = countries[indexPath.row].name
        collectionViewCell.countryCurrencyLabel.text = countries[indexPath.row].currency
        collectionViewCell.countryImageView.image = UIImage(named: countries[indexPath.row].flag)
        return collectionViewCell
    }
}
