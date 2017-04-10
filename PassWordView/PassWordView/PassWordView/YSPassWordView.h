//
//  YSPassWordView.h
//  zhileDoctor
//
//  Created by kangbing on 17/2/16.
//  Copyright © 2017年 www.mwisdom.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YSPassWordView;

@protocol YSPassWordViewDelegate <NSObject>

- (void)ysPassWordView:(YSPassWordView *)passWordView andWithInputString:(NSString *)inputString;

@end

@interface YSPassWordView : UIView


/** 密码框个数 */
@property (nonatomic, assign) NSUInteger passTextFCount;

/** 颜色 */
@property (nonatomic, strong) UIColor *passTextFColor;

/** 间距 */
@property (nonatomic, assign) NSUInteger passTextFMargin;

@property (nonatomic, weak) id <YSPassWordViewDelegate>delegate;

/** 清空密码 */
- (void)clearInput;

@end
