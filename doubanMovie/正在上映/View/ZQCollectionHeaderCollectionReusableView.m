//
//  ZQCollectionHeaderCollectionReusableView.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/2.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "ZQCollectionHeaderCollectionReusableView.h"

@implementation ZQCollectionHeaderCollectionReusableView
- (IBAction)footerButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(collectionDidClickFooterButton:)]) {
       [self.delegate collectionDidClickFooterButton:self];
        [sender setBackgroundImage:[UIImage imageNamed:@"upcoming_cn"] forState:UIControlStateNormal];
    }
    }
- (void)setButton:(UIButton *)button{
    _button = button;
    NSString *str = [button titleForState:UIControlStateNormal];
    if (!str) {
        [button setTitle:@"查看即将上映的电影" forState:UIControlStateNormal];
    }     
}
- (void)awakeFromNib {
    // Initialization code
    
}

@end
