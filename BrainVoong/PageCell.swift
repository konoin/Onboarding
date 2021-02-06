//
//  PageCell.swift
//  BrainVoong
//
//  Created by Никита Полыко on 6.02.21.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard  let unwrappedPage = page  else { return }
            imageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25)])

            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let imageView: UIImageView = {
        let image: UIImage = UIImage(named: "Grut")!
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Just join for us.", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])

        attributedText.append(NSAttributedString(string: "\n\n\nThere my first part on my future application. And I want to say, that you see sleeping Grut it's so qute.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    } 

    private func setupLayout() {
        
        let topImageView = UIView()
        addSubview(topImageView)
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageView.addSubview(imageView)
        topImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageView.heightAnchor, multiplier: 0.5).isActive = true
    
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
