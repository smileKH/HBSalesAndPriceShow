//
//  HBSalesPriceTypeView.m
//  HBPleasedChoose
//
//  Created by Mac on 2020/10/15.
//  Copyright © 2020 yanruyu. All rights reserved.
//

#import "HBSalesPriceTypeView.h"
#import <objc/runtime.h>
#import <Masonry.h>
#import "UIButton+ImageTitleStyle.h"
static char *const btnKey = "btnKey";

// 获取RGBA颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define SCREEN_WIDTH            ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT           ([[UIScreen mainScreen] bounds].size.height)

@interface HBSalesPriceTypeView ()
@property (nonatomic ,strong)NSArray *titleArr;//标题
@end
@implementation HBSalesPriceTypeView
-(NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@"综合",@"销量",@"价格",@"高佣"];
    }
    return _titleArr;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //添加子视图
        [self addSubViewUI];
    }
    return self;
}
#pragma mark ==========添加子视图==========
-(void)addSubViewUI{
    self.backgroundColor = [UIColor whiteColor];
    UIView *mainView = [UIView new];
    mainView.backgroundColor = RGBA(255, 255, 255, 1);
    [self addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.left.right.top.equalTo(self);
    }];
    NSInteger count = self.titleArr.count;
    for (int i = 0; i < count; i++) {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:self.titleArr[i] forState:UIControlStateNormal ];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [mainView addSubview:button];
        button.tag = 100+i;
        //布局
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(mainView).offset(SCREEN_WIDTH/count*i);
            make.top.bottom.equalTo(mainView);
            make.width.mas_equalTo(SCREEN_WIDTH/count);
        }];
        //设置默认选择
        if (i == _defaultSelectIndex) {
            button.selected = YES;
        }
        if (i==0) {
            //综合
        }else{
           [button setImage:[UIImage imageNamed:@"type_sale_shangxia"] forState:UIControlStateNormal];
            [button setButtonImageTitleStyle:ButtonImageTitleStyleRight padding:2];
            objc_setAssociatedObject(button, btnKey, @"1", OBJC_ASSOCIATION_ASSIGN);
        }
    }
}

#pragma mark ==========点击按钮==========
- (void)selectClick:(UIButton *)btn{
    
    for (int i = 0; i<4 ;i++) {
        UIButton *button = [self viewWithTag:i+100];
        button.selected = NO;
        if (i+100==btn.tag) {
            //当前点击按钮
            NSLog(@"点击当前按钮状态");
        }else{
            if (i==0) {
                //综合
            }else{
               [button setImage:[UIImage imageNamed:@"type_sale_shangxia"] forState:UIControlStateNormal];
                [button setButtonImageTitleStyle:ButtonImageTitleStyleRight padding:2];
                objc_setAssociatedObject(button, btnKey, @"1", OBJC_ASSOCIATION_ASSIGN);
            }
        }
    }
    btn.selected = YES;

    HBButtonClickType type = HBButtonClickTypeNormal;
    if (btn.tag == 100) {
        //综合
    }else{
       NSString *flag = objc_getAssociatedObject(btn, btnKey);
       if ([flag isEqualToString:@"1"]) {
           [btn setImage:[UIImage imageNamed:@"ec_type_sale_shang"] forState:UIControlStateNormal];
           objc_setAssociatedObject(btn, btnKey, @"2", OBJC_ASSOCIATION_ASSIGN);
           type = HBButtonClickTypeUp;
       }else if ([flag isEqualToString:@"2"]){
           [btn setImage:[UIImage imageNamed:@"ec_type_sale_xie"] forState:UIControlStateNormal];
           objc_setAssociatedObject(btn, btnKey, @"1", OBJC_ASSOCIATION_ASSIGN);
           type = HBButtonClickTypeDown;
       }
    }
    
    if ([self.delegate respondsToSelector:@selector(selectTopButton:withIndex:withButtonType:)]) {
        [self.delegate selectTopButton:self withIndex:btn.tag withButtonType:type];
    }
    
}
@end
