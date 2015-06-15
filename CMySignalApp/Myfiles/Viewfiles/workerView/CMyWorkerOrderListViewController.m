//
//  CMyWorkerOrderListViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerOrderListViewController.h"

@interface CMyWorkerOrderListViewController ()

@end

@implementation CMyWorkerOrderListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
//        self.title = @"我的订单";
        self.title = @"抢单333333333";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect arect = self.view.frame;
    [self.view setFrame:CGRectMake(arect.origin.x, arect.origin.y, arect.size.width, arect.size.height-50)];
    CGRect arect1 = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    ptableview = [ [UITableView alloc] init ];
    [ptableview setFrame:arect1];
    
    [ ptableview setDelegate:self ];
    [ ptableview setDataSource:self ];
    [ self.view addSubview:ptableview ];
    [ ptableview setSeparatorStyle:UITableViewCellSeparatorStyleNone ];
    
    [ self loadworkerorderlist ];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [ super viewWillDisappear:animated ];
}

-(void) loadworkerorderlist
{
    pworkerorderlist = [ [NSMutableArray alloc] init ];
    
    for (NSInteger i = 0; i < 20; i++)
    {
        NSMutableDictionary* porder = [ [NSMutableDictionary alloc] init ];
        
        NSString* saddress  = [ NSString stringWithFormat:@"user address:%07ld", i ];
        NSString* stime     = [ NSString stringWithFormat:@"this is a time:%d", rand()%100000+1 ];
        NSString* sstatus   = [ NSString stringWithFormat:@"%ld", i%4 ];
        
        [ porder setObject:saddress forKey:@"address" ];
        [ porder setObject:stime    forKey:@"time" ];
        [ porder setObject:sstatus  forKey:@"status" ];
        [ pworkerorderlist addObject:porder ];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*) getstatusdesc:(NSInteger)lstatus
{
    NSString* sret = nil;
    switch (lstatus)
    {
        case WORKER_ORDER_STATUS_FINISHED:
        {
            sret = [ NSString stringWithFormat:@"%@", @"已完成" ];
            break;
        }
        case WORKER_ORDER_STATUS_BEGINNING:
        {
            sret = [ NSString stringWithFormat:@"%@", @"正在施工" ];
            break;
        }
        case WORKER_ORDER_STATUS_READY:
        {
            sret = [ NSString stringWithFormat:@"%@", @"等待施工" ];
            break;
        }
        case WORKER_ORDER_STATUS_WAITING:
        {
            sret = [ NSString stringWithFormat:@"%@", @"等待用户确认" ];
            break;
        }
        default:
        {
            sret = [ NSString stringWithFormat:@"%@", @"其他" ];
            break;
        }
    }
    
    return sret;
}

#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString * const kCellIdentifier = @"contendCell";
    
    //    NSInteger ltype = [ self getcellviewtype:indexPath.row ];
    cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    NSDictionary* porder = [ pworkerorderlist objectAtIndex:indexPath.row ];
    
    NSString* sstatus = [ self getstatusdesc:[[ porder objectForKey:@"status" ] integerValue] ];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
        CGRect arect = CGRectMake(2, 2, cell.contentView.frame.size.width-2*2, cell.contentView.frame.size.height-2*2);
        
        CGRect adsrect = CGRectMake(10 , 5, arect.size.width-20, 15);
        UILabel* paddress = [ [UILabel alloc] initWithFrame:adsrect ];
        [ cell.contentView addSubview:paddress ];
        [ paddress setText:[ NSString stringWithString:[ porder objectForKey:@"address" ] ] ];
        [ paddress setTextAlignment:NSTextAlignmentLeft ];
        [ paddress setTag:101 ];
        
        CGRect timerect = CGRectMake(10, adsrect.origin.y + adsrect.size.height + 5, arect.size.width-20, 15);
        UILabel* ptime = [ [UILabel alloc] initWithFrame:timerect ];
        [ cell.contentView addSubview:ptime ];
        [ ptime setText:[ NSString stringWithString:[ porder objectForKey:@"time" ] ] ];
        [ ptime setTextAlignment:NSTextAlignmentLeft ];
        [ ptime setTag:102 ];
        
        CGRect statrect = CGRectMake(arect.size.width-120-5, 2, 150, arect.size.height-2*2);
        UILabel* pstatusview = [ [UILabel alloc] initWithFrame:statrect ];
        [ pstatusview setText:sstatus ];
        [ cell.contentView addSubview:pstatusview ];
        [ pstatusview setTextAlignment:NSTextAlignmentRight ];
        [ pstatusview setTag:103 ];
        [ pstatusview setTextColor:[ UIColor redColor ] ];
        [ pstatusview setAlpha:0.6 ];
        [ pstatusview setBackgroundColor:[UIColor yellowColor] ];
        [ cell.contentView setBackgroundColor:[ UIColor grayColor ] ];
    }
    else
    {
        UILabel* paddress = (UILabel*)[ cell.contentView viewWithTag:101 ];
        [ paddress setText:[ NSString stringWithString:[ porder objectForKey:@"address" ] ] ];
        
        UILabel* ptime = (UILabel*)[ cell.contentView viewWithTag:102 ];
        [ ptime setText:[ NSString stringWithString:[ porder objectForKey:@"time" ] ] ];
        
        UILabel* pstatus = (UILabel*)[ cell.contentView viewWithTag:103 ];
        [ pstatus setText:sstatus];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return pworkerorderlist.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger lheight = 60;
    return lheight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ;
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
