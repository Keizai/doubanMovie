//
//  MovieInfoCell.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/4.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "MovieInfoCell.h"
#import "HCSStarRatingView.h"
#import "UIImageView+WebCache.h"
#import "MovieModel.h"
#import "ImageModel.h"
#import "ZQRatingModel.h"
@interface MovieInfoCell()
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet HCSStarRatingView *ratingBar;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end
@implementation MovieInfoCell

- (void)setModel:(MovieModel *)model{
//    self.imageView sd_setImageWithURL:[NSURL URLWithString:model.images.small] placeholderImage:[UIImage imageNamed:@"poster_default"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//    }
    
    _model = model;
    self.imageView.contentMode = UIViewContentModeCenter;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.images.medium] placeholderImage:[UIImage imageNamed:@"poster_default"]];
    
    self.ratingBar.maximumValue = 5;
    self.ratingBar.minimumValue = 0;
    self.ratingBar.userInteractionEnabled = NO;
    self.imageView.clipsToBounds = YES;
    self.ratingBar.value = (NSInteger)model.rating.average/2.0;
    NSLog(@"%f",model.rating.average);
    self.ratingLabel.text = [NSString stringWithFormat:@"%.1f",model.rating.average];
    
}
- (void)layoutSubviews{
    CGRect frame =self.imageView.frame;
    frame = CGRectMake(10, 10, 90, 130);
    self.imageView.frame = frame;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
