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
    [self.navigationBar setBackgroundColor:[UIColor blackColor]];
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

    if (self.viewControllers.count ==0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        NSLog(@"0");
//        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationController.navigationBar.hidden = YES;
    } else {
        NSLog(@"2");
        viewController.navigationController.navigationBar.hidden = NO;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
