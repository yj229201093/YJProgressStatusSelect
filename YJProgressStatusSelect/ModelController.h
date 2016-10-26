//
//  ModelController.h
//  YJProgressStatusSelect
//
//  Created by GongHui_YJ on 2016/10/26.
//  Copyright © 2016年 yangjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

