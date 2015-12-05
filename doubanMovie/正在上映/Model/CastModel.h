//
//  CastModel.h
//  doubanMovie
//
//  Created by 赵琦 on 15/12/1.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ImageModel;
@interface CastModel : NSObject
/**
 *  演员照片
 */
@property (nonatomic, strong) ImageModel *avatar;
/**
 *  演员名字
 */
@property (nonatomic, copy) NSString *name;
/**
 *  演员ID
 */
@property (nonatomic, copy) NSString *idstr;


@end
