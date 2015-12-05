//
//  DetailMovieInfo.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/3.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "ZQDetailMovieModel.h"
#import "ImageModel.h"
#import "ZQRatingModel.h"
@implementation ZQDetailMovieModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"idstr":@"id"};
}
@end
