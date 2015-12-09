//
//  ZQMovieDetailInfoController.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/3.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "ZQMovieDetailInfoController.h"
#import "AFNetworking.h"
#import "MovieInfoCell.h"
#import "MBProgressHUD.h"
#import "MJExtension.h"
#import "MovieModel.h"
typedef NS_ENUM(NSInteger, ZQMovie) {
    ZQMovieInfo = 1,
    ZQMoviePhotos,
    ZQMovieSummary,
    ZQMovieComment,
};
@interface ZQMovieDetailInfoController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ZQMovieDetailInfoController
static NSString *const DetailInfoID = @"detailCell";


- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backItem.backBarButtonItem.image = [UIImage imageNamed:@"back"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieInfoCell"bundle:nil] forCellReuseIdentifier:DetailInfoID];
    self.tableView.allowsSelection = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self loadData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}
/**
 *  加载数据
 */
- (void)loadData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    NSString *str = @"https://api.douban.com/v2/movie/subject/";
    NSString *url = [str stringByAppendingString:self.idstr];
//    NSDictionary *para = @{@"id":self.idstr};
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        MovieModel *model = [MovieModel mj_objectWithKeyValues:responseObject];
        [_dataSource addObject:model];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 210;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        MovieInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailInfoID];
        cell.ticket = self.ticket;
        cell.model = _dataSource[indexPath.row];
        return cell;
}


@end
