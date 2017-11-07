//
//  ViewController.m
//  AutoStatusDemo
//
//  Created by Maple on 2017/11/7.
//  Copyright © 2017年 Maple. All rights reserved.
//  本demo用于展示主页statusBar颜色改变的情况
//

#import "ViewController.h"
#import "UIImage+Color.h"

#define kNavigationHeight      64
#define kScreenWidth           [UIScreen mainScreen].bounds.size.width
#define kScreenHeight          [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, assign)NSInteger                   offset;
@property(nonatomic, weak)UITableView*                  tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

-(void)configUI{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -kNavigationHeight, kScreenWidth, kScreenHeight+kNavigationHeight)];//注意这里frame的设置
    
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [tableView setBounces:NO];  //禁止弹效果
    [self.view addSubview:tableView];
    _tableView = tableView;
    [self createTableHeaderView];
    
    self.navigationItem.title = @"导航栏标题";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(go)];
    
    //初始时设置导航栏透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

- (void)createTableHeaderView{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300)];
    [imageView setImage:[UIImage imageNamed:@"Ima"]];
    self.tableView.tableHeaderView = imageView;
}


#pragma mark --dataSource代理

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%lu行",indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark -- scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset=scrollView.contentOffset.y;
    self.offset = offset; //赋给全局，用户status判断
    if (offset< 0) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    }else{
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(200, 100)] forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];
    }
    [self setNeedsStatusBarAppearanceUpdate];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.offset <0) {
        return UIStatusBarStyleLightContent;
    }
    return UIStatusBarStyleDefault;
}

//设置效果
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}

@end
