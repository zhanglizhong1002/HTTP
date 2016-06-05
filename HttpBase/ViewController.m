//
//  ViewController.m
//  HttpBase
//
//  Created by lizhong_zhang on 16/5/18.
//  Copyright © 2016年 lizhong_zhang. All rights reserved.
//

#import "ViewController.h"
#import "CDUserCenterModel.h"
#import "LoginViewController.h"

@interface ViewController ()
{
    CDUserCenterModel *userInfo;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Demo";
    
    UIButton *btn = [[UIButton alloc] initWithFrame:self.view.frame];
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn setTitle:@"点击进行第三方登录" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(ActionBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)ActionBtn:(UIButton *)btn
{
    LoginViewController *VC = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
    
    
    //[CDStatusTool getNoticeSuccess:^(CDUserCenter *result) {
        //  获取数据数组
//        [_dataArray addObjectsFromArray:result.datas];
//        [_tableView reloadData];

    //} failure:nil];
    
    
/*
    [CDStatusTool getLastVersionSuccess:^(CDVersionModel *result) {
        result;
    } failure:^(NSError *error) {
        
    }];
 */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
