//
//  PinterestLayout.swift
//  Pinterest
//
//  Created by 林东杰 on 1/20/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

protocol PintestLayoutDelegate {
  func collectionView(collectionView: UICollectionView,heightForPhotoAtIndexPath indexPath:NSIndexPath,withWidth: CGFloat) -> CGFloat
  func collectionView(collectionView: UICollectionView,heightForAnnotationAtIndexPath indexPath: NSIndexPath,withWidth width:CGFloat) ->CGFloat
}

class PinterestLayout: UICollectionViewLayout {

  
  //1
  var delegate: PintestLayoutDelegate!
  
  //2
  var numberOfColumns = 2
  var cellPadding:CGFloat = 6.0
  
  //3
  //private var cache = [UICollectionViewLayoutAttributes]()
  private var cache = [PinterestLayoutAttribtes]()
  
  //4
  private var contentHeight:CGFloat = 0.0
  private var contentWidth:CGFloat {
    let insets = collectionView!.contentInset
    return CGRectGetWidth(collectionView!.bounds) - (insets.left+insets.right)
  }
  
  override func prepareLayout() {
    //1
    if cache.isEmpty {
      //2
      let columnWidth = contentWidth / CGFloat(numberOfColumns)
      var xOffset = [CGFloat]()
      for column in 0..<numberOfColumns {
        xOffset.append(CGFloat(column) * columnWidth)
      }
      var column = 0
      var yOffset = [CGFloat](count:numberOfColumns,repeatedValue:0)
      
      //3
      for item in 0..<collectionView!.numberOfItemsInSection(0) {
        let indexPath = NSIndexPath(forItem: item, inSection: 2)
        //4
        let width = columnWidth - cellPadding * 2
        let photoHeight = delegate.collectionView(collectionView!, heightForPhotoAtIndexPath: indexPath, withWidth: width)
        let annotationHeight = delegate.collectionView(collectionView!, heightForAnnotationAtIndexPath: indexPath, withWidth: width)
        let height = cellPadding + photoHeight + annotationHeight + cellPadding
        let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
        let insetFrame = CGRectInset(frame, cellPadding, cellPadding)
        
        //5 
        //let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        let attributes = PinterestLayoutAttribtes(forCellWithIndexPath: indexPath)
        attributes.photoHeight = photoHeight
        attributes.frame = insetFrame
        cache.append(attributes)
        
        //6
        contentHeight = max(contentHeight,CGRectGetMaxY(frame))
        yOffset[column] = yOffset[column] + height
        
        column = column >= (numberOfColumns - 1) ? 0 : ++column
      }
    }
  }
  
  override func collectionViewContentSize() -> CGSize {
    return CGSize(width: contentWidth, height: contentHeight)
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var layoutAttributes = [UICollectionViewLayoutAttributes]()
    
    for attributes in cache {
      if CGRectIntersectsRect(attributes.frame, rect) {
        layoutAttributes.append(attributes)
      }
    }
    return layoutAttributes
  }
  
  override class func layoutAttributesClass() -> AnyClass {
    return PinterestLayoutAttribtes.self
  }

}


class PinterestLayoutAttribtes:UICollectionViewLayoutAttributes {
  //1
  var photoHeight: CGFloat = 0.0
  
  //2
  override func copyWithZone(zone: NSZone) -> AnyObject {
    let copy = super.copyWithZone(zone) as! PinterestLayoutAttribtes
    copy.photoHeight = photoHeight
    return copy
  }
  
  //3
  override func isEqual(object: AnyObject?) -> Bool {
    if let attributes = object as? PinterestLayoutAttribtes {
      if (attributes.photoHeight == photoHeight) {
        return super.isEqual(object)
      }
    }
    return false
  }
}














