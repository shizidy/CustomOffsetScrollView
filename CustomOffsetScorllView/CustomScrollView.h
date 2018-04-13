//
//  CustomCollectionView.h
//  CustomOffsetScorllView
//
//  Created by wdyzmx on 2018/4/12.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    OnePicStyle,//只显示一张
    TwoPicStyle,//两张
    ThreePicStyle,//三张
} ScrollPicStyle;

@interface CustomScrollView : UIView


/**
 初始化CustomScrollView

 @param frame CustomScrollView.frame
 @param margin _scrollView.frame.origin.x
 @param gap 图片间距
 @param sourceArr 数据源
 @return return
 */
-(instancetype)initWithFrame:(CGRect)frame margin:(CGFloat)margin gap:(CGFloat)gap sourceArray:(NSArray *)sourceArr andPicStyle:(ScrollPicStyle)style;
@end
