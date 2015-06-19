//
//  CMyReviewOrderViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyReviewOrderViewController.h"

#import "CMyNetWorkInterface.h"


@interface CMyReviewOrderViewController ()

@end



@implementation CMyReviewOrderViewController

-(instancetype) initWithItem:(BOOL)bcreatebt info:(NSDictionary*)dicinfo
{
    pdicinfo = [ [NSMutableDictionary alloc] initWithDictionary:dicinfo ];
    
    sstatus = [ NSString stringWithFormat:@"%@", [pdicinfo objectForKey:@"status"] ];
    if ([sstatus isEqualToString:@"start"])
    {//发起状态
        sright = [ NSString stringWithFormat:@"%@", @"取消" ];
    }
    else if([sstatus isEqualToString:@"waiting"])
    {//等待用户确认
        sright = [ NSString stringWithFormat:@"%@", @"取消" ];
    }
    else if([sstatus isEqualToString:@"ready"])
    {//双方确认结束
        sright = [ NSString stringWithFormat:@"%@", @"开始" ];
    }
    else if([sstatus isEqualToString:@"begin"])
    {//开始施工
        sright = [ NSString stringWithFormat:@"%@", @"结束" ];
    }
    else
    {
        sright = [ NSString stringWithFormat:@"%@", @"" ];
        bcreatebt = NO;
    }
/*    else if([sstatus isEqualToString:@"finish"])
    {//施工结束
        sright = [ NSString stringWithFormat:@"%@", @"" ];
    }
    else if([sstatus isEqualToString:@"cancel"])
    {//用户取消
        sright = [ NSString stringWithFormat:@"%@", @"" ];
    }
    else if([sstatus isEqualToString:@"other_worker"])
    {//其他工人施工
        sright = [ NSString stringWithFormat:@"%@", @"" ];
    }
    else if([sstatus isEqualToString:@"time_out"])
    {//过期了，还没做
        sright = [ NSString stringWithFormat:@"%@", @"" ];
    }
    */

    return [ self initWithItem:bcreatebt ];
}

-(instancetype) initWithItem:(BOOL)bcreatebt
{
    self = [ super initWithItem:bcreatebt ];
    
    return self;
}

-(void) lineview
{
    UIScrollView* pview = [ [UIScrollView alloc] init ];
    self.view = pview;
    [ pview setBackgroundColor:[ UIColor whiteColor ] ];
    
    NSInteger lx = 10;
    NSInteger ly = 10;
    
    NSInteger lrest = 5;
    
    NSInteger ltableheight = 300;
    NSInteger ltablewidth = ScreenWidth-10*2;
    
    NSInteger lwidthlable = ltablewidth;
    NSInteger lheightlable = 30;

    if ([sstatus isEqualToString:@"waiting"])
    {
        pworkers = [ [NSArray alloc] initWithArray:[ pdicinfo objectForKey:@"workers" ] ];
        if (pworkers.count > 0)
        {
            CGRect tabvrect = CGRectMake(lx, ly, ltablewidth, ltableheight);
            ptableview = [ [UITableView alloc] initWithFrame:tabvrect ];
            [ ptableview setDelegate:self ];
            [ ptableview setDataSource:self ];
            [ self.view addSubview:ptableview ];
            
            ly = ly + tabvrect.size.height + lrest;
        }
    }
    
    CGRect timerect = CGRectMake(lx, ly, lwidthlable, lheightlable);
    plabletime = [ [UILabel alloc] initWithFrame:timerect ];
    NSString* stime = [ NSString stringWithFormat:@"%@ %@-%@", [pdicinfo objectForKey:@"date"], [pdicinfo objectForKey:@"start_time"], [pdicinfo objectForKey:@"end_time"] ];
    [ plabletime setText:stime ];
    [ self.view addSubview:plabletime ];
    ly = ly + lheightlable + lrest;
    
    CGRect addresrect = CGRectMake(lx, ly, lwidthlable, lheightlable);
    plableaddress = [ [UILabel alloc] initWithFrame:addresrect ];
    NSString* saddress = [ NSString stringWithFormat:@"%@", [pdicinfo objectForKey:@"address"] ];
    [ plableaddress setText:saddress ];
    [ self.view addSubview:plableaddress ];
    ly = ly + lheightlable + lrest;
    
    CGRect productrect = CGRectMake(lx, ly, lwidthlable, lheightlable);
    plableproduct = [ [UILabel alloc] initWithFrame:productrect ];
    NSDictionary* pproduct = (NSDictionary*)[ pdicinfo objectForKey:@"product"];
    NSString* sproduct = [ NSString stringWithFormat:@"产品：%@", [pproduct objectForKey:@"name"] ];
    [ plableproduct setText:sproduct ];
    [ self.view addSubview:plableproduct ];
    ly = ly + lheightlable + lrest;

    CGRect servicerect = CGRectMake(lx, ly, lwidthlable, lheightlable);
    plableservice = [ [UILabel alloc] initWithFrame:servicerect ];
    NSDictionary* pservice = (NSDictionary*)[ pdicinfo objectForKey:@"service"];
    NSString* sservice = [ NSString stringWithFormat:@"服务：%@", [pservice objectForKey:@"name"] ];
    [ plableservice setText:sservice ];
    [ self.view addSubview:plableservice ];
    ly = ly + lheightlable + lrest;
    
}

-(void) ClickWorker:(UIButton*)pbt
{
    NSInteger lindex = pbt.tag-100;
    NSDictionary* pworker = [ pworkers objectAtIndex:lindex ];
    NSLog(@"worker:%@", pworker);
    
    NSString* sworkerid = [ NSString stringWithFormat:@"%@", [ pworker objectForKey:@"id" ] ];
    NSString* sorderid = [ NSString stringWithFormat:@"%@", [ pdicinfo objectForKey:@"id" ] ];

    CMyUserConfirmOrderParaments* pconfirm = [ [CMyUserConfirmOrderParaments alloc] initWithData:sorderid worker:sworkerid ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserConfirmOrder:[ pconfirm GetServerInterfaceParamens ] ];
    CMyServerResultData* presult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ presult GetResult ])
    {
        NSLog(@"confirm order succ");
    }
    else
    {
        NSLog(@"confirm order failed");
    }
    
    [ self.navigationController popToRootViewControllerAnimated:YES ];
}


-(void) ClickRightBt:(UIButton*)pbt
{
    if ([sstatus isEqualToString:@"start"])
    {//发起状态
        [ self CancelOrder ];
//        sright = [ NSString stringWithFormat:@"%@", @"取消" ];
    }
    else if([sstatus isEqualToString:@"waiting"])
    {//等待用户确认
        [ self CancelOrder ];
//        sright = [ NSString stringWithFormat:@"%@", @"取消" ];
    }
    else if([sstatus isEqualToString:@"ready"])
    {//双方确认结束
        [ self BeginOrder ];
//        sright = [ NSString stringWithFormat:@"%@", @"开始" ];
    }
    else if([sstatus isEqualToString:@"begin"])
    {//开始施工
        [ self EndOrder ];
//        sright = [ NSString stringWithFormat:@"%@", @"结束" ];
    }
    else
    {
        ;//sright = [ NSString stringWithFormat:@"%@", @"" ];
    }
    return;
}


-(void) CancelOrder
{
    NSString* smobile = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserphone ] ];
    NSString* stype = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserphone ] ];
    NSString* stoken = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserphone ] ];
    NSString* sorderid = [ NSString stringWithFormat:@"%@", [ pdicinfo objectForKey:@"id" ] ];
    
    CMyUserCancelOrderParaments* pcancelparaments = [ [CMyUserCancelOrderParaments alloc] initWithdata:smobile type:stype token:stoken id:sorderid ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserCancelOrder:[ pcancelparaments GetServerInterfaceParamens ] ];
    CMyServerResultData* presult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([presult GetResult])
    {
        NSLog(@"cancel order succ");
    }
    else
    {
        NSLog(@"cancel order failed");
    }
    
    [ self.navigationController popViewControllerAnimated:YES ];
}

-(void) BeginOrder
{
    NSString* orderid = [ NSString stringWithFormat:@"%@", [pdicinfo objectForKey:@"id"] ];
    CMyBeginOrderParaments* pbeginparaments = [ [CMyBeginOrderParaments alloc] initWithData:orderid ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserOrderBegin:[ pbeginparaments GetServerInterfaceParamens ] ];
    CMyServerResultData* presult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([presult GetResult])
    {
        NSLog(@"begin order succ");
    }
    else
    {
        NSLog(@"begin order failed");
    }

}

-(void) EndOrder
{
    NSString* orderid = [ NSString stringWithFormat:@"%@", [pdicinfo objectForKey:@"id"] ];
    CMyFinishOrderParaments* pfinsihorder = [ [CMyFinishOrderParaments alloc] initWithData:orderid ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserOrderFinish:[ pfinsihorder GetServerInterfaceParamens ] ];
    CMyServerResultData* presult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([presult GetResult])
    {
        NSLog(@"finish order succ");
    }
    else
    {
        NSLog(@"finish order failed");
    }
    
    [ self.navigationController popToRootViewControllerAnimated:YES ];
}


-(void) setorderinfo:(NSDictionary*)dicinfo
{
    pdicinfo = [ [NSMutableDictionary alloc] initWithDictionary:dicinfo ];
    
    [ self lineview ];
}

-(void) viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
    
    CGRect arect3 = CGRectMake(0, 0, ScreenWidth, ContentviewHeight);
    self.view.frame = arect3;
    [self.view setBackgroundColor:[ UIColor grayColor ]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ self lineview ];
    // Do any additional setup after loading the view.
}

-(void) viewWillDisappear:(BOOL)animated
{
    [ super viewWillDisappear:animated ];
    
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString * const kCellIdentifier = @"workerCell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    NSDictionary* pwoker = [ pworkers objectAtIndex:indexPath.row ];
    NSString* simagename = [ NSString stringWithFormat:@"%@", [ pwoker objectForKey:@"id" ] ];
    NSString* sworkername = [ NSString stringWithFormat:@"%@", [ pwoker objectForKey:@"name" ] ];
    NSInteger lstarts   = [[ NSString stringWithFormat:@"%@", [ pwoker objectForKey:@"star" ] ] integerValue];
    NSString* startdesc = [ NSString stringWithFormat:@"%ld 星", lstarts ];
    
    if (![ [CMyLocalDatas SharedLocalDatas] isExistAnImage:simagename ])
    {
        simagename = [ NSString stringWithFormat:@"%@", USER_DEFAULT_IMAGE ];
    }
    
    simagename = [ NSString stringWithFormat:@"%@", USER_DEFAULT_IMAGE ];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
        CGRect arect = CGRectMake(2, 2, cell.contentView.frame.size.width-2*2, cell.contentView.frame.size.height-2*2);
        
        CGRect imagerect = CGRectMake(5, 2, arect.size.height-2*2, arect.size.height-2*2);
        UIImageView* pimageview = [ [UIImageView alloc] initWithFrame:imagerect ];
        [ cell.contentView addSubview:pimageview ];
        [ pimageview setImage:[ UIImage imageNamed:simagename ] ];
        [ pimageview setTag:100 ];
        
        CGRect namerect = CGRectMake(imagerect.origin.x + imagerect.size.width + 20, 5, 100, 15);
        UILabel* pusername = [ [UILabel alloc] initWithFrame:namerect ];
        [ cell.contentView addSubview:pusername ];
        [ pusername setText:[ NSString stringWithString:sworkername] ];
        [ pusername setTextAlignment:NSTextAlignmentLeft ];
        [ pusername setTag:101 ];
        
        CGRect startrect = CGRectMake(namerect.origin.x+namerect.size.width+10, namerect.origin.y , 80, namerect.size.height);
        UILabel* pstartdesc = [ [UILabel alloc] initWithFrame:startrect ];
        [ cell.contentView addSubview:pstartdesc ];
        [ pstartdesc setText:[ NSString stringWithString:startdesc ] ];
        [ pstartdesc setTextAlignment:NSTextAlignmentLeft ];
        [ pstartdesc setTag:103 ];
        
        CGRect btrect = CGRectMake(startrect.origin.x+startrect.size.width+5, arect.size.height*0.5-15, 70, 30);
        UIButton*   pbt = [ [UIButton alloc] initWithFrame:btrect ];
        [ cell.contentView addSubview:pbt ];
        [ pbt setTag:indexPath.row+100 ];
        [ pbt setTitle:@"选她" forState:UIControlStateNormal ];
        [ pbt setTintColor:[ UIColor blackColor ] ];
        [ pbt setBackgroundColor:[ UIColor grayColor ] ];
        [ pbt addTarget:self action:@selector(ClickWorker:) forControlEvents:UIControlEventTouchDown];
    }
    else
    {
        UIImageView* pcellview = (UIImageView*)[ cell.contentView viewWithTag:100 ];
        [ pcellview setImage:[ UIImage imageNamed:simagename ] ];
        
        UILabel* username = (UILabel*)[ cell.contentView viewWithTag:101 ];
        [ username setText:[ NSString stringWithString:sworkername ] ];
        
        UILabel* pstartdesc = (UILabel*)[ cell.contentView viewWithTag:103 ];
        [ pstartdesc setText:[ NSString stringWithString:startdesc ] ];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return pworkers.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger lheight = 80;
    return lheight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ;
}



@end
