//
//  UIView+zhh_init.h
//  lianshiTest
//
//  Created by ZHH on 2018/10/25.
//  Copyright © 2018 ZHH. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^tapAction)(UIView *view);

@interface UIView (zhh_init)

@property (nonatomic, copy)tapAction tapBlock;//!<

+ (UIView *(^)(CGFloat x, CGFloat y, CGFloat width, CGFloat height))zhh_viewWithFrame;
- (UIView *(^)(UIColor *color))zhh_setBackgroundColor;
- (UIView *(^)(CGFloat radius))zhh_setCornerRadius;
- (UIView *(^)(CGFloat alpha))zhh_setAlpha;
- (UIView *(^)(UIView *superView))zhh_setSuperView;
- (UIView *(^)(tapAction tapBlock))zhh_setTapAction;

@end

NS_ASSUME_NONNULL_END
