//
//  ZQMovieInTheaterModel.h
//  doubanMovie
//
//  Created by 赵琦 on 15/12/8.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQMovieInTheaterModel : NSObject
/**
 *  电影ID
 */
@property (nonatomic, copy) NSString *movieId;

/**
 *  电影名称
 */
@property (nonatomic, copy) NSString *movieName;

/**
 *  海报URL
 */
@property (nonatomic, copy) NSString *pic_url;
/**
 *  排片信息
 */
@property (nonatomic, strong) NSArray *broadcast;

@end
