//
//  CustomCollectionView.m
//  CustomOffsetScorllView
//
//  Created by wdyzmx on 2018/4/12.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import "CustomScrollView.h"
@interface CustomScrollView()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *sourceArr;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGFloat margin;
@property (nonatomic, assign) CGFloat gap;
@property (nonatomic, assign) ScrollPicStyle style;
@end
@implementation CustomScrollView
-(instancetype)initWithFrame:(CGRect)frame margin:(CGFloat)margin gap:(CGFloat)gap sourceArray:(NSArray *)sourceArr andPicStyle:(ScrollPicStyle)style{
    if (self = [super initWithFrame:frame]) {
        self.sourceArr = sourceArr;
        self.margin = margin;
        self.gap = gap;
        self.style = style;
        [self addSubview:self.scrollView];
    }
    return self;
}
#pragma mark - UIScrollViewDelegate 方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger curIndex = self.scrollView.contentOffset.x  / self.scrollView.frame.size.width;
    if (curIndex == self.sourceArr.count+1) {
        scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    }else if (curIndex == 0){
        scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width * self.sourceArr.count, 0);
    }
    
}
#pragma mark ========== scrollView区域外也能响应拖动 ==========

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    if ([view isEqual:self]){
        for (UIView *subview in self.scrollView.subviews){
            CGPoint offset = CGPointMake(point.x - self.scrollView.frame.origin.x + self.scrollView.contentOffset.x - subview.frame.origin.x, point.y - self.scrollView.frame.origin.y + self.scrollView.contentOffset.y - subview.frame.origin.y);
            
            if ((view = [subview hitTest:offset withEvent:event])){
                return view;
            }
        }
        return self.scrollView;
    }
    return view;
}
#pragma mark ========== 懒加载 ==========
-(UIScrollView *)scrollView{
    if (_scrollView==nil) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.clipsToBounds = NO;
        //
        if (self.style==ThreePicStyle) {
            _scrollView.frame = CGRectMake(self.margin, 0, self.frame.size.width-self.margin*2, self.frame.size.height);
            for (int i=0; i<self.sourceArr.count+2; i++) {
                UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((2*i+1)*self.gap/2+(_scrollView.frame.size.width-self.gap)*i, 0, _scrollView.frame.size.width-self.gap, _scrollView.frame.size.height)];
                [_scrollView addSubview:imgView];
                imgView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
            }
            _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width, 0);
            _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*(self.sourceArr.count+2), 0);
        }
        if (self.style==TwoPicStyle) {
            _scrollView.frame = CGRectMake(0, 0, self.frame.size.width-self.margin, self.frame.size.height);
            for (int i=0; i<self.sourceArr.count+2; i++) {
                UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width*i, 0, _scrollView.frame.size.width-self.gap/2, _scrollView.frame.size.height)];
                [_scrollView addSubview:imgView];
                imgView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
            }
            _scrollView.contentOffset = CGPointMake(0, 0);
            _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*(self.sourceArr.count+2), 0);
        }
        if (self.style==OnePicStyle) {
            _scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            for (int i=0; i<self.sourceArr.count+2; i++) {
                UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width*i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
                [_scrollView addSubview:imgView];
                imgView.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
            }
            _scrollView.contentOffset = CGPointMake(0, 0);
            _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width*(self.sourceArr.count+2), 0);
        }
        

    }
    return _scrollView;
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
