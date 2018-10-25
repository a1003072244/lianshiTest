//
//  Person.h
//  lianshiTest
//
//  Created by 张豪豪 on 2018/10/25.
//  Copyright © 2018 张豪豪. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Person;
typedef Person*(^eatAndSleep3)(NSString *food, NSInteger hour);

@interface Person : NSObject

- (void)eat1;
- (void)sleep1;
- (Person *)eat2;
- (Person *)sleep2;
- (void(^)(void))eat3;
- (void(^)(void))sleep3;
- (Person *(^)(void))eat4;
- (Person *(^)(void))sleep4;
- (Person *(^)(NSString* name))eat5;
- (Person *(^)(NSInteger hour))sleep5;
- (Person *(^)(NSString *food, NSInteger hour))eatAndSleep1;
- (Person *(^)(NSString *food, NSInteger hour))eatAndSleep2;
- (eatAndSleep3)eatAndSleep3;

@end

NS_ASSUME_NONNULL_END
