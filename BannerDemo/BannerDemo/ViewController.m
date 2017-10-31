//
//  ViewController.m
//  BannerDemo
//
//  Created by LRG on 2017/10/27.
//  Copyright © 2017年 LRG. All rights reserved.
//

#import "ViewController.h"
#import "APPConst.h"
#import "UIView+Extension.h"
#import "APPLayout.h"
#import "APPCell.h"
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}

@property(nonatomic,assign)NSInteger nextIndex;
@property(nonatomic,assign)NSInteger dismissIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [self configUI];
}
-(void)configUI{
    APPLayout *layout = [[APPLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, APPScreenWidth, 100) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.showsHorizontalScrollIndicator = NO;
    [_collectionView registerClass:[APPCell class] forCellWithReuseIdentifier:@"1"];
    [self.view addSubview:_collectionView];
    [_collectionView setContentOffset:CGPointMake([APPCell returnCellSize].width-25.0, 0)];

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    APPCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"1" forIndexPath:indexPath];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [APPCell returnCellSize];
}
//由于collectionView没有类似于viewDidload这样的方法，只能寄托于下面的这个代理方法。这个代理方法是在cell将要出现的时候就调用一次。
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"将要出现的-----%ld",indexPath.row);
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击的-----%ld",indexPath.row);
}
//这个方法是上一个视图完全消失，就调用一次
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    NSLog(@"消失的-----%ld",indexPath.row);
    self.dismissIndex = indexPath.row;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"--------------%lf",scrollView.contentSize.width);
//    NSLog(@"-------------%lf",scrollView.contentOffset.x);
    
    CGFloat maxOffset_W = scrollView.contentSize.width - _collectionView.width;
    CGFloat hide_W = [APPCell returnCellSize].width - [APPCell returnShowWidth];
    
    
    if(scrollView.contentOffset.x < hide_W){
            [_collectionView setContentOffset:CGPointMake(maxOffset_W-hide_W, 0) animated:NO];
    }

    if(scrollView.contentOffset.x > maxOffset_W - hide_W){

            [_collectionView setContentOffset:CGPointMake(hide_W, 0) animated:NO];

    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
