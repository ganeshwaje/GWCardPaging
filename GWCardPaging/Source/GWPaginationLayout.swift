//
//  GWPaginationLayout.swift
//  GWCardPaging
//
//  Created by Ganesh Waje on 26/05/20.
//  Copyright © 2020 Ganesh Waje. All rights reserved.
//

import UIKit

class GWPaginationLayout: UICollectionViewFlowLayout {

    // MARK: - Variables

    private var lastPoint: CGPoint = .zero

    // MARK: - Overrides
    
    override public func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                             withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView,
            let layoutAttributes = self.layoutAttributesForElements(in: collectionView.bounds) else {
                return self.lastPoint
        }
        
        if layoutAttributes.count == 0 {
            return proposedContentOffset
        }
        var targetIndex = layoutAttributes.count / 2
        
        let vX = velocity.x
        
        if vX > 0 {
            targetIndex += 1
        } else if vX < 0.0 {
            targetIndex -= 1
        }else if vX == 0 {
            return lastPoint
        }
        
        if targetIndex >= layoutAttributes.count {
            targetIndex = layoutAttributes.count - 1
        }
        
        if targetIndex < 0 {
            targetIndex = 0
        }
        
        let targetAttribute = layoutAttributes[targetIndex]
        
        self.lastPoint = CGPoint(x: targetAttribute.center.x - collectionView.bounds.size.width * 0.5, y: proposedContentOffset.y)
        return self.lastPoint
    }
}
