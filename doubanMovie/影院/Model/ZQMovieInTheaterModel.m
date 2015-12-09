//
//  ZQMovieInTheaterModel.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/8.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "ZQMovieInTheaterModel.h"
#import "ZQBroadcastModel.h"
#import "MJExtension.h"
@implementation ZQMovieInTheaterModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"broadcast":[ZQBroadcastModel class]};
}
@end
