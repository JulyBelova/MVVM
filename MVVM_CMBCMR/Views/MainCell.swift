//
//  MainCell.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 31.01.2024.
//

import UIKit

class MainCell: UITableViewCell {
    
    static var identifier: String {
        "MainCell"
    }
    
    private let nameLabel = UILabel()
    private var imageCharacter = UIImageView()
    private var labelStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView () {
        imageCharacter.layer.cornerRadius = 35
        imageCharacter.layer.borderWidth = 2
        imageCharacter.layer.borderColor = UIColor.lightGray.cgColor
        imageCharacter.clipsToBounds = true
        imageCharacter.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.font = .systemFont(ofSize: 16)
        
        labelStackView = UIStackView(arrangedSubviews: [imageCharacter, nameLabel])
        labelStackView.axis = .horizontal
        labelStackView.spacing = 20
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelStackView)
        
        NSLayoutConstraint.activate([
            imageCharacter.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageCharacter.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            imageCharacter.widthAnchor.constraint(equalToConstant: 70),
            imageCharacter.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel) {
        nameLabel.text = viewModel.name
        guard let imageUrl = URL(string: viewModel.image) else { return }
        imageCharacter.load(url: imageUrl)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
