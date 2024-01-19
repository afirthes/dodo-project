//
//  ViewController.swift
//  dodo-project
//
//  Created by Artur Igberdin on 22.12.2023.
//

import UIKit
import SnapKit

//UIViewController -> view
//UITableViewCell, UICollectionViewCell -> contentView


//Design System

// UI Component Fabric


struct ScreenSize {
    static let width = UIScreen.main.bounds.width
}

class ProductCell: UITableViewCell {
    
    static let reuseId = "ProductCell"
    
    var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cheeze")
        imageView.widthAnchor.constraint(equalToConstant: ScreenSize.width * 0.35).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: ScreenSize.width * 0.35).isActive = true
        return imageView
    }()
    
    var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        return stackView
    }()
    
    //var nameLabel = NameLabel()
    
    var nameLabel = Label(style: .name)
    var descriptionLabel = Label(style: .description)
    
    
//    var nameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Сырная"
//        label.font = UIFont.boldSystemFont(ofSize: 20)
//        return label
//    }()
//
//    var descriptionLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Моцарелла, сыры чеддер и пармезан, фирменный соус альфредо"
//        label.numberOfLines = 0
//        return label
//    }()
    
    var priceButton: UIButton = {
        let button = UIButton()
        button.setTitle("от 289 ₽", for: .normal)
        button.backgroundColor = .orange
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductCell {
    func setupViews() {
        contentView.addSubview(productImageView)
        contentView.addSubview(verticalStackView)
        
        [nameLabel, descriptionLabel, priceButton].forEach { view in
            verticalStackView.addArrangedSubview(view)
        }
        
    }
    func setupConstraints() {
        
        productImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            //make.top.bottom.greaterThanOrEqualTo(contentView).priority(.low)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.left.equalTo(productImageView.snp.right).offset(8)
            make.top.right.bottom.equalTo(contentView).inset(8)
            make.height.greaterThanOrEqualTo(productImageView)
        }
    }
}


class MenuController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseId)
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
}

//MARK: - Layout
extension MenuController {
    func setupViews() {
        view.backgroundColor = .orange
        view.addSubview(tableView)
    }
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            //make.topMargin.leftMargin.rightMargin.bottomMargin.equalToSuperview()
            //make.edges.equalTo(view.safeAreaLayoutGuide)
            make.edges.equalTo(view.snp.margins)
        }
    }
}

//MARK: - UITableViewDataSource
extension MenuController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension MenuController: UITableViewDelegate {
    
}

