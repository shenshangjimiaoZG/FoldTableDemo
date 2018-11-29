//
//  YUTestViewController.h
//  YUFoldingTableViewDemo
//
//  Created by gg.lucy on 2018/10/23.
//  Copyright © 2018 王刚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YUFoldingTableView.h"

@interface YUTestViewController : UIViewController  <YUFoldingTableViewDelegate>

@property (nonatomic, assign) YUFoldingSectionHeaderArrowPosition arrowPosition;

@property (nonatomic, assign) NSInteger index;

@end
