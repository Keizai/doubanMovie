//
//  ZQRatingModel.h
//  doubanMovie
//
//  Created by 赵琦 on 15/12/3.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQRatingModel : NSObject
/**
 *  最高评分
 */
@property (nonatomic, assign) NSInteger max;
/**
 *  平均评分
 */
@property (nonatomic, assign) double average;
/**
 *  评星数
 */
@property (nonatomic, assign) NSInteger stars;
/**
 *  最低评分
 */
@property (nonatomic, assign) NSInteger min;


@end
