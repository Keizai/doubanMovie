//
//  ZQCollectionHeaderCollectionReusableView.h
//  doubanMovie
//
//  Created by 赵琦 on 15/12/2.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZQCollectionHeaderCollectionReusableView;

@protocol ZQCollectionFooterDelegate <NSObject>
@optional
- (void)collectionDidClickFooterButton:(ZQCollectionHeaderCollectionReusableView *)reusableView;

@end
@interface ZQCollectionHeaderCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, weak) id<ZQCollectionFooterDelegate> delegate;

@end
