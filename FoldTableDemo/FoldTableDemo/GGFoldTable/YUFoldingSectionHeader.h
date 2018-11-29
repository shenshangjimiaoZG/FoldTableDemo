//
//  YUFoldingSectionHeader.h
//  YUFoldingTableView
//
//  Created by gg.lucy on 2018/10/23.
//  Copyright © 2018 王刚. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YUFoldingSectionState) {
    
    YUFoldingSectionStateFlod, // 折叠
    YUFoldingSectionStateShow, // 打开
};

// 箭头的位置
typedef NS_ENUM(NSUInteger, YUFoldingSectionHeaderArrowPosition) {
    
    YUFoldingSectionHeaderArrowPositionLeft,
    YUFoldingSectionHeaderArrowPositionRight,
};

@protocol YUFoldingSectionHeaderDelegate <NSObject>

- (void)yuFoldingSectionHeaderTappedAtIndex:(NSInteger)index;

@end


@interface YUFoldingSectionHeader : UITableViewHeaderFooterView

@property (nonatomic, weak) id <YUFoldingSectionHeaderDelegate> tapDelegate;

@property (nonatomic, assign) BOOL autoHiddenSeperatorLine;

@property (nonatomic, strong) UIColor *separatorLineColor;

- (void)configWithBackgroundColor:(UIColor *)backgroundColor
                      titleString:(NSString *)titleString
                       titleColor:(UIColor *)titleColor
                        titleFont:(UIFont *)titleFont
                descriptionString:(NSString *)descriptionString
                 descriptionColor:(UIColor *)descriptionColor
                  descriptionFont:(UIFont *)descriptionFont
                       arrowImage:(UIImage *)arrowImage
                    arrowPosition:(YUFoldingSectionHeaderArrowPosition)arrowPosition
                     sectionState:(YUFoldingSectionState)sectionState
                     sectionIndex:(NSInteger)sectionIndex;



@end
