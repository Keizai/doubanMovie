//
//  ZQTheaterInfoModel.h
//  doubanMovie
//
//  Created by 赵琦 on 15/12/8.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZQNearTheaterModel;
@interface ZQTheaterInfoModel : NSObject
/**
 *  影院信息
 */
@property (nonatomic, strong) ZQNearTheaterModel *cinema_info;
@property (nonatomic, strong) NSArray *lists;

@end
