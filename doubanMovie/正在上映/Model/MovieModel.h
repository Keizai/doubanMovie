//
//  MovieModel.h
//  doubanMovie
//
//  Created by 赵琦 on 15/12/1.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ImageModel,ZQRatingModel;

@interface MovieModel : NSObject
/**
 *  电影名
 */
@property (nonatomic, copy) NSString *title;
/**
 *  电影海报
 */
@property (nonatomic, strong) ImageModel *images;
/**
 *  电影ID 用来获取详细信息
 */
@property (nonatomic, copy) NSString *idstr;
/**
 *  评分信息
 */
@property (nonatomic, strong) ZQRatingModel *rating;
/**
 *  演员
 */
@property (nonatomic, strong) NSArray *casts;
/**
 *  电影简介
 */
@property (nonatomic, copy) NSString *summart;
/**
 *  上映年份
 */
@property (nonatomic, copy) NSString *year;
@end
