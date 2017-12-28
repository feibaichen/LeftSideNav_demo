//
//  LeftController.m
//  YSHYSlideController
//
//  Created by 杨淑园 on 15/10/30.
//  Copyright © 2015年 yangshuyaun. All rights reserved.
//

#import "LeftMenuController.h"
#import "YSHYSlideViewController.h"
#import "OtherViewController.h"
#import "MyFootView.h"
#import "MyHeaderView.h"
#import "UIButton+ImageTitleSpacing.h"
#define cellHeight   50

@interface LeftMenuController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIImageView * headIcon;
    UILabel * nameLable;
    UILabel * infoLable;
    
    UIButton * setBTN;
}
@end

@implementation LeftMenuController


-(instancetype)init{

    self=[super init];
    
    if (self) {
        
        headIcon=[[UIImageView alloc]init];
        nameLable=[[UILabel alloc]init];
        infoLable=[[UILabel alloc]init];
        setBTN=[[UIButton alloc]init];
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view  setBackgroundColor:[UIColor redColor]];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"guangdian.jpg"]];
    
    
    
    setBTN.frame=CGRectMake(30, kScreenHeight-10-25, 80, 25);
    
    [setBTN setImage:[UIImage imageNamed:@"gear"] forState:UIControlStateNormal];
    [setBTN setTitle:@"设置" forState:UIControlStateNormal];
    setBTN.titleLabel.font=[UIFont systemFontOfSize:14];
    [setBTN setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //setBTN.backgroundColor=[UIColor orangeColor];
    [setBTN addTarget:self action:@selector(myset) forControlEvents:UIControlEventTouchUpInside];
    [setBTN layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10.0];
//    [self.view addSubview:setBTN];
    
    self.dataArray=@[@"消息中心",@"皮肤中心",@"会员中心",@"liul包月",@"定时开关",@"蝰蛇音效",@"音乐工具",@"个性彩铃",@"关于我们"];
    //self.imagedataArray=@[@"fruit1",@"fruit2",@"fruit3",@"fruit4",@"fruit5",@"fruit6",@"fruit7",@"fruit8"];
    
    //菜单选项
    self.tableMenu  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-70, self.view.frame.size.height-50)];
    
    NSLog(@"%f=========",self.view.frame.size.height);
    self.tableMenu.delegate = self;
    self.tableMenu.dataSource = self;
    self.tableMenu.showsVerticalScrollIndicator=NO;
    self.tableMenu.showsHorizontalScrollIndicator=NO;
    self.tableMenu.backgroundColor=[UIColor clearColor];
    self.currentIndex = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.view addSubview:self.tableMenu];
    

    
    [self.tableMenu registerClass:[MyHeaderView class] forHeaderFooterViewReuseIdentifier:@"HeaderViewID"];
    [self.tableMenu registerClass:[MyFootView class] forHeaderFooterViewReuseIdentifier:@"FootViewID"];
    
    
    
    //FootViewID
    //覆盖层  选中菜单 回到页面时出现的菜单变暗的效果
    self.coverView = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.coverView setBackgroundColor:[UIColor blackColor]];
    self.coverView.alpha = 0.5;
    [self.view addSubview:self.coverView];
    
    
    [self.view addSubview:setBTN];
}


#pragma  maek - tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    //CGRect frame  = tableView.frame;
   //frame.size.height = cellHeight *row;
    //tableView.frame = frame;
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"CellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    cell.backgroundColor=[UIColor clearColor];
    cell.imageView.image=[UIImage imageNamed:@"playholder"];
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.textColor=[UIColor whiteColor];
    cell.textLabel.font=[UIFont systemFontOfSize:14];
    return  cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    if(indexPath.row == 0)
    {
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"消息中心"];
        [VC.view setBackgroundColor:[UIColor purpleColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
    else if(indexPath.row == 1)
    {
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"皮肤中心"];
        [VC.view setBackgroundColor:[UIColor blueColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
    else if ( indexPath.row == 2)
    {
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"会员中心"];
        [VC.view setBackgroundColor:[UIColor yellowColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
    else if ( indexPath.row == 3)
    {
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"流量包月"];
        [VC.view setBackgroundColor:[UIColor greenColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }else if ( indexPath.row == 4){
        
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"蝰蛇效果"];
        [VC.view setBackgroundColor:[UIColor greenColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    
    }else if ( indexPath.row == 5){
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"音乐工具"];
        [VC.view setBackgroundColor:[UIColor greenColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    
    }else {
    
        OtherViewController * VC = [[OtherViewController alloc]init];
        [VC.customNav setNavTitle:@"个性彩铃"];
        [VC.view setBackgroundColor:[UIColor greenColor]];
        [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  cellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 100;
}
//控制尾部视图的高
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
//这是头部试图的的控件
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    MyHeaderView * header=[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HeaderViewID"];
    
    headIcon.frame=CGRectMake(10, 25, 60, 60);
    headIcon.image=[UIImage imageNamed:@"header.png"];
    [header addSubview:headIcon];
    
    
    nameLable.frame=CGRectMake(headIcon.frame.origin.x+headIcon.frame.size.width+5, 30, 100, 20);
    //nameLable.backgroundColor=[UIColor redColor];
    nameLable.font=[UIFont systemFontOfSize:14];
    nameLable.textColor=[UIColor whiteColor];
    nameLable.text=@"iOS_开发小卒";
    [header addSubview:nameLable];
    
    
    infoLable.frame=CGRectMake(headIcon.frame.origin.x+headIcon.frame.size.width+5, 30+30, 100, 20);
    //infoLable.backgroundColor=[UIColor redColor];
    infoLable.font=[UIFont systemFontOfSize:11];
    infoLable.textColor=[UIColor lightGrayColor];
    infoLable.text=@"简介：这家伙很懒";
    [header addSubview:infoLable];
    
    return header;
}
//这是尾部试图的的控件
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    MyFootView * footer=[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FootViewID"];
    
//    setBTN.frame=CGRectMake(30, kScreenHeight-cellHeight * self.dataArray.count-100-15-25, 80, 25);
//    NSLog(@"%f",footer.frame.size.height);
//    [setBTN setImage:[UIImage imageNamed:@"gear"] forState:UIControlStateNormal];
//    [setBTN setTitle:@"设置" forState:UIControlStateNormal];
//    setBTN.titleLabel.font=[UIFont systemFontOfSize:14];
//    [setBTN setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    //setBTN.backgroundColor=[UIColor orangeColor];
//    [setBTN layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10.0];
    
    //[footer addSubview:setBTN];
    
    return footer;
    
}
//这是尾部试图的背景色
//-(void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
//
//    view.tintColor=[UIColor clearColor];
//}
//这是头部试图的背景色
-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{

    view.tintColor=[UIColor clearColor];
}
-(void)myset{

    OtherViewController * VC = [[OtherViewController alloc]init];
    [VC.customNav setNavTitle:@"个性彩铃"];
    [VC.view setBackgroundColor:[UIColor blackColor]];
    [[YSHYSlideViewController shareInstance] GotoViewController:VC];
    
    
    
    NSLog(@"myset");
}
@end
