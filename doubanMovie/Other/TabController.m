//
//  TabController.m
//  doubanMovie
//
//  Created by 赵琦 on 15/11/29.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "TabController.h"

@interface TabController ()

@end

@implementation TabController


- (void)viewDidLoad {
    [super viewDidLoad];
    for (UIBarItem *item in self.tabBar.items) {
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIFont fontWithName:@"Helvetica" size:17.0], NSFontAttributeName, nil]
                            forState:UIControlStateNormal];
        
    }
    self.tabBar.translucent = NO;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    [view setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:view];

    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
