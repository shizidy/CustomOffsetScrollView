//
//  CustomCollectionView.h
//  CustomOffsetScorllView
//
//  Created by wdyzmx on 2018/4/12.
//  Copyright © 2018年 wdyzmx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionView : UIView
-(instancetype)initWithFrame:(CGRect)frame margin:(CGFloat)margin gap:(CGFloat)gap sourceArray:(NSArray *)sourceArr;
@end
