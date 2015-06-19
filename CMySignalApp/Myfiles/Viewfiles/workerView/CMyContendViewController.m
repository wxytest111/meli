//
//  CMyContendViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyContendViewController.h"

#import "CMyNetWorkInterface.h"

#import "CMyWorkerContendDetailViewController.h"


@interface CMyContendViewController ()

@end

@implementation CMyContendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        self.title = @"抢单";
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
    [ ptableview setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine ];
    
    [ self loadcontends ];
//    [ self loadcontendlist ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
//    [ self starttimer ];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [ super viewWillDisappear:animated ];
    
    [ self stoptimer ];
}

-(void) loadcontends
{
    CMyWorkerRefreshContendsParaments* pworkerrefreshparaments = [ [CMyWorkerRefreshContendsParaments alloc] initWithData:@"1" ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] WorkerContend:[ pworkerrefreshparaments GetServerInterfaceParamens ] ];
    CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ pserverresult GetResult ])
    {
        pcontendlist = (NSMutableArray*)[ pserverresult GetResultData ];
        NSLog(@"get data:%@", pcontendlist);
        NSLog(@"worker load contend success");
    }
    else
    {
        NSLog(@"worker load contend failed");
    }
}

-(void) loadcontendlist
{
    pcontendlist = [ [NSMutableArray alloc] init ];
    
    index = 0;
    for ( NSInteger i = 0; i < 9; i++)
    {
        NSMutableDictionary* pdic = [ [NSMutableDictionary alloc] init ];
        index++;
        NSString* saddress = [ NSString stringWithFormat:@"user address:%07ld", index ];
        NSString* stime = [ NSString stringWithFormat:@"this is a time:%d", rand()%100000+1 ];
        
        [ pdic setObject:saddress forKey:@"address" ];
        [ pdic setObject:stime forKey:@"time" ];
        [ pcontendlist addObject:pdic ];
    }
    
//    [ self starttimer ];
}

-(void) starttimer
{
    ptimeradd = [ NSTimer timerWithTimeInterval:4.0 target:self selector:@selector(addcontend) userInfo:nil repeats:YES ];
    ptimerdelete = [ NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(deletecontend) userInfo:nil repeats:YES ];

    [[NSRunLoop currentRunLoop]addTimer:ptimeradd forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]addTimer:ptimerdelete forMode:NSDefaultRunLoopMode];
}

-(void) stoptimer
{
    [ ptimeradd invalidate ];
    [ ptimerdelete invalidate ];
}

-(void) addcontend
{
    NSInteger icount = rand()%4+1;
    NSMutableArray* paddcontend = [ [NSMutableArray alloc] init ];
    
    NSMutableArray* pindexs = [ [NSMutableArray alloc] init ];
    
    for ( NSInteger i = 0; i < icount; i++)
    {
        NSMutableDictionary* pdic = [ [NSMutableDictionary alloc] init ];
        index++;
        NSString* saddress = [ NSString stringWithFormat:@"user address:%07ld", index ];
        NSString* stime = [ NSString stringWithFormat:@"this is a time:%d", rand()%100000+1 ];
        
        [ pdic setObject:saddress forKey:@"address" ];
        [ pdic setObject:stime forKey:@"time" ];
        [ paddcontend addObject:pdic ];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        
        [pindexs addObject: indexPath];
    }
    [ pcontendlist addObjectsFromArray:paddcontend ];
    [ ptableview beginUpdates ];
    [ ptableview insertRowsAtIndexPaths:pindexs withRowAnimation:UITableViewRowAnimationFade];
    [ ptableview endUpdates ];
    
}

-(void) deletecontend
{
    NSMutableArray* pdelindexs = [ [NSMutableArray alloc] init ];
    
    NSInteger icount = rand()%2+1;
    for (NSInteger j = 0; j < icount; j++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:j inSection:0];
        [pdelindexs addObject: indexPath];
        [ pcontendlist removeObjectAtIndex:j ];
    }
    [ ptableview beginUpdates ];
    [ ptableview deleteRowsAtIndexPaths:pdelindexs withRowAnimation:UITableViewRowAnimationFade];
    [ ptableview endUpdates ];
}


#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString * const kCellIdentifier = @"contendCell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    NSInteger lindex = indexPath.row;

    NSDictionary* pcontend = [ pcontendlist objectAtIndex:lindex ];
    
    NSString* sdate = [ NSString stringWithFormat:@"%@", [pcontend objectForKey:@"date"] ];
    NSString* sdate1 = [ NSString stringWithFormat:@"%@", [pcontend objectForKey:@"start_time"] ];
    NSString* sdate2 = [ NSString stringWithFormat:@"%@", [pcontend objectForKey:@"end_time"] ];
    
    NSString*   saddress = [ NSString stringWithFormat:@"%@", [pcontend objectForKey:@"address"] ];
    NSString*   stimerange = [ NSString stringWithFormat:@"%@ %@--%@", sdate, sdate1, sdate2 ];
    
    NSDictionary* pcustomer = [pcontend objectForKey:@"customer"];
    NSString*   susername = [ NSString stringWithFormat:@"%@", [pcustomer objectForKey:@"nick_name"] ];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
        CGRect arect = CGRectMake(2, 2, cell.contentView.frame.size.width-2*2, cell.contentView.frame.size.height-2*2);
        
        CGRect adsrect = CGRectMake(10 , 5, arect.size.width-20, 20);
        UILabel* paddress = [ [UILabel alloc] initWithFrame:adsrect ];
        [ cell.contentView addSubview:paddress ];
        [ paddress setText:saddress ];
        [ paddress setTextAlignment:NSTextAlignmentLeft ];
        [ paddress setTag:101 ];
        
        CGRect timerect = CGRectMake(10, adsrect.origin.y + adsrect.size.height + 5, arect.size.width-20, 20);
        UILabel* ptime = [ [UILabel alloc] initWithFrame:timerect ];
        [ cell.contentView addSubview:ptime ];
        [ ptime setText:stimerange ];
        [ ptime setTextAlignment:NSTextAlignmentLeft ];
        [ ptime setTag:102 ];
        
        CGRect userrect = CGRectMake(10, timerect.origin.y + timerect.size.height + 5, arect.size.width-20, 20);
        UILabel* puser = [ [UILabel alloc] initWithFrame:userrect ];
        [ cell.contentView addSubview:puser ];
        [ puser setText:susername ];
        [ puser setTextAlignment:NSTextAlignmentLeft ];
        [ puser setTag:103 ];
    }
    else
    {
        UILabel* paddress = (UILabel*)[ cell.contentView viewWithTag:101 ];
        [ paddress setText:saddress ];
        
        UILabel* ptime = (UILabel*)[ cell.contentView viewWithTag:102 ];
        [ ptime setText:stimerange ];
        
        UILabel* puser = (UILabel*)[ cell.contentView viewWithTag:103 ];
        [ puser setText:susername ];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return pcontendlist.count;
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
    NSDictionary* pdic = [ pcontendlist objectAtIndex:indexPath.row ];
    CMyWorkerContendDetailViewController* pworkercontenddetail = [ [CMyWorkerContendDetailViewController alloc] initWithContend:pdic ];
    [self.navigationController pushViewController:pworkercontenddetail animated:YES];
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
