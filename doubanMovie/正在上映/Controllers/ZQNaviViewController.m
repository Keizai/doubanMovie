//
//  ZQNaviViewController.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/3.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "ZQNaviViewController.h"

@interface ZQNaviViewController ()

@end

@implementation ZQNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
+ (void)initialize
{
    
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
/**
 *  能拦截所有push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];

    if (self.viewControllers.count >0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        self.navigationBar.barStyle = UIBarStyleBlack;
        self.navigationBar.translucent = NO;
        NSLog(@"0");
        viewController.navigationController.navigationBar.hidden = NO;

    } else {
        NSLog(@"2");
        
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
