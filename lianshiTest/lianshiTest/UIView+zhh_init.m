//
//  UIView+zhh_init.m
//  lianshiTest
//
//  Created by ZHH on 2018/10/25.
//  Copyright © 2018 ZHH. All rights reserved.
//

#import "UIView+zhh_init.h"
#import <objc/runtime.h>

static const void *tapBlockkey = &tapBlockkey;

@implementation UIView (zhh_init)

@dynamic tapBlock;

+ (UIView *(^)(CGFloat x, CGFloat y, CGFloat width, CGFloat height))zhh_viewWithFrame {
    UIView *view = [UIView new];
    return ^(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
        view.frame = CGRectMake(x, y, width, height);
        return view;
    };
}
- (UIView *(^)(UIColor *color))zhh_setBackgroundColor {
    return ^(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}
- (UIView *(^)(CGFloat radius))zhh_setCornerRadius {
    return ^(CGFloat radius) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        return self;
    };
}
- (UIView *(^)(CGFloat alpha))zhh_setAlpha {
    return ^(CGFloat alpha) {
        self.alpha = alpha;
        return self;
    };
}
- (UIView *(^)(UIView *superView))zhh_setSuperView {
    return ^(UIView *superView) {
        [superView addSubview:self];
        return self;
    };
}
- (UIView *(^)(tapAction tapBlock))zhh_setTapAction {
    return ^(tapAction tapBlock) {
        if (self.userInteractionEnabled == NO) {
            self.userInteractionEnabled = YES;
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
        self.tapBlock = tapBlock;
        return self;
    };
}
- (void)tapAction {
    if (self.tapBlock) {
        self.tapBlock(self);
    }
}

- (void)setTapBlock:(tapAction)tapBlock {
    objc_setAssociatedObject(self, tapBlockkey, tapBlock, OBJC_ASSOCIATION_COPY);
}
- (tapAction)tapBlock {
    return objc_getAssociatedObject(self, tapBlockkey);
}

@end
