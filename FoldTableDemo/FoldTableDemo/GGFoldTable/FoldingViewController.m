//
//  FoldingViewController.m
//  demo
//
//  Created by gg.lucy on 2018/10/23.
//  Copyright © 2018 王刚. All rights reserved.
//

#import "FoldingViewController.h"
#import "YUFoldingTableView.h"
#import "YUTestViewController.h"
#import "YUCustomTestController.h"
@interface FoldingViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, assign) YUFoldingSectionHeaderArrowPosition arrowPosition;
@end

@implementation FoldingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"折叠效果列表";
    
    // 创建tableView
    [self setupTableView];
    // Do any additional setup after loading the view.
}
// 创建tableView
- (void)setupTableView
{
    
    CGFloat topHeight = [[UIApplication sharedApplication] statusBarFrame].size.height + 44;
    UITableView *tableView = [[YUFoldingTableView alloc] initWithFrame:CGRectMake(0, topHeight, self.view.bounds.size.width, self.view.bounds.size.height - topHeight)];
    _tableView = tableView;
    tableView.rowHeight = 50;
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *tempStr = @"默认关闭";
    switch (indexPath.row) {
        case 0:
            tempStr = @"默认关闭";
            break;
        case 1:
            tempStr = @"默认展开";
            break;
        case 2:
            tempStr = @"展开第一个";
            break;
        case 3:
            tempStr = @"自定义 sectionHeaderView";
            break;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试 %ld (%@)",indexPath.row + 1, tempStr];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    YUTestViewController *testVc = nil;
    if (indexPath.row < 3) {
        testVc = [[YUTestViewController alloc] init];
        testVc.index = indexPath.row;
    } else {
        testVc = [[YUCustomTestController alloc] init];
    }
    testVc.title = cell.textLabel.text;
    testVc.arrowPosition = indexPath.row;
    [self.navigationController pushViewController:testVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
