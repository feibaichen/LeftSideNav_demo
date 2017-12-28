//
//  TestViewController.m
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/11/3.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import "MainViewController.h"
#import "YSHYSlideViewController.h"
#import "OtherViewController.h"
#import "MysimpleTableViewCell.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_dataArray;
}
@end

@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.customNav.hidden = NO;
    [self.customNav setNavTitle:@"主页面"];
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame=CGRectMake(0, 0, 30, 30);
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"header.png"] forState:UIControlStateNormal];
    [self.customNav setLeftNavButton:leftBtn];
    
    
//    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [Btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [Btn setFrame:CGRectMake(100, 150, 50, 40)];
//    [Btn setBackgroundColor:[UIColor redColor]];
//    [self.view addSubview:Btn];
    
    
    
    _dataArray=@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",@"8.jpg"];
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64) style:UITableViewStylePlain];
    
    [_tableView registerNib:[UINib nibWithNibName:@"MysimpleTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellid"];
    _tableView.dataSource=self;
    
    _tableView.delegate=self;
    
    [self.view addSubview:_tableView];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    MyPlayerViewController * player=[MyPlayerViewController new];
//    [self.navigationController pushViewController:player animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MysimpleTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MysimpleTableViewCell" owner:self options:nil]lastObject];
    }
    
    cell.movieImage.image=[UIImage imageNamed:_dataArray[indexPath.row]];
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[YSHYSlideViewController shareInstance] addGesture];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[YSHYSlideViewController shareInstance] removeAllGesture];
}

-(void)leftBtnClick:(UIButton *)button
{
    [[YSHYSlideViewController shareInstance]SwitchMenuState];
}

-(void)BtnClick:(UIButton *)button
{
    OtherViewController * VC = [[OtherViewController alloc]init];
    [VC.view setBackgroundColor:[UIColor redColor]];
    [self.navigationController pushViewController:VC animated:YES];

}


@end
