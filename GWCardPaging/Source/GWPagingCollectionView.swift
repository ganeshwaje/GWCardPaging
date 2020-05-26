//
//  GWPagingCollectionView.swift
//  GWCardPaging
//
//  Created by Ganesh Waje on 26/05/20.
//  Copyright © 2020 Ganesh Waje. All rights reserved.
//

import UIKit

class GWPagingCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.decelerationRate = .fast
    }
    
    func updateCellsLayout()  {
         let centerX = self.contentOffset.x + (self.frame.size.width)/2
         for cell in self.visibleCells {
             
             var offsetX = centerX - cell.center.x
             
             let isLeftSideCell = cell.center.x < centerX
             
             if offsetX < 0 {
                 offsetX *= -1
             }
             
             if offsetX > 0 {
                 
                 let offsetPercentage = offsetX / self.bounds.width
                 var rotation = (1 - offsetPercentage) - 45
                
                if isLeftSideCell {
                    rotation *= -1
                }
                cell.layer.transform = cell.get3DTransformation(angle: Double(rotation))
            }
        }
     }
}

private extension UIView {
    func get3DTransformation(angle: Double) -> CATransform3D {
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500.0
        transform = CATransform3DRotate(transform, CGFloat(angle), 0, 1, 0.0)
        
        return transform
    }
}
