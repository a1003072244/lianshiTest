//
//  ViewController.m
//  lianshiTest
//
//  Created by 张豪豪 on 2018/10/25.
//  Copyright © 2018 张豪豪. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "UIView+zhh_init.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *person = [Person new];
    [person eat1];
    [person sleep1];
    
    NSLog(@"\n");
    [[person eat2] sleep2];
    
    NSLog(@"\n");
    person.eat3();
    person.sleep3();
    
    NSLog(@"\n");
    person.eat4().sleep4();
    NSLog(@"\n");
    person.sleep4().eat4();
    
    NSLog(@"\n");
    person.sleep5(3).eat5(@"大闸蟹");
    NSLog(@"\n");
    person.eatAndSleep1(@"河豚",10).eatAndSleep2(@"一只牛", 20);
    NSLog(@"\n");
    person.eatAndSleep3(@"方便面",1);
    
    
    __weak typeof(self)weakself = self;
    UIView.zhh_viewWithFrame(10,20,200,200).zhh_setBackgroundColor([UIColor blueColor]).zhh_setCornerRadius(10).zhh_setAlpha(0.8).zhh_setSuperView(weakself.view).zhh_setTapAction(^(UIView *view){
        [UIView animateWithDuration:2 delay:0 usingSpringWithDamping:50 initialSpringVelocity:20 options:UIViewAnimationOptionLayoutSubviews animations:^{
            view.transform = CGAffineTransformMakeTranslation(arc4random()%200, arc4random()%300);
        } completion:nil];
    });
}


@end
