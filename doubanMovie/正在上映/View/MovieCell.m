//
//  MovieCell.m
//  doubanMovie
//
//  Created by 赵琦 on 15/11/30.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "MovieCell.h"
#import "MovieModel.h"
#import "ImageModel.h"
#import "UIImageView+WebCache.h"
#import "HCSStarRatingView.h"
#import "ZQRatingModel.h"
@interface MovieCell()
/**
 *  显示电影海报
 */
@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
/**
 *  显示电影名
 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
/**
 *  评分星条
 */
@property (weak, nonatomic) IBOutlet HCSStarRatingView *starRatingView;
@property (weak, nonatomic) IBOutlet UILabel *ratingValuelabel;
@end
@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
}
- (void)setModel:(MovieModel *)model{
    _model = model;
    self.nameLabel.text = model.title;
    self.nameLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    
    [self.postImageView sd_setImageWithURL:[NSURL URLWithString:model.images.large] placeholderImage:[UIImage imageNamed:@"poster_default"]];
    
    self.starRatingView.maximumValue = 5;
    self.starRatingView.minimumValue = 0;
    self.starRatingView.userInteractionEnabled = NO;
    
    self.starRatingView.value = (NSInteger)model.rating.average/2.0;
    self.starRatingView.emptyStarImage = [UIImage imageNamed:@"graystar"];
    self.starRatingView.halfStarImage = [UIImage imageNamed:@"star_half"];
    self.starRatingView.filledStarImage = [UIImage imageNamed:@"redstar"];
   
    self.ratingValuelabel.text = [NSString stringWithFormat:@"%.1f",self.model.rating.average];
}
@end
