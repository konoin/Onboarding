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
        Page(imageName: "GrutOk", headerText: "Like!", bodyText: "If you want to join us, subscribe for us and like.")]
    
//    let imageNames = ["Grut", "GrutOk", "Dancing", "Strong"]
//    let headerStrings = ["Join for us.", "Like!", "Dancing!", "Be angry!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
