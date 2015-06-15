//
//  CMyUserHistoryViewControler.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserHistoryViewControler.h"

#import "CMyOrderDetailViewController.h"

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


- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    UIView* pview = [ [UIView alloc] init ];
    CGRect arect1 = [ [UIScreen mainScreen] applicationFrame ];
    //arect1.origin.y
    CGRect arect = CGRectMake(0, 0, arect1.size.width, arect1.size.height-93);
    [ pview setFrame:arect ];
    [ pview setBackgroundColor:[ UIColor grayColor ] ];
    [ self.view addSubview:pview ];
    */
    
    ptableview = [ [UITableView alloc] init ];
    [ ptableview setDataSource:self ];
    [ ptableview setDelegate:self ];
    
    [ ptableview setSeparatorStyle:UITableViewCellSeparatorStyleNone ];
    [ self.view addSubview:ptableview ];
    
    lpage = 1;
    [ self loadorders:1 ];
//    [ self loadorderlist ];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect arect = self.view.frame;
//    [self.view setFrame:CGRectMake(arect.origin.x, arect.origin.y, arect.size.width, arect.size.height-50)];
    
    [ptableview setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    NSLog(@"11111");
}

-(void) loadorders:(NSInteger)page
{
    CMyUserLoadordersParaments* ploadorderlistparament = [ [CMyUserLoadordersParaments alloc] initWithdata:[ [CMyLocalDatas SharedLocalDatas] getlocaluserid ] type:[ [CMyLocalDatas SharedLocalDatas] getlocaluserstype ] token:[ [CMyLocalDatas SharedLocalDatas] getlocaltoken ] page:page ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserOrderlistload:[ ploadorderlistparament GetServerInterfaceParamens ] ];
    CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ pserverresult GetResult])
    {
        porderlist = [ [NSMutableArray alloc] initWithArray:(NSArray*)[ pserverresult GetResultData ] ];
        if (porderlist.count > 0)
        {
            lpage++;
        }
    }
}

-(void) loadorderlist
{
    NSString* simageboy = [ NSString stringWithFormat:@"%@", @"face_boy.png" ];
    NSString* simagegirl = [ NSString stringWithFormat:@"%@", @"face_girl.png" ];
    
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
    
    /*
     time_range: '2015-02-05 13:30-15:30',
     created_at: '2015-01-07',
     address: 'afasfdasdf',
     status: 1,
     workers
     */
    NSDictionary* porder = [ porderlist objectAtIndex:indexPath.row ];
    NSString* stimerange = [ porder objectForKey:@"time_range" ];
    NSString* screateat = [ porder objectForKey:@"created_at" ];
    NSArray* pworkers = [ porder objectForKey:@"workers" ];
    NSInteger* lstatus = [(NSString*)[ porder objectForKey:@"status" ] integerValue];
    NSString* saddress = [ porder objectForKey:@"address" ];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
        CGRect arect = CGRectMake(2, 2, cell.contentView.frame.size.width-2*2, cell.contentView.frame.size.height-2*2);
        
        CGRect timerangerect = CGRectMake(5, 2, arect.size.width*0.5, 20);
        UILabel* ptimerange = [ [UILabel alloc] initWithFrame:timerangerect ];
        [ cell.contentView addSubview:ptimerange ];
        [ ptimerange setText:stimerange ];
        [ ptimerange setTextAlignment:NSTextAlignmentLeft ];
        [ ptimerange setTag:100 ];
//        CGRect imagerect = CGRectMake(5, 2, arect.size.height-2*2, arect.size.height-2*2);
//        UIImageView* pimageview = [ [UIImageView alloc] initWithFrame:imagerect ];
//        [ cell.contentView addSubview:pimageview ];
//        [ pimageview setImage:[ UIImage imageNamed:[ NSString stringWithString:[ porder objectForKey:@"workerimage" ] ] ] ];
//        [ pimageview setTag:100 ];
        
        CGRect createtimerect = CGRectMake(timerangerect.origin.x + timerangerect.size.width + 20, 5, arect.size.width-timerangerect.size.width-20-20, 15);
        UILabel* pordertime = [ [UILabel alloc] initWithFrame:createtimerect ];
        [ cell.contentView addSubview:pordertime ];
        [ pordertime setText:screateat ];
        [ pordertime setTextAlignment:NSTextAlignmentLeft ];
        [ pordertime setTag:101 ];
        
        CGRect descrect = CGRectMake(createtimerect.origin.x, createtimerect.origin.y + createtimerect.size.height + 5, createtimerect.size.width, createtimerect.size.height);
        UILabel* pworkername = [ [UILabel alloc] initWithFrame:descrect ];
        [ cell.contentView addSubview:pworkername ];
        [ pworkername setText:[ NSString stringWithString:[ porder objectForKey:@"workername" ] ] ];
        [ pworkername setTextAlignment:NSTextAlignmentLeft ];
        [ pworkername setTag:102 ];
        
        CGRect statrect = CGRectMake(arect.size.width-100-20, 2, 100, arect.size.height-2*2);
        UILabel* pstatusview = [ [UILabel alloc] initWithFrame:statrect ];
        [ pstatusview setText:[ NSString stringWithString:[ porder objectForKey:@"oderstatus" ] ] ];
        [ cell.contentView addSubview:pstatusview ];
        [ pstatusview setTextAlignment:NSTextAlignmentRight ];
        [ pstatusview setTag:103 ];
        [ pstatusview setTextColor:[ UIColor redColor ] ];
        [ pstatusview setAlpha:0.6 ];
    }
    else
    {
//        UIImageView* pcellview = (UIImageView*)[ cell.contentView viewWithTag:100 ];
//        [ pcellview setImage:[ UIImage imageNamed:[ NSString stringWithString:[ porder objectForKey:@"workerimage" ] ] ] ];
        
        UILabel* username = (UILabel*)[ cell.contentView viewWithTag:101 ];
        [ username setText:[ NSString stringWithString:[ porder objectForKey:@"ordertime" ] ] ];
        
        UILabel* userdesc = (UILabel*)[ cell.contentView viewWithTag:102 ];
        [ userdesc setText:[ NSString stringWithString:[ porder objectForKey:@"workername" ] ] ];
        
        UILabel* pstatusview = (UILabel*)[ cell.contentView viewWithTag:103 ];
        [ pstatusview setText:[ NSString stringWithString:[ porder objectForKey:@"oderstatus" ] ] ];
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
    CMyOrderDetailViewController* porderdetailviercontroler = [ [CMyOrderDetailViewController alloc] init ];
    NSDictionary* pdic = [ porderlist objectAtIndex:indexPath.row ];
    [ porderdetailviercontroler setorderinfo:pdic ];
    [ self presentViewController:porderdetailviercontroler animated:YES completion:nil ];
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
