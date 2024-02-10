//
//  DetailsViewController.swift
//  MVVM_CMBCMR
//
//  Created by July Belova on 31.01.2024.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let idLabel = UILabel()
    private let nameLabel = UILabel()
    private let statusLabel = UILabel()
    private let typeLabel = UILabel()
    private let genderLabel = UILabel()
    private let locationLabel = UILabel()
    private let episodeTextView = UITextView()
    private let createdLabel = UILabel()
    
    private let characterImageView = UIImageView()
    
    private var labelsStackView = UIStackView()
    
    let detailsViewModel: DetailsViewModel
    
    init(_ detailsViewModel: DetailsViewModel) {
        self.detailsViewModel = detailsViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstaints()
        displayUserInfo()
    }
    
    private func setupViews() {
        title = detailsViewModel.name
        view.backgroundColor = .white
        
        labelsStackView = UIStackView(arrangedSubviews: [characterImageView, idLabel, nameLabel, statusLabel, typeLabel, genderLabel, locationLabel, createdLabel, episodeTextView])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 2
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        episodeTextView.isEditable = false
        episodeTextView.font = .systemFont(ofSize: 16)

        view.addSubview(labelsStackView)
    }
    
    private func displayUserInfo() {
        guard let imageUrl = URL(string: detailsViewModel.image) else { return }
        characterImageView.load(url: imageUrl)
        
        idLabel.text = "Id: " + String(detailsViewModel.id)
        nameLabel.text = "Name: " + detailsViewModel.name
        statusLabel.text = "Status: " + detailsViewModel.status
        typeLabel.text = "Type: " + detailsViewModel.type
        genderLabel.text = "Gender: " + detailsViewModel.gender
        locationLabel.text = "Location: " + detailsViewModel.location
        createdLabel.text = "Created: " + detailsViewModel.created
        
        let tmpEpisodeArray = ["Episodes: "] + detailsViewModel.episode
        episodeTextView.text = tmpEpisodeArray.joined(separator: "\n")
    }
}

//MARK: - Set Constaints

extension DetailsViewController {
    
    private func setConstaints() {
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            labelsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            episodeTextView.widthAnchor.constraint(equalTo: labelsStackView.widthAnchor),
            episodeTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
