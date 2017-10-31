//
//  APPCell.h
//  BannerDemo
//
//  Created by LRG on 2017/10/30.
//  Copyright © 2017年 LRG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APPCell : UICollectionViewCell
+(CGSize)returnCellSize; //cell的size
+(CGFloat)returnShowWidth; //两侧cell显示宽度
+(CGFloat)returnMiniLineSpace;
@end
