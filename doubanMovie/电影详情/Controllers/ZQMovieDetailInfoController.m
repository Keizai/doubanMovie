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
typedef NS_ENUM(NSInteger, ZQMovieTime) {
    ZQMovieInfo = 1,
    ZQMoviePhotos,
    ZQMovieSummary,
    ZQMovieComment,
};
@interface ZQMovieDetailInfoController ()

@end

@implementation ZQMovieDetailInfoController
static NSString *const DetailInfoID = @"detailCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieInfoCell"bundle:nil] forCellReuseIdentifier:DetailInfoID];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    NSString *url = @"https://api.douban.com/v2/movie/subject/25864085";
//    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        self.headerView.model = [ZQDetailMovieModel detailMovieWithDict:responseObject];
//        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        
//    }];
//    return _headerView;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        MovieInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailInfoID];
    
    
    
    
    return cell;
}


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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
