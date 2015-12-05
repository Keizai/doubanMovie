//
//  CastModel.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/1.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "CastModel.h"
#import "MJExtension.h"
@implementation CastModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"idstr":@"id"};
}
@end
