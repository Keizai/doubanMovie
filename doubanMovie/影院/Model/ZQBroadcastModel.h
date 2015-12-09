//
//  ZQBroadcastModel.h
//  doubanMovie
//
//  Created by 赵琦 on 15/12/8.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZQBroadcastModel : NSObject
/**
 *  影厅
 */
@property (nonatomic, copy) NSString *hall;

/**
 *  价格
 */
@property (nonatomic, copy) NSString *price;
/**
 *  时间
 */
@property (nonatomic, copy) NSString *time;

@end
