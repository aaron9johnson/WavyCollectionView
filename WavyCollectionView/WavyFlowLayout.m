//
//  WavyFlowLayout.m
//  WavyCollectionView
//
//  Created by Aaron Johnson on 2017-10-19.
//  Copyright © 2017 Aaron Johnson. All rights reserved.
//

#import "WavyFlowLayout.h"

@implementation WavyFlowLayout
- (void)prepareLayout {
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(100, 50);
    // Set minimum interitem spacing to be huge to force all items to be on their own line
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray<UICollectionViewLayoutAttributes *> *superAttrs = [super layoutAttributesForElementsInRect:rect].copy;
    
    // Need to copy attrs from super to avoid cached frame mismatch
    NSMutableArray<UICollectionViewLayoutAttributes *> *newAttrs = [[NSMutableArray alloc] init];
    
    // TODO: fill me in!
    for (UICollectionViewLayoutAttributes *any in superAttrs) {
        float height = self.collectionView.frame.size.height;
        float number = arc4random_uniform(height) - height / 2;
        any.transform = CGAffineTransformMakeTranslation(0, number);
        float y = (height - (number + height / 2)) / (height / 5) + 1; // 1-6 times the size
        any.transform = CGAffineTransformScale(any.transform, 1, y);
        [newAttrs addObject:any];
    }
    /*
     @property (nonatomic) CGRect frame;
     @property (nonatomic) CGPoint center;
     @property (nonatomic) CGSize size;
     @property (nonatomic) CATransform3D transform3D;
     @property (nonatomic) CGRect bounds NS_AVAILABLE_IOS(7_0);
     @property (nonatomic) CGAffineTransform transform NS_AVAILABLE_IOS(7_0);
     @property (nonatomic) CGFloat alpha;
     @property (nonatomic) NSInteger zIndex; // default is 0
     @property (nonatomic, getter=isHidden) BOOL hidden; // As an optimization, UICollectionView might not create a view for items whose hidden attribute is YES
     @property (nonatomic, strong) NSIndexPath *indexPath;
     */
    
    return newAttrs;
}
@end
