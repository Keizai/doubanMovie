//
//  MovieModel.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/1.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "MovieModel.h"
#import "ImageModel.h"
#import "ZQRatingModel.h"
#import "MJExtension.h"
#import "CastModel.h"
@implementation MovieModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"casts":[CastModel class]};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"idstr":@"id"};
}
@end
