//
//  YSPayPassWordView.m
//  zhileDoctor
//
//  Created by kangbing on 17/2/16.
//  Copyright © 2017年 www.mwisdom.cn. All rights reserved.
//

#import "YSPayPassWordView.h"
#import "YSPassWordView.h"

@interface YSPayPassWordView ()<YSPassWordViewDelegate>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIButton *closeBtn;
/** 标题 */
@property (nonatomic, strong) UILabel *titleLbl;

@property (nonatomic, strong) UIView *blueLineView;
/** 金额标题 */
@property (nonatomic, strong) UILabel *moneyTitleLbl;
/** 金额 */
@property (nonatomic, strong) UILabel *moneyLbl;

@property (nonatomic, strong) YSPassWordView *passWordView;
@end

@implementation YSPayPassWordView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.06];
        self.frame = [UIScreen mainScreen].bounds;
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:self];
        
        // 添加白色 View
        UIView *bgView = [[UIView alloc]init];
        _bgView = bgView;
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.layer.cornerRadius = 8.0f;
        bgView.layer.masksToBounds = YES;
        [self addSubview:bgView];
        
        _closeBtn = [[UIButton alloc]init];
        [_closeBtn setImage:[UIImage imageNamed:@"cancle_pay"] forState:UIControlStateNormal];
        [bgView addSubview:_closeBtn];
        [_closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        // 请输入提现密码
        _titleLbl = [[UILabel alloc]init];
        _titleLbl.text = @"请输入提现密码";
        [bgView addSubview:_titleLbl];
        
        
        _blueLineView = [[UIView alloc]init];
        _blueLineView.backgroundColor = [UIColor blueColor];
        [bgView addSubview:_blueLineView];
        
        _moneyTitleLbl = [[UILabel alloc]init];
        _moneyTitleLbl.text = @"金额";
        [bgView addSubview:_moneyTitleLbl];
        
        _moneyLbl = [[UILabel alloc]init];
        _moneyLbl.text = @"¥10000";
        _moneyLbl.font = [UIFont boldSystemFontOfSize:40];
        [bgView addSubview:_moneyLbl];
        
        
        _passWordView = [[YSPassWordView alloc]init];
        _passWordView.delegate = self;
        _passWordView.passTextFCount = 6;
        [bgView addSubview:_passWordView];
        
        
    }
    return self;
}

#pragma mark 用户输入的密码
- (void)ysPassWordView:(YSPassWordView *)passWordView andWithInputString:(NSString *)inputString{

    NSLog(@"%@",inputString);
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"KINPUT_PASSWORD" object:nil userInfo:@{@"passWord":inputString}];
    
    if (inputString.length >=6) {
        NSLog(@"验证密码");
    }
    
    

}
#pragma mark 清空输入框
- (void)clearPassWord{

    [_passWordView clearInput];

}

- (void)closeBtnClick{

    if (self) {
        [self removeFromSuperview];
    }

}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    [self endEditing:YES];
//}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(45 * KBScreenW);
        make.right.equalTo(self).offset(-45 * KBScreenW);
        make.height.equalTo(@(225 * KBScreenH));
        make.top.equalTo(self).offset(140 * KBScreenH);
    }];
    
    
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_bgView).offset(10 * KBScreenW);
        make.right.equalTo(_bgView).offset(-10 * KBScreenW);
    }];

    [_titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView);
        make.top.equalTo(_bgView).offset(10 * KBScreenH);
    }];
    
    
    [_blueLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLbl.mas_bottom).offset(10);
        make.right.left.equalTo(_bgView);
        make.height.equalTo(@0.5);
    }];
    
    [_moneyTitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_blueLineView.mas_bottom).offset(22 * KBScreenH);
        make.centerX.equalTo(_bgView);
    }];
    
    [_moneyLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_moneyTitleLbl.mas_bottom).offset(10 * KBScreenH);
        make.centerX.equalTo(_bgView);
    }];
    
    
    [_passWordView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(_bgView).offset(15 * KBScreenW);
        make.right.equalTo(_bgView).offset(-15 * KBScreenW);
        make.bottom.equalTo(_bgView.mas_bottom).offset(-15 * KBScreenW);
        make.height.equalTo(@(40 * KBScreenH));
        
    }];

}

@end
