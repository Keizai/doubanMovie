//
//  DetailMovieInfo.h
//  doubanMovie
//
//  Created by 赵琦 on 15/12/3.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ImageModel,ZQRatingModel;
@interface ZQDetailMovieModel : NSObject
/**
 *  电影名
 */
@property (nonatomic, copy) NSString *title;
/**
 *  电影ID
 */
@property (nonatomic, copy) NSString *idstr;
/**
 *  年份
 */
@property (nonatomic, copy) NSString *year;
/**
 *  图片模型
 */
@property (nonatomic, strong) ImageModel *imageModel;
/**
 *  评分模型
 */
@property (nonatomic, strong) ZQRatingModel *ratingModel;
/**
 *  剧情简介
 */
@property (nonatomic, copy) NSString *summary;
/**
 *  国家
 */
@property (nonatomic, copy) NSString *countries;


@end
