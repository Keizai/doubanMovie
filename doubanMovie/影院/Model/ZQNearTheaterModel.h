//
//  ZQTheaterModel.h
//  doubanMovie
//
//  Created by 赵琦 on 15/12/8.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQNearTheaterModel : NSObject
/**
 *  id	string	电影院ID

 */
@property (nonatomic, copy) NSString *idstr;
/**
 *  cinemaName	string	影院名称

 */
@property (nonatomic, copy) NSString *cinemaName;

/**
 *  address	string	影院地址
 */
@property (nonatomic, copy) NSString *address;
/**
 *  telephone	string	联系电话

 */
@property (nonatomic, copy) NSString *telephone;

/**
 *  distance	string	大概距离(米)
 */
@property (nonatomic, copy) NSString *distance;

@end
