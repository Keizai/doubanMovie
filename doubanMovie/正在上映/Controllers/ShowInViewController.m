//
//  ShowInViewController.m
//  doubanMovie
//
//  Created by 赵琦 on 15/11/30.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "ShowInViewController.h"
#import "MovieCell.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "MovieModel.h"
#import "MBProgressHUD.h"
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"
#import "ZQCollectionHeaderCollectionReusableView.h"
#import "ZQMovieDetailInfoController.h"
typedef NS_ENUM(NSInteger, ZQMovieTime) {
   ZQMovieInTheater = 0,
   ZQMovieComingSoon,
};

@interface ShowInViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,ZQCollectionFooterDelegate>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *moviesInTheater;

@property (nonatomic, strong) NSMutableArray *moviesComingSoon;

@end

@implementation ShowInViewController
static NSString *const cellID = @"moviecell";
static NSString *const footerID = @"footer";
- (NSMutableArray *)moviesInTheater{
    if (!_moviesInTheater) {
        self.moviesInTheater = [[NSMutableArray alloc]init];
    }
    return _moviesInTheater;
}

- (NSMutableArray *)moviesComingSoon{
    if (!_moviesComingSoon) {
        self.moviesComingSoon = [[NSMutableArray alloc]init];
    }
    
    return _moviesComingSoon;
}

- (UICollectionView *)collectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(10,20,self.view.bounds.size.width-20,self.view.bounds.size.height) collectionViewLayout:flowLayout];
    [collection registerNib:[UINib nibWithNibName:@"ZQCollectionHeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerID];
    [collection registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil]forCellWithReuseIdentifier:cellID];
    
    [collection setBackgroundColor:[UIColor whiteColor]];
    collection.dataSource = self;
    collection.delegate = self;
   
    [self.view addSubview:collection];
    _collectionView = collection;
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    [view setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:view];
    //获取正在上映的电影信息
    [self setUpMoviesInTheater];
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.
}

#pragma mark -获取信息
/**
 *  获取正在上映的电影信息
 */
- (void)setUpMoviesInTheater{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString *url = @"https://api.douban.com/v2/movie/in_theaters";
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSArray *arr = responseObject[@"subjects"];
        for (NSDictionary *dict in arr) {
            MovieModel *model = [MovieModel mj_objectWithKeyValues:dict];
            [self.moviesInTheater addObject:model];
        }
        
        [self.collectionView reloadData];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];

}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView DataSource methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == ZQMovieInTheater) {
        return self.moviesInTheater.count;
    } else {
        return self.moviesComingSoon.count;
    }
    
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MovieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    if (indexPath.section == ZQMovieInTheater) {
        cell.model = self.moviesInTheater[indexPath.row];
    } else {
        cell.model = self.moviesComingSoon[indexPath.row];
    }
    
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"click");
    ZQMovieDetailInfoController *vc = [[ZQMovieDetailInfoController alloc]init];
    
    if (indexPath.section == ZQMovieInTheater) {
        vc.title = [self.moviesInTheater[indexPath.row] title];
        vc.idstr = [self.moviesInTheater[indexPath.row] idstr];
    } else {
        vc.title = [self.moviesComingSoon[indexPath.row] title];
        vc.idstr = [self.moviesComingSoon[indexPath.row] idstr];
        
    }
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - UICollectionViewDelegateFlowLayout methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(90, 175);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
            return CGSizeMake(320, 100);
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
        ZQCollectionHeaderCollectionReusableView *cell = (ZQCollectionHeaderCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerID forIndexPath:indexPath];
        cell.delegate = self;
        if (indexPath.section == ZQMovieComingSoon) {
        cell.backgroundColor = [UIColor clearColor];
        if (indexPath.section == ZQMovieComingSoon) {
        [cell.button setTitle:@" " forState:UIControlStateNormal];
            cell.button.userInteractionEnabled = NO;
            cell.alpha = 1.0;
        }
    }
    return cell;
       
}

#pragma mark - ZQCollectionFooterDelegate

- (void)collectionDidClickFooterButton:(ZQCollectionHeaderCollectionReusableView *)reusableView{
    NSLog(@"footerClick");
    NSString *url = @"https://api.douban.com/v2/movie/coming_soon";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [MBProgressHUD showHUDAddedTo:reusableView animated:YES];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSArray *arr = responseObject[@"subjects"];
        
        for (NSDictionary *dict in arr) {
            MovieModel *model = [MovieModel mj_objectWithKeyValues:dict];
            [self.moviesComingSoon addObject:model];
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
        
        
        [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];
    
}

#pragma mark - 返回状态栏样式
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
