//
//  ViewController.m
//  HBSalesAndPriceShow
//
//  Created by Mac on 2020/10/15.
//  Copyright © 2020 yanruyu. All rights reserved.
//

#import "ViewController.h"
#import "HBSalesPriceTypeView.h"
#import <Masonry.h>
#define SCREEN_WIDTH            ([[UIScreen mainScreen] bounds].size.width)
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,HBSalesPriceTypeViewDelegate>
@property (nonatomic , strong)HBSalesPriceTypeView * selectTypeView;
@property (nonatomic ,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.selectTypeView];
    [self.selectTypeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(64);
        make.height.mas_equalTo(40);
        make.left.right.equalTo(self.view);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.selectTypeView.mas_bottom);
        make.bottom.equalTo(self.view);
        make.left.right.equalTo(self.view);
    }];
}

#pragma mark ==========getter==========
-(HBSalesPriceTypeView *)selectTypeView{
    if (!_selectTypeView) {
        _selectTypeView = [[HBSalesPriceTypeView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 40)];
        _selectTypeView.delegate = self;
    }
    return _selectTypeView;
}
#pragma mark ==========代理==========
-(void)selectTopButton:(HBSalesPriceTypeView *)selectView withIndex:(NSInteger)index withButtonType:(HBButtonClickType)type{
    if (index==100) {
        //综合
 
    }else if (index==101){
        //销量
        
    }else if (index==102){
        //价格
        
    }else if (index==103){
        //佣金
    }
    
    //请求数据
}

#pragma mark ==========tableViewDelegate==========
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

#pragma mark ==========tableview代理方法==========
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    // 2.创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = @"哈哈哈哈哈";
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

#pragma mark ==========tableViewGetter==========
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = ({
            UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            tableView.dataSource = self;
            tableView.delegate = self;
            tableView.backgroundColor = [UIColor whiteColor];
            //设置分割线样式
            tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
            //cell的分割线距视图距离
            tableView.separatorInset=UIEdgeInsetsMake(0, 0, 0, 0);
            //隐藏底部多余分割线
            tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
            //iOS11默认开启Self-Sizing，需关闭才能设置Header,Footer高度
            tableView.estimatedRowHeight = 66;
            tableView.estimatedSectionHeaderHeight = 0;
            tableView.estimatedSectionFooterHeight = 0;
            tableView.rowHeight = 50 ;
            tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectZero];;
            tableView ;
        }) ;
    }
    return _tableView;
}
@end
