//
//  SwipingController.swif.swift
//  BrainVoong
//
//  Created by Никита Полыко on 6.02.21.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "Grut", headerText: "Join for us!", bodyText: "If you are join for us> we are give you cookies!"),
        Page(imageName: "Dancing", headerText: "Dancing for us!", bodyText: "We are want to dancing with you!"),
        Page(imageName: "Strong", headerText: "Be angry!", bodyText: "Do not be angry? be happy!"),
        Page(imageName: "GrutOk", headerText: "Like!", bodyText: "If you want to join us, subscribe for us and like."),
        Page(imageName: "Grut", headerText: "Join for us!", bodyText: "If you are join for us> we are give you cookies!"),
        Page(imageName: "Dancing", headerText: "Dancing for us!", bodyText: "We are want to dancing with you!"),
        Page(imageName: "Strong", headerText: "Be angry!", bodyText: "Do not be angry? be happy!"),
        Page(imageName: "GrutOk", headerText: "Like!", bodyText: "If you want to join us, subscribe for us and like.")
    ]
    
    private let prevButton: UIButton = {
        let prevButton = UIButton(type: .system)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setTitle("PREV", for: .normal)
        prevButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        prevButton.tintColor = .gray
        prevButton.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return prevButton
    }()
    
    @objc private func handlePrev() {
        let prevIndex = max(pageView.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageView.currentPage = prevIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
  
    private let nextButton: UIButton = {
        let nextButton = UIButton(type: .system)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("NEXT", for: .normal)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        nextButton.tintColor = .systemPink
        nextButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return nextButton
    }()
    
    @objc private func handleNext() {
        let nextIndex = min(pageView.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageView.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    private lazy var pageView: UIPageControl = {
        let pageView = UIPageControl()
        pageView.translatesAutoresizingMaskIntoConstraints = false
        pageView.numberOfPages = pages.count
        pageView.currentPage = 0
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
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageView.currentPage = Int(x / view.frame.width)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonControllers()
        collectionView.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
//        cell.imageView.image = UIImage(named: page.imageName)
//        cell.descriptionTextView.text = page.headerText
        
//        let imageName = imageNames[indexPath.item]
//        cell.imageView.image = UIImage(named: imageName)
//        cell.descriptionTextView.text = headerStrings[indexPath.item]
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
