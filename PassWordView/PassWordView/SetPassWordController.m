//
//  SetPassWordController.m
//  PassWordView
//
//  Created by kangbing on 17/4/10.
//  Copyright © 2017年 kangbing. All rights reserved.
//

#import "SetPassWordController.h"
#import "YSPassWordView.h"

@interface SetPassWordController ()<YSPassWordViewDelegate>

@property (nonatomic, strong) UILabel *tipsLbl;

@property (nonatomic, copy) NSString *firstPassWord;


@end

@implementation SetPassWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *tipsLbl = [[UILabel alloc]init];
    self.tipsLbl = tipsLbl;
    tipsLbl.text = @"请设置密码";
    [self.view addSubview:tipsLbl];
    [tipsLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(70 * KBScreenH);
        make.centerX.equalTo(self.view);
    }];
    
    YSPassWordView *passWordView = [[YSPassWordView alloc]init];
    passWordView.delegate = self;
    passWordView.passTextFCount = 6;
    [self.view addSubview:passWordView];
    
    [passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tipsLbl.mas_bottom).offset(40 * KBScreenW);
        make.left.equalTo(self.view).offset(40 * KBScreenW);
        make.right.equalTo(self.view).offset(-40 * KBScreenW);
        make.height.equalTo(@(50 * KBScreenH));
    }];
    
}

- (void)ysPassWordView:(YSPassWordView *)passWordView andWithInputString:(NSString *)inputString{
    
    NSLog(@"%@",inputString);
    if (inputString.length == 6) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [passWordView clearInput];
            
            self.tipsLbl.text = @"请再次输入密码";
            
        });
    }
    
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
