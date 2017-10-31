//
//  APPLayout.m
//  BannerDemo
//
//  Created by LRG on 2017/10/30.
//  Copyright © 2017年 LRG. All rights reserved.
//

#import "APPLayout.h"
#import "APPCell.h"
@interface APPLayout()

//@property (nonatomic, strong) NSArray *attrs;

@end

@implementation APPLayout
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (void)prepareLayout{
    [super prepareLayout];
    self.minimumLineSpacing = 10;
}
/**
 * 在collectionView滑动停止之后collectionView的偏移量
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    
    
    // 计算出最终显示的矩形框 遍历该矩形框中的cell相对中心线的间距选择最合适的cell进行调整
    CGRect currentRect;
    currentRect.origin.x = proposedContentOffset.x;
    currentRect.origin.y = 0;
    currentRect.size = CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    // 获得对应rect中super已经计算好的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:currentRect];
    
    // 计算collectionView最中心点的x值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    // 存放最小的间距值
    CGFloat minDelta = MAXFLOAT;
    
    for(int i = 0;i<array.count;i++){
        UICollectionViewLayoutAttributes *attr = array[i];
        if(ABS(minDelta) > ABS(attr.center.x - centerX)) {
            
            minDelta = attr.center.x - centerX;
        }
    }
    
    // 修改原有的偏移量
    proposedContentOffset.x += minDelta;
    
    return proposedContentOffset;
}
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    // 获取super(UICollectionViweFlowLayout)已经计算好的布局属性
    NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
    // 计算collectionView最中心点的x值 (等于collectionView的偏移量 + collectionView的宽度的一半)
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;

    // 在原有的布局属性上进行微调达到缩放的效果
    
    for(int i = 0;i<attrs.count;i++){
      
        UICollectionViewLayoutAttributes *attr = attrs[i];
        // cell的中心点x值 和 collectionView的中心点x值的间距
        CGFloat delay = ABS(attr.center.x - centerX);
        
        //两个cell中心点的间距
        CGFloat gap = [APPCell returnCellSize].width+[APPCell returnMiniLineSpace];
        
        //         根据间距计算cell的缩放比例
        CGFloat scale = 1 - (delay / self.collectionView.frame.size.width);
        
        //         设置缩放比例
        if(delay>=0 && delay<=gap){
//            scale = 1 - 0.1*(delay/gap);  (0.9 ~  1)
            scale = 1;
        }
        if(delay>gap && delay<=2*gap){
//            scale = 0.9 - 0.1*((delay-gap)/gap); //(0.9 ~ 0.8)
              scale = 1 - 0.1*((delay-gap)/gap);
        }
        
        attr.transform3D = CATransform3DMakeScale(scale, scale, scale);
    }
    // 返回调整之后的布局属性数组
    return attrs;
}

//- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//}
//- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
//    
//}
//- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath{
//    
//}
//
//- (UICollectionViewLayoutInvalidationContext *)invalidationContextForBoundsChange:(CGRect)newBounds NS_AVAILABLE_IOS(7_0){
//    
//}
//
//- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes NS_AVAILABLE_IOS(8_0){
//    
//}
//- (UICollectionViewLayoutInvalidationContext *)invalidationContextForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes NS_AVAILABLE_IOS(8_0){
//    
//}
//

//- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset NS_AVAILABLE_IOS(7_0)
//{
//
//}


@end
