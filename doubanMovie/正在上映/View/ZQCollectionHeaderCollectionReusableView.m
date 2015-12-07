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
        
    }
    }


- (void)layoutSubviews{
    NSString *str = [self.button titleForState:UIControlStateNormal];
    if (!str) {
        [self.button setTitle:@"查看即将上映的电影" forState:UIControlStateNormal];
    } else if ([str isEqualToString:@"查看即将上映的电影"]) {
        [self.button setBackgroundImage:[UIImage imageNamed:@"upcoming_cn"] forState:UIControlStateNormal];
        [self.button setTitle:@" " forState:UIControlStateNormal];
    }
}
- (void)awakeFromNib {
    // Initialization code
    
}

@end
