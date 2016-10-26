//
//  MainViewController.m
//  YJProgressStatusSelect
//
//  Created by GongHui_YJ on 2016/10/26.
//  Copyright © 2016年 yangjian. All rights reserved.
//

#import "MainViewController.h"
#import "BillingProgressView.h"

@interface MainViewController ()
@property (strong, nonatomic) BillingProgressView *billingProgressView; // 进度视图
@property (assign, nonatomic) OwnerCurrentOrderProgressStute ownerCurrentOrderProgressStute; // 枚举
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ownerCurrentOrderProgressStute = OWNER_Decorationing;
    _billingProgressView = [[BillingProgressView alloc] initWithFrame:CGRectMake(0, 100, 320, 87)];
    NSArray *ownerOrderProgressStuteTitleArray = @[@"进度一", @"进度二", @"进度三", @"进度四", @"进度五", @"完成"];
    [_billingProgressView initWithCircleCount:ownerOrderProgressStuteTitleArray.count titleArray:ownerOrderProgressStuteTitleArray];
    // 设置状态 设置当前状态
    [_billingProgressView setupOwnerWithCurrentOrderProgressStute:_ownerCurrentOrderProgressStute];
    [self.view addSubview:_billingProgressView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
