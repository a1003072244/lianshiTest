//
//  Person.m
//  lianshiTest
//
//  Created by 张豪豪 on 2018/10/25.
//  Copyright © 2018 张豪豪. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat1 {
    NSLog(@"吃东西1");
}
- (void)sleep1 {
    NSLog(@"睡觉1");
}
- (Person *)eat2 {
    NSLog(@"吃东西2");
    return self;
}
- (Person *)sleep2 {
    NSLog(@"睡觉2");
    return self;
}
- (void(^)(void))eat3 {
    void(^eat3block)(void) = ^() {
        NSLog(@"吃东西3");
    };
    return eat3block;
}
- (void(^)(void))sleep3 {
    return ^ {
        NSLog(@"睡觉3");
    };
}
- (Person *(^)(void))eat4 {
    Person *(^eat4Block)(void) = ^() {
        NSLog(@"吃东西4");
        return self;
    };
    return eat4Block;
}
- (Person *(^)(void))sleep4 {
    return ^ {
        NSLog(@"睡觉4");
        return self;
    };
}

- (Person *(^)(NSString* name))eat5 {

    Person *(^eat5block)(NSString *) = ^(NSString *name) {
        NSLog(@"吃了%@", name);
        return self;
    };
    return eat5block;
}
- (Person *(^)(NSInteger hour))sleep5 {
    return ^(NSInteger hour) {
        NSLog(@"睡了%ld小时", (long)hour);
        return self;
    };
}

- (Person *(^)(NSString *food, NSInteger hour))eatAndSleep1 {
    Person *(^eatAndSleep1Block)(NSString *, NSInteger) = ^(NSString * food, NSInteger hour) {
        NSLog(@"吃了%@，睡了%ld小时",food, hour);
        return self;
    };
    return eatAndSleep1Block;
}
- (Person *(^)(NSString *food, NSInteger hour))eatAndSleep2 {
    return ^(NSString *food, NSInteger hour) {
        NSLog(@"睡了%ld小时,吃了%@", hour,food);

        return self;
    };
}

- (eatAndSleep3)eatAndSleep3 {
    return ^(NSString *food, NSInteger hour) {
        NSLog(@"这次吃了%@，睡了%ld小时", food, hour);
        return self;
    };
}

@end
