//
//  ZQTestController.m
//  doubanMovie
//
//  Created by 赵琦 on 15/12/8.
//  Copyright © 2015年 赵琦. All rights reserved.
//

#import "ZQTestController.h"
#import <CoreLocation/CoreLocation.h>
#import "ZQNearTheaterModel.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"
@interface ZQTestController ()<CLLocationManagerDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) CLLocationManager *manager;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *theaters;
@end


@implementation ZQTestController
static NSString *const theaterCellID = @"theatercell";

- (void)viewDidLoad {
    self.tableView.tableFooterView = [[UIView alloc] init];
    [CLLocationManager locationServicesEnabled];
    self.navigationController.navigationBar.hidden = YES;
    self.manager.delegate = self;
    [self.manager startUpdatingLocation];
    [self.manager requestWhenInUseAuthorization];
    self.tableView.sectionHeaderHeight = 14.0;
}


#pragma mark - 懒加载
- (CLLocationManager *)manager{
    if (!_manager) {
        _manager = [[CLLocationManager alloc]init];
    }
    
    return _manager;
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:tableview];
        tableview.delegate = self;
        tableview.dataSource = self;
        _tableView = tableview;
    }
    return _tableView;
}

- (NSMutableArray *)theaters{
    if (!_theaters) {
        _theaters = [[NSMutableArray alloc]init];
    }
    return _theaters;
}

#pragma mark - CLLocationManagerDelegate delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
       CLLocation *loc = [locations lastObject];
    NSString *lat = [NSString stringWithFormat:@"%f",loc.coordinate.latitude];
    NSString *lon = [NSString stringWithFormat:@"%f",loc.coordinate.longitude];
    // 纬度：loc.coordinate.latitude
    // 经度：loc.coordinate.longitude
   
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSString *url = @"http://v.juhe.cn/movie/cinemas.local";
    [self.manager stopUpdatingLocation];
    NSDictionary *para = @{@"key":@"ad43cccf670cf799db6a3af8c0792213",@"lat":lat,@"lon":lon,@"radius":@"3000"};
    [mgr GET:url parameters:para success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSArray *arr = responseObject[@"result"];
        for (NSDictionary *dict in arr) {
            ZQNearTheaterModel *model = [ZQNearTheaterModel mj_objectWithKeyValues:dict];
            [self.theaters addObject:model];
        }
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        
    }];

}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    
}

#pragma mark - tableView datasource and delegate methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.theaters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:theaterCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:theaterCellID];
    }
    cell.textLabel.text = [self.theaters[indexPath.row] cinemaName];
    cell.detailTextLabel.text = [self.theaters[indexPath.row] distance];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 25)];
    label.text = @"附近的影院";
    label.font = [UIFont systemFontOfSize:10];
    label.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
    return label;
}


@end
