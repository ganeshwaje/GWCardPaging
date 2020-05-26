//
//  ViewController.swift
//  GWCardPaging
//
//  Created by Ganesh Waje on 26/05/20.
//  Copyright © 2020 Ganesh Waje. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let colours: [UIColor] = [.red, .green, .blue, .gray, .purple, .brown]
    
    @IBOutlet private weak var collectionView: GWPagingCollectionView! {
        didSet {
            self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.collectionView.updateCellsLayout()
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.colours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = self.colours[indexPath.row]
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.collectionView.updateCellsLayout()
    }
}

