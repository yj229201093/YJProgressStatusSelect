//
//  BillingProgressView.m
//  LiBa
//
//  Created by GongHui_YJ on 16/9/9.
//  Copyright © 2016年 LiBa. All rights reserved.
//

#import "BillingProgressView.h"
// 屏幕的宽和高
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kCirceWith 9 // 圆的宽度
#define kCircelY 14 // 圆的Y值
#define kLineHeight 1.5 //线的宽度
#define kLineY 18 // 线的X坐标

@implementation BillingProgressView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/**
 *  创建进度视图
 *
 *  @param circleCount 圆圈个数
 *  @param titileArrar 标题文本
 */
- (void)initWithCircleCount:(NSInteger)circleCount titleArray:(NSArray *)titileArrar {

    // 画圆
    for (int i = 0; i < circleCount; i++) {
        CGFloat circleX = i * (kScreenWidth / (circleCount + 1)) + (kScreenWidth / (circleCount + 1)); // 圆圈的X
        CGFloat circelY = kCircelY;
        self.circleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(circleX, circelY, kCirceWith, kCirceWith)];
        self.circleImageView.tag = i + 101; // Tag标记 101 102 103 104 105 106
        [self addSubview:_circleImageView];
        self.circleImageView.image = [UIImage imageNamed:@"billingUnReach"];
    }


    // 画线 线比圆圈多一个
    for (int i = 0; i < circleCount + 1; i++) {
        CGFloat lineX = i * (kScreenWidth / (circleCount + 1));
        CGFloat lineWith = kScreenWidth / (circleCount + 1);
        CGFloat lineY = kLineY; // 要在圆圈的中间 （圆圈的Y + 圆圈高度的一半）
        // 第二条线X 要在圆圈后面 With 要减去圆圈的宽度
        if (i > 0) {
            lineX = lineX + kCirceWith; // kCirceWith 是圆圈的款
            lineWith = lineWith - kCirceWith;
        }
        self.progressLineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(lineX, lineY, lineWith, kLineHeight)];
        self.progressLineImageView.tag = i * 100 + 100; // 100 200 300 400 500 600 700
        self.progressLineImageView.image = [UIImage imageNamed:@"billingUnReachLine"];
        [self addSubview:_progressLineImageView];
    }


    // Lable标记标题 // 标记内容是和圆圈对应的
    for (int i = 0; i < circleCount; i++) {
        CGFloat labelX = i * (kScreenWidth / (circleCount + 1)) + ((kScreenWidth  / (circleCount + 1)) / 2);
        CGFloat labelWith = (kScreenWidth / (circleCount + 1)) + kCirceWith; // 线的平均长度 + 圆圈的大小
        CGFloat labelY = 20;
        CGFloat labelHeight = 20;
        self.progressContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelWith, labelHeight)];
        self.progressContentLabel.tag = i * 100 + 1000; // 1000, 1100, 1200, 1300, 1400, 1500
        self.progressContentLabel.textAlignment = NSTextAlignmentCenter;
        self.progressContentLabel.font = [UIFont systemFontOfSize:8];
        self.progressContentLabel.text = titileArrar[i];
        self.progressContentLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_progressContentLabel];

    }
}

/**
 *  设置业主当前订单进度状态
 *
 *  @param currentOrderProgressStute 当前订单进度状态
 */
- (void)setupOwnerWithCurrentOrderProgressStute:(OwnerCurrentOrderProgressStute)currentOrderProgressStute {
    // 8 是指有多少个子视图， 我这边总共7条线，所以最多循环7次，多一次保险一点，这边还可以在优化
    for (int i = 0; i < 7; i++) {
        NSInteger tempTag = i + 101; // 状态圆圈
        NSInteger tempLineTag = i * 100 + 100; // 线条
        NSInteger tempTitleTag = i * 100 + 1000; // 状态标题

        // 当等于完成时 全部都亮色
        if (currentOrderProgressStute == OWNER_Finish) {
            UIImageView *tempLine1 = [self viewWithTag:tempLineTag];
            tempLine1.image = [UIImage imageNamed:@"billingReachLine"];
        }

        // 根据tag值找到视图下面的子视图
        if (tempTag <= currentOrderProgressStute) {
            UIImageView *temp1 = [self viewWithTag:tempTag];
            temp1.image = [UIImage imageNamed:@"billingReach"];

            UIImageView *tempLine1 = [self viewWithTag:tempLineTag];
            tempLine1.image = [UIImage imageNamed:@"billingReachLine"];

            UILabel *label1 = [self viewWithTag:tempTitleTag];
            label1.textColor =  [self colorWithHexString:@"ff5918" alpha:1];
        }
    }
}


/**
 *  设置工人当前订单进度状态
 *
 *  @param currentOrderProgressStute 当前订单进度状态
 */
- (void)setupWorkerWithCurrentOrderProgressStute:(WorkerCurrentOrderProgressStute)currentOrderProgressStute {
    for (int i = 0; i < 5; i++) {
        NSInteger tempTag = i + 101; // 状态圆圈
        NSInteger tempLineTag = i * 100 + 100; // 线条
        NSInteger tempTitleTag = i * 100 + 1000; // 状态标题

        // 当等于完成时 全部都亮色
        if (currentOrderProgressStute == WORKER_Finish) {
            UIImageView *tempLine1 = [self viewWithTag:tempLineTag];
            tempLine1.image = [UIImage imageNamed:@"billingReachLine"];
        }

        // 根据tag值找到视图下面的子视图
        if (tempTag <= currentOrderProgressStute) {
            UIImageView *temp1 = [self viewWithTag:tempTag];
            temp1.image = [UIImage imageNamed:@"billingReach"];

            UIImageView *tempLine1 = [self viewWithTag:tempLineTag];
            tempLine1.image = [UIImage imageNamed:@"billingReachLine"];

            UILabel *label1 = [self viewWithTag:tempTitleTag];
            label1.textColor =  [self colorWithHexString:@"ff5918" alpha:1];
        }
    }
}


- (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }

    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end
