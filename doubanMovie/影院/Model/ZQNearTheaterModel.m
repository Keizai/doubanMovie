//
//  ZQTheaterModel.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/8.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "ZQNearTheaterModel.h"
#import "MJExtension.h"
@implementation ZQNearTheaterModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"idstr":@"id"};
}
@end
