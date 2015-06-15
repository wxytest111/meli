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

#import "UIViewExt.h"

#import "CMyLocalDatas.h"

#import "CMyTableView.h"



@interface MainViewControler ()

@end

@implementation MainViewControler

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
//    {
//        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all"] forBarMetrics:UIBarMetricsDefault];
//    }
    
    [ self.view setBackgroundColor:[ UIColor clearColor ] ];
    
    if( 0 )
    {
        [ self loadworkerallcontrolview ];
        [ self lineworkercustomtablebarview ];
        return;
    }
    
    NSString* suserid = [ [CMyLocalDatas SharedLocalDatas] getlocaluserid ];
    if (suserid==nil)
    {
        [ self loaduserallcontrolerview ];
        [ self lineusercustomtablebarview ];
        return;
    }
    
    NSInteger ltype = [ [CMyLocalDatas SharedLocalDatas] getlocalusertype ];
    
    ltype = USER_TYPE_WORKER;
    switch (ltype)
    {
        case USER_TYPE_TEMP:
        case USER_TYPE_NORMAL:
        {
            [ self loaduserallcontrolerview ];
            [ self lineusercustomtablebarview ];
            break;
        }
        case USER_TYPE_WORKER:
        {
            [ self loadworkerallcontrolview ];
            [ self lineworkercustomtablebarview ];
            break;
        }
        default:
        {
            [ self loaduserallcontrolerview ];
            [ self lineusercustomtablebarview ];
            break;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
//    return;
    
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
    /*
    CGRect arect = [ [UIScreen mainScreen] bounds ];
    
    NSInteger lheight = arect.size.height;
    NSInteger lwidth = arect.size.width;
    
    NSInteger ltabheight = 50;
    NSInteger ltabwidth = 50;
    CGRect arect2 = CGRectMake(0, lheight-ltabheight, lwidth, ltabheight);
    
    NSArray *imgs   = @[@"custom", @"list", @"user"];
    NSArray *titles = @[@"抢单", @"我的预约", @"用户"];
    NSMutableArray* parray = [ [NSMutableArray alloc] init ];
    for (NSInteger i = 0; i < imgs.count; i++)
    {
        NSMutableDictionary* pdic = [ [NSMutableDictionary alloc] init ];
        [ pdic setObject:imgs[i]    forKey:@"image" ];
        [ pdic setObject:titles[i]  forKey:@"title" ];
        [ parray addObject:pdic ];
    }
    
    CMyTableView* ptableview = [ [CMyTableView alloc] initWithdata:arect2 data:parray ];
    [ self.view addSubview:ptableview ];
    [ ptableview setTableviewdelegate:self ];
    [  ptableview setDefaultSelected:0];
    
    return;
    */
    
    CGRect arect = [ [UIScreen mainScreen] bounds ];
    
    NSInteger lheight = arect.size.height;
    NSInteger lwidth = arect.size.width;
    
    NSInteger ltabheight = 50;
    NSInteger ltabwidth = 50;

    NSInteger lselectframe = 2;
    NSInteger lselectspace = 15;
    
    if (1)
    {
        
        m_tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, lheight-ltabheight, lwidth, ltabheight)];
        m_tabBarBG.userInteractionEnabled = YES;
        m_tabBarBG.image = [UIImage imageNamed:@"tab_bg_all"];
        [self.view addSubview:m_tabBarBG];
        
        // 整理数据
        NSArray *imgs   = @[@"custom", @"list", @"user"];
        NSArray *titles = @[@"抢单", @"我的预约", @"用户"];

        lawidth = (lwidth-2*lselectspace-titles.count*ltabwidth)/(titles.count-1);

        // 选中视图
        m_selectView = [[UIImageView alloc] initWithFrame:CGRectMake(lselectspace, m_tabBarBG.height-lselectframe , lawidth, ltabheight-lselectframe*2)];
        m_selectView.image = [UIImage imageNamed:@"background_blue"];
        [m_tabBarBG addSubview:m_selectView];
        
        

        NSInteger x = lselectspace;
        for (int index = 0; index < titles.count; index++)
        {
            CGRect arect = CGRectMake(x, lselectframe, ltabwidth, ltabheight-lselectframe*2);
            
            ItemView *pitemView = [[ItemView alloc] initWithFrame:arect];
            pitemView.tag = index;
            [ pitemView setDelegateItemView:self ];
            [ pitemView.itemImage setImage:[ UIImage imageNamed:imgs[index] ] ];
            pitemView.title.text = titles[index];
            [m_tabBarBG addSubview:pitemView];
            x += lawidth;
        }
    }
}

-(void) loadworkerallcontrolview
{
    // 抢单
    CMyContendViewController* contendViewController = [[CMyContendViewController alloc] init];
    BaseNavigationViewController* contendviewNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:contendViewController];
    [contendviewNavigation setDelegate:self];

    // 技师
    CMyWorkerOrderListViewController* workerorderlistViewController = [[CMyWorkerOrderListViewController alloc] init];
    BaseNavigationViewController* workerorderlistNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:workerorderlistViewController];
    [workerorderlistNavigation setDelegate:self];
    
    // 工人信息
    CMyWorkerInfoViewController* workerinfoViewController = [[CMyWorkerInfoViewController alloc] init];
    BaseNavigationViewController* workerinfoNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:workerinfoViewController];
    [workerinfoNavigation setDelegate:self];
        
    NSArray *viewControllers = @[contendviewNavigation, workerorderlistNavigation, workerinfoNavigation];
    [self setViewControllers:viewControllers animated:YES];
}

// 排布用户界面
-(void) lineusercustomtablebarview
{
   /*
    CGRect arect = [ [UIScreen mainScreen] bounds ];
    
    NSInteger lheight = arect.size.height;
    NSInteger lwidth = arect.size.width;
    
    NSInteger ltabheight = 50;
    NSInteger ltabwidth = 50;
    CGRect arect2 = CGRectMake(0, lheight-ltabheight, lwidth, ltabheight);
    
    NSArray *imgs   = @[@"tuijian", @"worker", @"list", @"user"];
    NSArray *titles = @[@"推荐", @"技师", @"我的预约", @"用户" ];
    NSMutableArray* parray = [ [NSMutableArray alloc] init ];
    for (NSInteger i = 0; i < imgs.count; i++)
    {
        NSMutableDictionary* pdic = [ [NSMutableDictionary alloc] init ];
        [ pdic setObject:imgs[i]    forKey:@"image" ];
        [ pdic setObject:titles[i]  forKey:@"title" ];
        [ parray addObject:pdic ];
    }
    
    CMyTableView* ptableview = [ [CMyTableView alloc] initWithdata:arect2 data:parray ];
    [ self.view addSubview:ptableview ];
    [ ptableview setTableviewdelegate:self ];
    [  ptableview setDefaultSelected:0];
    
    return;
    */
 
    CGRect arect = [ [UIScreen mainScreen] bounds ];
    NSInteger lheight = arect.size.height;
    NSInteger lwidth = arect.size.width;
    
    NSInteger ltabheight = 50;
    NSInteger ltabwidth = 50;
    
    NSInteger lselectframe = 2;
    NSInteger lselectspace = 15;
    
    if (1)
    {
        m_tabBarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, lheight-ltabheight, lwidth, ltabheight)];
        m_tabBarBG.userInteractionEnabled = YES;
        m_tabBarBG.image = [UIImage imageNamed:@"tab_bg_all"];
        [self.view addSubview:m_tabBarBG];
        
        // 整理数据
        NSArray *imgs   = @[@"tuijian", @"worker", @"list", @"user"];
        NSArray *titles = @[@"推荐", @"技师", @"我的预约", @"用户" ];
        
        lawidth = lwidth/titles.count;
        lawidth = 95;
        // 选中视图
        m_selectView = [[UIImageView alloc] initWithFrame:CGRectMake(lselectspace, m_tabBarBG.height-lselectframe , lawidth, ltabheight-lselectframe*2)];
        m_selectView.image = [UIImage imageNamed:@"background_blue"];
//        [m_tabBarBG addSubview:m_selectView];
        
        NSInteger x = lselectspace;
        for (int index = 0; index < titles.count; index++)
        {
            CGRect arect = CGRectMake(x, lselectframe, ltabwidth, ltabheight-lselectframe*2);
            ItemView *pitemView = [[ItemView alloc] initWithFrame:arect];
            pitemView.tag = index;
            [ pitemView setDelegateItemView:self ];
            [ pitemView.itemImage setImage:[ UIImage imageNamed:imgs[index] ] ];
            pitemView.title.text = titles[index];
            [m_tabBarBG addSubview:pitemView];
            x = x + lawidth;
        }
    }
    
}

-(void) loaduserallcontrolerview
{
    // 首页
    CMyUserDefaultViewControler* firstviewViewController = [[CMyUserDefaultViewControler alloc] init];
    BaseNavigationViewController* firstviewNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:firstviewViewController];
    [firstviewNavigation setDelegate:self];
    
    // 技师
    CMyUserWorkerViewController* workerlistViewController = [[CMyUserWorkerViewController alloc] init];
    BaseNavigationViewController* workerlistNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:workerlistViewController];
    [workerlistNavigation setDelegate:self];
    
    // 我的订单
    CMyUserHistoryViewControler* historyorderViewController = [[CMyUserHistoryViewControler alloc] init];
    BaseNavigationViewController* historyorderNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:historyorderViewController];
    [historyorderNavigation setDelegate:self];
    
    // 更多
    CMyUserInfoViewController* userinfoViewController = [[CMyUserInfoViewController alloc] init];
    BaseNavigationViewController* userinfoNavigation = [[BaseNavigationViewController alloc] initWithRootViewController:userinfoViewController];
    [userinfoNavigation setDelegate:self];
    
    NSArray *viewControllers = @[firstviewNavigation, workerlistNavigation, historyorderNavigation, userinfoNavigation];
    [self setViewControllers:viewControllers animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
//    [viewController viewWillAppear:animated];
}

#pragma mark - MyTableViewDelegate
- (void)didItemView:(NSInteger)index
{
    self.selectedIndex = index;
}

#pragma mark - ItemView Delegate
- (void)didItemView:(ItemView *)itemView atIndex:(NSInteger)index
{
    CGRect arect = m_selectView.frame;
    
    [UIView beginAnimations:nil context:NULL];
    m_selectView.frame = CGRectMake(15 + lawidth*index, arect.origin.y, lawidth, arect.size.height);
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
