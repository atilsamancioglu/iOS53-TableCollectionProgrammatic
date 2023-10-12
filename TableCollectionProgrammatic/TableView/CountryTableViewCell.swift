//
//  CountryTableViewCell.swift
//  TableCollectionProgrammatic
//
//  Created by Atil Samancioglu on 12.10.2023.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    
    let countryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let countryNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let countryCurrencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func addViews(){
        backgroundColor = UIColor.white
        
        addSubview(countryImageView)
        addSubview(countryNameLabel)
        addSubview(countryCurrencyLabel)
        
        countryImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        countryImageView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        countryImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        countryImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        countryNameLabel.topAnchor.constraint(equalTo: countryImageView.bottomAnchor, constant: 10).isActive = true
        countryNameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        countryNameLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        countryNameLabel.textAlignment = .center
        
        countryCurrencyLabel.topAnchor.constraint(equalTo: countryNameLabel.bottomAnchor, constant: 10).isActive = true
        countryCurrencyLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        countryCurrencyLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        countryCurrencyLabel.textAlignment = .center
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
