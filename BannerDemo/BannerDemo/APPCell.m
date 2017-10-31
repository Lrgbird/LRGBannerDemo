//
//  APPCell.m
//  BannerDemo
//
//  Created by LRG on 2017/10/30.
//  Copyright © 2017年 LRG. All rights reserved.
//

#import "APPCell.h"
#import "UIView+Extension.h"
#import "APPConst.h"


@interface APPCell()
{
    UIImageView *_imgView;
}
@end


@implementation APPCell
-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self configUI];
    }
    return self;
}
-(void)configUI{
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,[APPCell returnCellSize].width, 100)];
    _imgView.backgroundColor = [UIColor orangeColor];
    _imgView.layer.masksToBounds = YES;
    _imgView.contentMode = UIViewContentModeScaleAspectFill;
    _imgView.image = [UIImage imageNamed:@"mm"];
    [self.contentView addSubview:_imgView];
}
+(CGSize)returnCellSize {
    
    CGFloat gap = [APPCell returnMiniLineSpace]; //间距
    CGFloat w = [APPCell returnShowWidth];//两侧露出视图的宽度
    CGFloat width = (APPScreenWidth-gap*4.0-w*2.0)/3.0;
    return CGSizeMake(width, 100);
}

+(CGFloat)returnShowWidth{
    return 25.0;
}
+(CGFloat)returnMiniLineSpace{
    return 10.0;
}
@end
