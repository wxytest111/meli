//
//  MainViewControler.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "MainViewControler.h"

#import "BaseNavigationViewController.h"

#import "CMyUserInfoViewController.h"
#import "CMyUserDefaultViewControler.h"
#import "CMyUserHistoryViewControler.h"
#import "CMyUserWorkerViewController.h"

#import "CMyUserLoginView.h"


#import "CMyContendViewController.h"
#import "CMyWorkerInfoViewController.h"
#import "CMyWorkerOrderListViewController.h"


#import "CMyWorkerDefaultViewController.h"


#import "UIViewExt.h"

#import "CMyLocalDatas.h"

#import "CMyTableView.h"



@interface MainViewControler ()

@end

@implementation MainViewControler

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ self.view setBackgroundColor:[ UIColor clearColor ] ];
    
#if (__TYPE__==__USER__)
    [ self loaduserallcontrolerview ];
    [ self lineusercustomtablebarview ];
#else if (__TYPE__==__WORKER__)
    [ self loadworkerallcontrolview ];
    [ self lineworkercustomtablebarview ];
#endif

    return ;
}

- (void)viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
    
    NSString* suserid = [ [CMyLocalDatas SharedLocalDatas] getlocaluserid ];
    NSInteger ltype = [ [CMyLocalDatas SharedLocalDatas] getlocalusertype ];
    if (suserid==nil || ltype == USER_TYPE_OTHER)
    {
        [ self showuserloginview ];
        return;
    }
}

-(void) showuserloginview
{
    [ self setSelectedIndex:3 ];
}

// 排布工人界面
-(void) lineworkercustomtablebarview
{
    CGRect arect = self.view.frame;
    
    NSInteger lheightbbg = TablebarHeight+1;
    NSInteger ly = arect.size.height-lheightbbg;
    NSInteger lwidthbbg = arect.size.width;
    
    m_tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(arect.origin.x, ly, lwidthbbg, lheightbbg)];
    m_tabBarBG.userInteractionEnabled = YES;
    m_tabBarBG.image = [UIImage imageNamed:@"tab_bg_all"];
    [self.view addSubview:m_tabBarBG];
    
    NSInteger lwidth    = Tabbaritemwidth;
    NSInteger lheight   = TablebarHeight+1;
    
    // 选中视图
    m_selectView = [[UIImageView alloc] initWithFrame:CGRectMake(Tarbaritemrest, 0, lwidth, lheight)];
    m_selectView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [m_tabBarBG addSubview:m_selectView];
    
    // 整理数据
    NSArray *imgs   = @[@"msg_new", @"msg_new", @"msg_new", @"msg_new"];
    NSArray *titles = @[@"首页", @"抢单", @"历史", @"用户"];
    
    NSInteger x = Tarbaritemrest;
    for (int index = 0; index < titles.count; index++)
    {
        
        ItemView *itemView = [[ItemView alloc] initWithFrame:CGRectMake(x, 0, lwidth, lheight)];
        
        [ itemView setTag:index ];
        [ itemView setDelegateItemView:self ];
        [ itemView.itemImage setImage:[ UIImage imageNamed:imgs[index] ] ];
        [ itemView.title setText:titles[index] ];
        
        [ m_tabBarBG addSubview:itemView ];
        
        x = x + lwidth;
    }

}

-(void) loadworkerallcontrolview
{
//    BOOL bcreate = [ [CMyLocalDatas SharedLocalDatas] getlocallogined ];
    
    // 首页
    CMyWorkerDefaultViewController* firstviewViewController = [[CMyWorkerDefaultViewController alloc] init];
    BaseNavigationViewController* firstviewNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:firstviewViewController];

    // 抢单
    CMyContendViewController* contendViewController = [[CMyContendViewController alloc] init];
    BaseNavigationViewController* contendviewNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:contendViewController];

    // 技师
    CMyWorkerOrderListViewController* workerorderlistViewController = [[CMyWorkerOrderListViewController alloc] init];
    BaseNavigationViewController* workerorderlistNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:workerorderlistViewController];
    
    // 工人信息
    CMyWorkerInfoViewController* workerinfoViewController = [[CMyWorkerInfoViewController alloc] init];
    BaseNavigationViewController* workerinfoNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:workerinfoViewController];
    
    NSArray *viewControllers = @[firstviewNavigation, contendviewNavigation, workerorderlistNavigation, workerinfoNavigation];
    [self setViewControllers:viewControllers animated:YES];
}

// 排布用户界面
-(void) lineusercustomtablebarview
{
    CGRect arect = self.view.frame;
    
    NSInteger lheightbbg = TablebarHeight+1;
    NSInteger ly = arect.size.height-lheightbbg;
    NSInteger lwidthbbg = arect.size.width;
    
    m_tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(arect.origin.x, ly, lwidthbbg, lheightbbg)];
    m_tabBarBG.userInteractionEnabled = YES;
    m_tabBarBG.image = [UIImage imageNamed:@"tab_bg_all"];
    [self.view addSubview:m_tabBarBG];
    
    NSInteger lwidth    = Tabbaritemwidth;
    NSInteger lheight   = TablebarHeight+1;
    
    // 选中视图
    m_selectView = [[UIImageView alloc] initWithFrame:CGRectMake(Tarbaritemrest, 0, lwidth, lheight)];
    m_selectView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [m_tabBarBG addSubview:m_selectView];
    
    // 整理数据
    NSArray *imgs   = @[@"msg_new", @"msg_new", @"msg_new", @"msg_new"];
    NSArray *titles = @[@"首页", @"工人", @"历史", @"用户"];
    
    NSInteger x = Tarbaritemrest;
    for (int index = 0; index < titles.count; index++)
    {
        
        ItemView *itemView = [[ItemView alloc] initWithFrame:CGRectMake(x, 0, lwidth, lheight)];
        
        [ itemView setTag:index ];
        [ itemView setDelegateItemView:self ];
        [ itemView.itemImage setImage:[ UIImage imageNamed:imgs[index] ] ];
        [ itemView.title setText:titles[index] ];
        
        [ m_tabBarBG addSubview:itemView ];
        
        x = x + lwidth;
    }
}

-(void) loaduserallcontrolerview
{
    BOOL bcreate = [ [CMyLocalDatas SharedLocalDatas] getlocallogined ];
    
    // 首页
    CMyUserDefaultViewControler* firstviewViewController = [[CMyUserDefaultViewControler alloc] init];
    BaseNavigationViewController* firstviewNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:firstviewViewController];
    
    // 技师
    CMyUserWorkerViewController* workerlistViewController = [[CMyUserWorkerViewController alloc] init];
    BaseNavigationViewController* workerlistNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:workerlistViewController];
    
    // 我的订单
    CMyUserHistoryViewControler* historyorderViewController = [[CMyUserHistoryViewControler alloc] initWithItem:bcreate];
    BaseNavigationViewController* historyorderNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:historyorderViewController];
    
    // 更多
    CMyUserInfoViewController* userinfoViewController = [[CMyUserInfoViewController alloc] initWithItem:bcreate];
    BaseNavigationViewController* userinfoNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:userinfoViewController];
    
    NSArray *viewControllers = @[firstviewNavigation, workerlistNavigation, historyorderNavigation, userinfoNavigation];
    [self setViewControllers:viewControllers animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public Method
- (void)showOrHiddenTabBarView:(BOOL)isHidden
{
    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:0.33];
    if (isHidden)
    {
        m_tabBarBG.left = -380;
    }
    else
    {
        m_tabBarBG.left = 0;
    }
    [UIView commitAnimations];
}

#pragma mark - ItemView Delegate
- (void)didItemView:(ItemView *)itemView atIndex:(NSInteger)index
{
    if (![ [CMyLocalDatas SharedLocalDatas] getlocallogined ])
    {
        if( index == 1 || index == 2 )
        {
            return;
        }
    }

    CGRect arect = m_selectView.frame;
    CGRect arect2 = CGRectMake(Tarbaritemrest + Tabbaritemwidth*index, arect.origin.y, Tabbaritemwidth-Tarbaritemrest*2, arect.size.height);
    
    [UIView beginAnimations:nil context:NULL];
    m_selectView.frame = arect2;
    [UIView commitAnimations];
    self.selectedIndex = index;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
