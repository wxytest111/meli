//
//  CMyUserHistoryViewControler.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserHistoryViewControler.h"

#import "CMyOrderDetailViewController.h"


#import "CMyReviewOrderViewController.h"
#import "CMyOrderCreateViewController.h"

#import "CMyUserLoadordersParaments.h"
#import "CMyLocalDatas.h"

#import "CMyNetWorkInterface.h"


@interface CMyUserHistoryViewControler ()

@end

@implementation CMyUserHistoryViewControler

#pragma mark - ViewController Life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"我的预约";
    }
    return self;
}

-(instancetype) initWithItem:(BOOL)bcreatebt
{
    self = [ super initWithItem:bcreatebt ];
    
    if (self)
    {
        sright = [ NSString stringWithFormat:@"%@", @"发起" ];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ptableview = [ [UITableView alloc] init ];
    [ ptableview setDataSource:self ];
    [ ptableview setDelegate:self ];
    
    [ ptableview setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine ];
    [ self.view addSubview:ptableview ];
    
    lpage = 1;
    [ self loadorders:1 ];
}

- (void)viewWillAppear:(BOOL)animated
{
    [ptableview setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    [ self loadorders:1 ];
    [ ptableview reloadData ];
}

-(void) loadorders:(NSInteger)page
{
    NSString* userphone = [ [CMyLocalDatas SharedLocalDatas] getlocaluserphone ];
    NSString* usertype = [ [CMyLocalDatas SharedLocalDatas] getlocaluserstype ];
    NSString* stoken = [ [CMyLocalDatas SharedLocalDatas] getlocaltoken ];
    
    CMyUserLoadordersParaments* ploadorderlistparament = [ [CMyUserLoadordersParaments alloc] initWithdata:userphone type:usertype token:stoken page:page ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserOrderlistload:[ ploadorderlistparament GetServerInterfaceParamens ] ];
    CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ pserverresult GetResult])
    {
        NSLog(@"load orders success");
        porderlist = [ [NSMutableArray alloc] initWithArray:(NSArray*)[ pserverresult GetResultData ] ];
        if (porderlist.count > 0)
        {
            lpage++;
        }
        NSLog(@"order list:%@", porderlist);
    }
    else
    {
        NSLog(@"load orders success");
    }
}

-(void) loadorderlist
{
    NSString* simageboy = [ NSString stringWithFormat:@"%@", @"face_boy.png" ];
    NSString* simagegirl = [ NSString stringWithFormat:@"%@", USER_DEFAULT_IMAGE ];
    
    NSString* sstatuswaiting        = [ NSString stringWithFormat:@"%@", @"等待应答" ];
    NSString* sstatuscofirm         = [ NSString stringWithFormat:@"%@", @"确认预约" ];
    NSString* sstatussucc           = [ NSString stringWithFormat:@"%@", @"预约成功" ];
    NSString* sstatusprocessing     = [ NSString stringWithFormat:@"%@", @"正在施工" ];
    NSString* sstatusfinished       = [ NSString stringWithFormat:@"%@", @"施工完成" ];
    
    NSDate* pdate = [ NSDate date ];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    
    porderlist = [ [NSMutableArray alloc] init ];
    for (int i = 0; i < 30; i++)
    {
        NSInteger ltime = random()%1000000;
        NSDate* pdate2 = [ [NSDate alloc] initWithTimeInterval:ltime sinceDate:pdate ];
        NSString *strDate = [dateFormatter stringFromDate:pdate2];
        
        NSMutableDictionary* porder = [ [NSMutableDictionary alloc] init ];
        
        NSString* sorderid      = [ NSString stringWithFormat:@"order%03d", i ];
        NSString* sworkername   = [ NSString stringWithFormat:@"worker%03d", i ];
        NSString* sworkerid     = [ NSString stringWithFormat:@"userid%05d", i];
//        NSString* sordertime    = [ NSString stringWithFormat:@"%@", @"this is a order time" ];
        
        [ porder setObject:sworkername  forKey:@"workername" ];
        [ porder setObject:sorderid     forKey:@"orderid" ];
        [ porder setObject:sworkerid    forKey:@"workerid" ];
        [ porder setObject:strDate      forKey:@"ordertime" ];
        
        if (i%2)
        {
            [ porder setObject:simageboy forKey:@"workerimage" ];
        }
        else
        {
            [ porder setObject:simagegirl forKey:@"workerimage" ];
        }

        
        if (i < 2)
        {
            [ porder setObject:sstatuswaiting    forKey:@"oderstatus" ];
        }
        else if(i < 4)
        {
            [ porder setObject:sstatuscofirm    forKey:@"oderstatus" ];
        }
        else if(i < 10)
        {
            [ porder setObject:sstatussucc    forKey:@"oderstatus" ];
        }
        else if(i < 14)
        {
            [ porder setObject:sstatusprocessing    forKey:@"oderstatus" ];
        }
        else
        {
            [ porder setObject:sstatusfinished    forKey:@"oderstatus" ];
        }
        
        [ porderlist addObject:porder ];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString * const kCellIdentifier = @"orderCell";
    
    //    NSInteger ltype = [ self getcellviewtype:indexPath.row ];
    cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    NSDictionary* porder = [ porderlist objectAtIndex:indexPath.row ];
    
    NSString* saddress = [ NSString stringWithFormat:@"%@", [ porder objectForKey:@"address" ] ];
    NSString* sdate1 = [ NSString stringWithFormat:@"%@", [ porder objectForKey:@"date" ] ];
    NSString* sdate2 = [ NSString stringWithFormat:@"%@", [ porder objectForKey:@"start_time" ] ];
    NSString* sdate3 = [ NSString stringWithFormat:@"%@", [ porder objectForKey:@"end_time" ] ];
    
    NSString* stimerange = [ NSString stringWithFormat:@"%@ %@--%@", sdate1, sdate2, sdate3 ];
    NSString* sstatus = [ NSString stringWithFormat:@"%@", [ porder objectForKey:@"status" ] ];
    
    NSDictionary* pproduct = [ porder objectForKey:@"product" ];
    NSString* sproductname = [ NSString stringWithFormat:@"%@", [ pproduct objectForKey:@"name" ] ];
    
    NSDictionary* pserver = [ porder objectForKey:@"service" ];
    NSString* sservername = [ NSString stringWithFormat:@"%@", [ pserver objectForKey:@"name" ] ];
    
    NSArray* pworkers = (NSArray*)[ porder objectForKey:@"workers" ];
    NSString* sworker = [ NSString stringWithFormat:@"%ld 人应约", pworkers.count ];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
        CGRect arect = cell.contentView.frame;
        arect.size.width = [ [UIScreen mainScreen] applicationFrame ].size.width-2*5;
        cell.contentView.frame = arect;
        
        CGRect timerect = CGRectMake(2, 0, 260, 20);
        UILabel*    ptimelable = [ [UILabel alloc] initWithFrame:timerect ];
        [ ptimelable setText:stimerange ];
        [ cell.contentView addSubview:ptimelable ];
        [ ptimelable setTag:100 ];
        
        CGRect statrect = CGRectMake(262, 0, 100, 20);
        UILabel* pstatuslable = [ [UILabel alloc] initWithFrame:statrect ];
        [ pstatuslable setText:sstatus ];
        [ cell.contentView addSubview:pstatuslable ];
        [ pstatuslable setTag:101 ];
        
        CGRect adsrect = CGRectMake(2, 22, arect.size.width, 20);
        UILabel* paddresslable = [ [UILabel alloc] initWithFrame:adsrect ];
        [ paddresslable setText:saddress ];
        [ cell.contentView addSubview:paddresslable ];
        [ paddresslable setTag:102 ];
        
        CGRect productrect = CGRectMake(2, 44, arect.size.width*0.5, 20);
        UILabel* pproductlable = [ [UILabel alloc] initWithFrame:productrect ];
        [ pproductlable setText:sproductname ];
        [ pproductlable setTag:103 ];
        [ cell.contentView addSubview:pproductlable ];
        
        CGRect sevrect = CGRectMake(2+productrect.size.width, 44, arect.size.width*0.5-4, 20);
        UILabel* pservicelable = [ [UILabel alloc] initWithFrame:sevrect ];
        [ pservicelable setText:sservername ];
        [ pservicelable setTag:104 ];
        [ cell.contentView addSubview:pservicelable ];
    }
    else
    {
        UILabel* time = (UILabel*)[ cell.contentView viewWithTag:100 ];
        [ time setText:stimerange ];
        
        UILabel* status = (UILabel*)[ cell.contentView viewWithTag:101 ];
        [ status setText:sstatus ];
        
        UILabel* address = (UILabel*)[ cell.contentView viewWithTag:102 ];
        [ address setText:saddress ];
        
        UILabel* product = (UILabel*)[ cell.contentView viewWithTag:103 ];
        [ product setText:sproductname ];

        UILabel* service = (UILabel*)[ cell.contentView viewWithTag:104 ];
        [ service setText:sservername ];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return porderlist.count;
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
    NSDictionary* pdic = [ porderlist objectAtIndex:indexPath.row ];
    CMyReviewOrderViewController* previeworder = [ [CMyReviewOrderViewController alloc] initWithItem:YES info:pdic ];
    [ self.navigationController pushViewController:previeworder animated:YES ];
}



-(void) ClickRightBt:(UIButton*)pbt
{
    CMyOrderCreateViewController* pcreateorder = [ [CMyOrderCreateViewController alloc] initWithItem:YES ];
    [ self.navigationController pushViewController:pcreateorder animated:YES ];
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
