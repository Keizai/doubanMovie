//
//  ZQMovieListInfoController.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/9.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "ZQMovieListInfoController.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "MovieModel.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "ImageModel.h"
#import "ZQMovieDetailInfoController.h"
#import "MJRefresh.h"
@interface ZQMovieListInfoController ()
@property (nonatomic,strong) NSMutableArray *movieList;
@end

static NSString *const listID = @"listcell";
static int count = 20;
static int start = 20;

@implementation ZQMovieListInfoController
# pragma mark - 懒加载

- (NSMutableArray *)movieList{
    if (!_movieList) {
        _movieList = [[NSMutableArray alloc]init];
    }
    return _movieList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 90;
    
    self.title = @"豆瓣榜单";
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    [self loadData];
    self.tableView.sectionHeaderHeight = 25;
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadMoreData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *url = @"https://api.douban.com/v2/movie/top250";
    NSDictionary *para = @{@"count":@(count),@"start":@(start)};
    //    NSString *url = [str stringByAppendingString:self.idstr];
    //    NSDictionary *para = @{@"id":self.idstr};
    [manager GET:url parameters:para success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSArray *arr = responseObject[@"subjects"];
        for (NSDictionary *dict in arr) {
            MovieModel *model = [MovieModel mj_objectWithKeyValues:dict];
            
            [self.movieList addObject:model];
        }
        
        
        [self.tableView reloadData];
        start = start+20;
        [self.tableView.mj_footer endRefreshing];

    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
    }];

}
- (void)loadData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    NSString *url = @"https://api.douban.com/v2/movie/top250";
    //    NSString *url = [str stringByAppendingString:self.idstr];
//    NSDictionary *para = @{@"id":self.idstr};
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSArray *arr = responseObject[@"subjects"];
        for (NSDictionary *dict in arr) {
            MovieModel *model = [MovieModel mj_objectWithKeyValues:dict];
            [self.movieList addObject:model];
        }
        
        
        [self.tableView reloadData];
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];


}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.movieList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listID];
    }
    MovieModel *model = self.movieList[indexPath.section];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.images.small]  placeholderImage:[UIImage imageNamed:@"poster_default"]];
    cell.textLabel.text = [self.movieList[indexPath.section] title];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.view.frame.size.width, 25)];
    label.text = [NSString stringWithFormat:@"%ld",(long)section+1];
    label.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
    return label;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZQMovieDetailInfoController *vc = [[ZQMovieDetailInfoController alloc]init];
    MovieModel *model = self.movieList[indexPath.section];
    vc.idstr = model.idstr;
    vc.ticket = NO;
    vc.title = model.title;
    [self.navigationController pushViewController:vc animated:YES];
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:t forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
