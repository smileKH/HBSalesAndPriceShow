//
//  HBSalesPriceTypeView.h
//  HBPleasedChoose
//
//  Created by Mac on 2020/10/15.
//  Copyright © 2020 yanruyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class HBSalesPriceTypeView;

typedef NS_ENUM(NSInteger,HBButtonClickType){
    HBButtonClickTypeNormal = 0,
    HBButtonClickTypeUp = 1,
    HBButtonClickTypeDown = 2,
};
@protocol HBSalesPriceTypeViewDelegate <NSObject>
@optional
//选中最上方的按钮的点击事件
- (void)selectTopButton:(HBSalesPriceTypeView *)selectView withIndex:(NSInteger)index withButtonType:(HBButtonClickType )type;
@end
@interface HBSalesPriceTypeView : UIView
@property (nonatomic, weak) id<HBSalesPriceTypeViewDelegate>delegate;
//默认选中，默认是第一个
@property (nonatomic, assign) int defaultSelectIndex;
@end

NS_ASSUME_NONNULL_END
