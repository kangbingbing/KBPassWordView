//
//  YSPassWordView.m
//  zhileDoctor
//
//  Created by kangbing on 17/2/16.
//  Copyright © 2017年 www.mwisdom.cn. All rights reserved.
//

#import "YSPassWordView.h"

@interface YSPassWordView ()

@property (nonatomic, strong) NSMutableArray *textFieldMua;

@property (nonatomic, strong) UITextField *textField;

@end

@implementation YSPassWordView

- (instancetype)init{

    if (self = [super init]) {
        
        UITextField *textField = [[UITextField alloc]init];
        self.textField = textField;
        [self addSubview:textField];
        textField.hidden = YES;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        [textField addTarget:self action:@selector(changeTextField:) forControlEvents:UIControlEventEditingChanged];
        textField.backgroundColor = [UIColor clearColor];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
//        textField.frame = self.bounds
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [textField becomeFirstResponder];
            
        });
        
    }

    return self;
}


- (void)setPassTextFCount:(NSUInteger)passTextFCount{

    _passTextFCount = passTextFCount;
    
    for (int i = 0; i < passTextFCount; i++) {
        
        UITextField *passTextF = [[UITextField alloc]init];
        passTextF.enabled = NO;  // 只显示, 不交互
        passTextF.backgroundColor=[UIColor whiteColor];
        passTextF.textAlignment = NSTextAlignmentCenter;
        passTextF.secureTextEntry = YES;
        passTextF.font = [UIFont boldSystemFontOfSize:38];
        passTextF.layer.borderWidth = 0.5;
        passTextF.layer.borderColor = [UIColor redColor].CGColor;
        [self insertSubview:passTextF belowSubview:self.textField];
        [self.textFieldMua addObject:passTextF];
    }
    
}

- (void)setPassTextFColor:(UIColor *)passTextFColor{

    _passTextFColor = passTextFColor;
    
    for (UITextField *textF in self.textFieldMua) {
        textF.layer.borderColor = passTextFColor.CGColor;
    }

}

- (void)setPassTextFMargin:(NSUInteger)passTextFMargin{

    _passTextFMargin = passTextFMargin;
    [self setNeedsLayout];
    
}


- (void)layoutSubviews{

    [super layoutSubviews];
    
    CGFloat X = 0;
    CGFloat Y = 0;
    //  当前 view 宽度 - 5 条竖线
    CGFloat W = (self.bounds.size.width - (self.passTextFCount - 1) * self.passTextFMargin) / self.passTextFCount;
    CGFloat H = self.bounds.size.height;
    for (NSUInteger i = 0; i < self.textFieldMua.count; i++) {
        UITextField *passTextField = [self.textFieldMua objectAtIndex:i];
        X = i * (W + self.passTextFMargin);
        passTextField.frame = CGRectMake(X, Y, W, H);
    }
    

}

- (void)clearInput{

    self.textField.text = nil;
    [self changeTextField:self.textField];
}


- (void)changeTextField:(UITextField *)textF{

    NSString *passWord = textF.text;
    if (passWord.length > self.passTextFCount) {
        passWord = [passWord substringToIndex:self.passTextFCount];
        self.textField.text = [self.textField.text substringToIndex:self.passTextFCount];
        return;
    }
    
    for (int i = 0; i < self.textFieldMua.count; i++){
        
        UITextField *pwdTextField= [_textFieldMua objectAtIndex:i];
        if (i < passWord.length) {
            // 截取
            NSString *pwd = [passWord substringWithRange:NSMakeRange(i, 1)];
            pwdTextField.text = pwd;
        } else {
            
            pwdTextField.text = nil;
        }
        
    }
    
    if (passWord.length == _textFieldMua.count){
        [_textField resignFirstResponder];//隐藏键盘
    }
    
    if ([self.delegate respondsToSelector:@selector(ysPassWordView:andWithInputString:)]) {
        [self.delegate ysPassWordView:self andWithInputString:passWord];
    }
    


}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.textField becomeFirstResponder];
    
}


- (NSMutableArray *)textFieldMua{

    if (_textFieldMua == nil) {
        _textFieldMua = [NSMutableArray arrayWithCapacity:6];
    }
    return _textFieldMua;

}

@end
