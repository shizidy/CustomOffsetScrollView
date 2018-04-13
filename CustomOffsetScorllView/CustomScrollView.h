//
//  CustomCollectionView.h
//  CustomOffsetScorllView
//
//  Created by wdyzmx on 2018/4/12.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomScrollView : UIView

/**
 初始化CustomScrollView

 @param frame CustomScrollView.frame
 @param margin _scrollView.frame.origin.x
 @param gap 图片间距
 @param sourceArr 数据源
 @return return
 */
-(instancetype)initWithFrame:(CGRect)frame margin:(CGFloat)margin gap:(CGFloat)gap sourceArray:(NSArray *)sourceArr;
@end
