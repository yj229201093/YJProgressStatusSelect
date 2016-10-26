//
//  BillingProgressView.h
//  LiBa
//
//  Created by GongHui_YJ on 16/9/9.
//  Copyright © 2016年 LiBa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillingProgressView : UIView

/**
 业主订单状态 OWNER_Billing(发单) OWNER_Recruit(招工中) OWNER_SelecTheMaster(选择师父) OWNER_Quote(报价) OWNER_Decorationing(装修中) OWNER_Finish(完成) // 根据需求这边自己加状态···
 */
typedef enum {
//    OWNER_Billing = 101, // 发单
    OWNER_Recruit = 101, // 招工中
    OWNER_SelecTheMaster, //选择师父
    OWNER_Quote, //报价
    OWNER_Decorationing, //装修中
    OWNER_Finish, //完成
}OwnerCurrentOrderProgressStute;

/**
 工人订单状态
 */
typedef enum {
    WORKER_WaitingSelect = 101, // 等待选择
    WORKER_Quote, //报价
    WORKER_StartWorking, //开工
    WORKER_Finish, //完工
}WorkerCurrentOrderProgressStute;

@property (strong, nonatomic) UIImageView *circleImageView; // 圆圈
@property (strong, nonatomic) UIImageView *progressLineImageView; //线
@property (strong, nonatomic) UILabel *progressContentLabel; // 进度标记内容;

/**
 *  创建进度视图
 *
 *  @param frame        frame
 *  @param circleCount  圆圈的个数
 *  @param lineCount    线条各数
 *  @param titileArrar  标题文本
 */
- (void)initWithCircleCount:(NSInteger)circleCount titleArray:(NSArray *)titileArrar;

/**
 *  设置业主当前订单进度状态
 *
 *  @param currentOrderProgressStute 当前订单进度状态
 */
- (void)setupOwnerWithCurrentOrderProgressStute:(OwnerCurrentOrderProgressStute)currentOrderProgressStute;

/**
 *  设置工人当前订单进度状态
 *
 *  @param currentOrderProgressStute 当前订单进度状态
 */
- (void)setupWorkerWithCurrentOrderProgressStute:(WorkerCurrentOrderProgressStute)currentOrderProgressStute;



@end
