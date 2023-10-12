//
//  TableViewController.swift
//  TableCollectionProgrammatic
//
//  Created by Atil Samancioglu on 12.10.2023.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let myTableView = UITableView()
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Countries App"
        setupUITableView()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        if let path = Bundle.main.path(forResource: "countrydataset", ofType: "json")  {
            do {
                let data = try Data(contentsOf: URL(filePath: path))
                
                countries = try JSONDecoder().decode([Country].self, from: data)
                
                self.myTableView.reloadData()
            } catch {
                print("error in json parsing")
            }
        }

    }


    private func setupUITableView() {
        myTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "countryCell")
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryTableViewCell
        cell.countryImageView.image = UIImage(named: countries[indexPath.row].flag)
        cell.countryNameLabel.text = "Name: " + countries[indexPath.row].name
        cell.countryCurrencyLabel.text = "Currency: " + countries[indexPath.row].currency
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

