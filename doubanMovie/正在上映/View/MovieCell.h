//
//  MovieCell.h
//  doubanMovie
//
//  Created by 赵琦 on 15/11/30.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovieModel;
@interface MovieCell : UICollectionViewCell

/**
 *  电影数据模型
 */
@property (nonatomic, strong) MovieModel *model;

@end
