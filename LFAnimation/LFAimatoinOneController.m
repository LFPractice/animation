//
//  LFAimatoinOneController.m
//  LFAnimation
//
//  Created by 王林芳 on 2019/12/12.
//  Copyright © 2019 王林芳. All rights reserved.
//

#import "LFAimatoinOneController.h"
#import "LFBottomTab.h"
@interface LFAimatoinOneController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@property (nonatomic, strong) UIButton *button3;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LFBottomTab *bottomTab;
@end

@implementation LFAimatoinOneController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    
}

- (void)createUI {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomTab];
    
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 100) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (LFBottomTab *)bottomTab {
    if (!_bottomTab) {
        _bottomTab = [[LFBottomTab alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 100) / 2, [UIScreen mainScreen].bounds.size.height - 100, 100, 100)];
        _bottomTab.bottomTabStatus = BottomTabStatusSelected;
        
        __weak typeof(self)weakSelf = self;
        _bottomTab.scrollToTop = ^{
            CGPoint point = weakSelf.tableView.contentOffset;
            point.y = -60;
            [weakSelf.tableView setContentOffset:point animated:YES];
        };
    }
    return _bottomTab;
}

#pragma mark ------ UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellName = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell:%@",@(indexPath.row)];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat height = scrollView.contentOffset.y;
    
    if (height > 100) {
        self.bottomTab.bottomTabStatus = BottomTabStatusShowTop;
    } else {
        self.bottomTab.bottomTabStatus = BottomTabStatusSelected;
    }
}

#pragma mark ------ UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
