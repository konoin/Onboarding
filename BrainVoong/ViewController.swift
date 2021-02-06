//
//  ViewController.swift
//  BrainVoong
//
//  Created by Никита Полыко on 29.01.21.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image: UIImage = UIImage(named: "Grut")!
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let descriptionTextView: UITextView = {
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
    
    
    private let prevButton: UIButton = {
        let prevButton = UIButton(type: .system)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setTitle("PREV", for: .normal)
        prevButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        prevButton.tintColor = .gray
        return prevButton
    }()

    private let nextButton: UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        nextButton.tintColor = .systemPink
        return nextButton
    }()

    private let pageView: UIPageControl = {
        let pageView = UIPageControl()
        pageView.translatesAutoresizingMaskIntoConstraints = false
        pageView.currentPage = 0
        pageView.numberOfPages = 4
        pageView.currentPageIndicatorTintColor = .black
        pageView.pageIndicatorTintColor = .gray
        return pageView
    }()


    fileprivate func setupButtonControllers() {
        let buttonConteinerStackView = UIStackView(arrangedSubviews: [prevButton, pageView, nextButton])
        buttonConteinerStackView.distribution = .fillEqually
        buttonConteinerStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(buttonConteinerStackView)

        NSLayoutConstraint.activate([
            buttonConteinerStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonConteinerStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonConteinerStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonConteinerStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descriptionTextView)
        setupButtonControllers()
        setupLayout()
    }

    
    
    private func setupLayout() {
        
        let topImageView = UIView()
        view.addSubview(topImageView)
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: topImageView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageView.heightAnchor, multiplier: 0.5).isActive = true
    
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

