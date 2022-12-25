/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Custom view flow layout for single column or multiple columns.
*/

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {

    private let minColumnWidth: CGFloat = 200.0
    private let cellHeight: CGFloat = 220

    // MARK: Layout Overrides

    /// - Tag: ColumnFlowExample
    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.frame.size.width//.bounds.inset(by: collectionView.layoutMargins).width
        let maxNumColumns = 2//Int(availableWidth / minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth - 20 , height: cellHeight)
        self.sectionInset = UIEdgeInsets(top: 8, left: 10, bottom: 8.0, right: 10)
        self.sectionInsetReference = .fromSafeArea
        //self.minimumInteritemSpacing = 30
    }
}
