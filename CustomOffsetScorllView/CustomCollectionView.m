//
//  CustomCollectionView.m
//  CustomOffsetScorllView
//
//  Created by wdyzmx on 2018/4/12.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import "CustomCollectionView.h"
@interface CustomCollectionView()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *sourceArr;
@property (nonatomic, strong) UIScrollView *collectionView;
@property (nonatomic, assign) CGFloat margin;
@property (nonatomic, assign) CGFloat gap;
@end
@implementation CustomCollectionView
-(instancetype)initWithFrame:(CGRect)frame margin:(CGFloat)margin gap:(CGFloat)gap sourceArray:(NSArray *)sourceArr{
    if (self = [super initWithFrame:frame]) {
        self.sourceArr = sourceArr;
        self.margin = margin;
        self.gap = gap;
        [self addSubview:self.collectionView];
    }
    return self;
}
#pragma mark - UIScrollViewDelegate 方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger curIndex = self.collectionView.contentOffset.x  / self.collectionView.frame.size.width;
    if (curIndex == self.sourceArr.count+1) {
        scrollView.contentOffset = CGPointMake(self.collectionView.frame.size.width, 0);
    }else if (curIndex == 0){
        scrollView.contentOffset = CGPointMake(self.collectionView.frame.size.width * self.sourceArr.count, 0);
    }
    
}
#pragma mark ========== 懒加载 ==========
-(UIScrollView *)collectionView{
    if (_collectionView==nil) {
        _collectionView = [[UIScrollView alloc] initWithFrame:CGRectMake(self.margin, 0, self.frame.size.width-self.margin*2, self.frame.size.height)];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.clipsToBounds = NO;
        //
        for (int i=0; i<self.sourceArr.count+2; i++) {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((2*i+1)*self.gap/2+(_collectionView.frame.size.width-self.gap)*i, 0, _collectionView.frame.size.width-self.gap, _collectionView.frame.size.height)];
            [_collectionView addSubview:imgView];
            imgView.backgroundColor = [UIColor orangeColor];
        }
        _collectionView.contentOffset = CGPointMake(_collectionView.frame.size.width, 0);
        _collectionView.contentSize = CGSizeMake(_collectionView.frame.size.width*(self.sourceArr.count+2), 0);
    }
    return _collectionView;
}
-(NSArray *)sourceArr{
    if (_sourceArr==nil) {
        _sourceArr = [NSArray array];
    }
    return _sourceArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
