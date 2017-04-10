//
//  ViewController.m
//  PassWordView
//
//  Created by kangbing on 17/4/10.
//  Copyright © 2017年 kangbing. All rights reserved.
//

#import "ViewController.h"
#import "YSPayPassWordView.h"
#import "SetPassWordController.h"


@interface ViewController ()

@property (nonatomic, strong) YSPayPassWordView *payPassView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    UIButton *settingBtn = [[UIButton alloc]init];
    [self.view addSubview:settingBtn];
    [settingBtn setTitle:@"设置密码" forState:UIControlStateNormal];
    settingBtn.backgroundColor = [UIColor darkGrayColor];
    settingBtn.bounds = CGRectMake(0, 0, 100, 60);
    settingBtn.center = CGPointMake(kScreenSize.width * 0.5, kScreenSize.height * 0.3);
    [settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *payBtn = [[UIButton alloc]init];
    [self.view addSubview:payBtn];
    [payBtn setTitle:@"支付" forState:UIControlStateNormal];
    payBtn.backgroundColor = [UIColor darkGrayColor];
    payBtn.bounds = CGRectMake(0, 0, 100, 60);
    payBtn.center = CGPointMake(kScreenSize.width * 0.5, kScreenSize.height * 0.5);
    [payBtn addTarget:self action:@selector(payBtnClick) forControlEvents:UIControlEventTouchUpInside];
    

    
    
}

    
- (void)settingBtnClick{

    SetPassWordController *setVC = [[SetPassWordController alloc]init];
    [self.navigationController pushViewController:setVC animated:YES];

}

- (void)payBtnClick{

    
    NSLog(@"支付");
    
    YSPayPassWordView *payPassView = [[YSPayPassWordView alloc]init];
    self.payPassView = payPassView;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
