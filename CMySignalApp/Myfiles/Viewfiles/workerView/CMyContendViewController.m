//
//  CMyContendViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyContendViewController.h"

@interface CMyContendViewController ()

@end

@implementation CMyContendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
//        self.title = @"抢单";
        self.title = @"抢单111111111";
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
    
    [ self loadcontendlist ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
    [ self starttimer ];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [ super viewWillDisappear:animated ];
    
    [ self stoptimer ];
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
    
    //    NSInteger ltype = [ self getcellviewtype:indexPath.row ];
    cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    NSInteger lindex = pcontendlist.count-indexPath.row-1;
    
    NSDictionary* pcontend = [ pcontendlist objectAtIndex:lindex ];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
        CGRect arect = CGRectMake(2, 2, cell.contentView.frame.size.width-2*2, cell.contentView.frame.size.height-2*2);
        
        CGRect adsrect = CGRectMake(10 , 5, arect.size.width-20, 15);
        UILabel* paddress = [ [UILabel alloc] initWithFrame:adsrect ];
        [ cell.contentView addSubview:paddress ];
        [ paddress setText:[ NSString stringWithString:[ pcontend objectForKey:@"address" ] ] ];
        [ paddress setTextAlignment:NSTextAlignmentLeft ];
        [ paddress setTag:101 ];
        
        CGRect timerect = CGRectMake(10, adsrect.origin.y + adsrect.size.height + 5, arect.size.width-20, 15);
        UILabel* ptime = [ [UILabel alloc] initWithFrame:timerect ];
        [ cell.contentView addSubview:ptime ];
        [ ptime setText:[ NSString stringWithString:[ pcontend objectForKey:@"time" ] ] ];
        [ ptime setTextAlignment:NSTextAlignmentLeft ];
        [ ptime setTag:102 ];
        
    }
    else
    {
        UILabel* paddress = (UILabel*)[ cell.contentView viewWithTag:101 ];
        [ paddress setText:[ NSString stringWithString:[ pcontend objectForKey:@"address" ] ] ];
        
        UILabel* ptime = (UILabel*)[ cell.contentView viewWithTag:102 ];
        [ ptime setText:[ NSString stringWithString:[ pcontend objectForKey:@"time" ] ] ];
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
    NSInteger lheight = 60;
    return lheight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CMyOrderDetailViewController* porderdetailviercontroler = [ [CMyOrderDetailViewController alloc] init ];
//    NSDictionary* pdic = [ porderlist objectAtIndex:indexPath.row ];
//    [ porderdetailviercontroler setorderinfo:pdic ];
//    [ self presentViewController:porderdetailviercontroler animated:YES completion:nil ];
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
