//
//  CMyUserDefaultViewControler.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserDefaultViewControler.h"

#import "CMyTableViewCell.h"
#import "CMyWorkerDetailViewController.h"
#import "CMyCreateOderViewController.h"

#import "CMyTuijianDetailViewController.h"


#import "CMyUserTuijianParaments.h"
#import "CMyLocalDatas.h"


#define APPDESC_KEY         @"appdesc"
#define PRODUCTS_KEY        @"products"
#define WORKERS_KEY         @"workers"


@interface CMyUserDefaultViewControler ()

@end

@implementation CMyUserDefaultViewControler

#pragma mark - ViewController Life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"首页";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [ self loadshowdata ];
    
//    CGRect arect = self.view.frame;
//    [self.view setFrame:CGRectMake(arect.origin.x, arect.origin.y, arect.size.width, arect.size.height-50)];

    ptableview = [ [UITableView alloc] init ];
    [ ptableview setDataSource:self ];
    [ ptableview setDelegate:self ];
    
    [ ptableview setSeparatorStyle:UITableViewCellSeparatorStyleNone ];
    
    [ self.view addSubview:ptableview ];
    
    [ self loadtuijiandata ];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
    [ptableview setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [ super viewWillDisappear:animated ];
}

-(void) loadtuijiandata
{
    NSString* suserid = [ [CMyLocalDatas SharedLocalDatas] getlocaluserid ];
    NSString* susertype = [ [CMyLocalDatas SharedLocalDatas] getlocaluserstype ];
    CMyUserTuijianParaments* ptuijianparaments = [ [CMyUserTuijianParaments alloc] initWithdata:suserid type:susertype ];
    
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] Usertuijianload:[ ptuijianparaments GetServerInterfaceParamens ] ];
    CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ pserverresult GetResult ] == SERVER_RESULT_SUCC )
    {
        NSArray* parray = (NSArray*)[ pserverresult GetResultData ];
        ptableviewdata = [ [NSMutableArray alloc] initWithArray:parray ];
    }
    else
    {
        ptableviewdata = [ [NSMutableArray alloc] init ];
    }
    
    if (ptableviewdata.count > 0)
    {
        @autoreleasepool
        {
            for (NSInteger i = 0; i < ptableviewdata.count; i++)
            {
                NSDictionary* ptuijian = [ ptableviewdata objectAtIndex:i ];
                NSString* surl = [ ptuijian objectForKey:@"url" ];
                NSString* sid = [ NSString stringWithString:[ ptuijian objectForKey:@"id" ] ];
                NSData* pdata = [ NSData dataWithContentsOfURL:[ NSURL URLWithString:surl ] ];
                if ([ [CMyLocalDatas SharedLocalDatas] isExistAnImage:sid ])
                {
                    continue;
                }
                [ [CMyLocalDatas SharedLocalDatas] WriteAnImage:sid image:pdata ];
            }
        }
    }
    
}

-(void) loadshowdata
{
    ptableviewdata = [ [NSMutableArray alloc] init ];
//    pviewdata = [ [NSMutableDictionary alloc] init ];
    
    NSMutableDictionary* pappdesc = [ [NSMutableDictionary alloc] init ];
    [ pappdesc setObject:@"this is desc for app" forKey:@"appkey1"];
    [ pappdesc setObject:@"begin from last day" forKey:@"appkey2" ];
    [ pappdesc setObject:@"imageurl" forKey:@"appkey3" ];
    [ ptableviewdata addObject:pappdesc ];
//    [ pviewdata setObject:pappdesc forKey:APPDESC_KEY ];
    
//    NSMutableArray* pproducts = [ [NSMutableArray alloc] init ];
    for (NSInteger i = 0; i < 3; i++)
    {
        NSMutableDictionary* pproduct = [ [NSMutableDictionary alloc] init ];
        NSString* str1 = [ NSString stringWithFormat:@"this is product %ld", (long)i ];
        NSString* strprice = [ NSString stringWithFormat:@"my price is: %ld", i+50 ];
        [ pproduct setObject:str1 forKey:@"productdes" ];
        [ pproduct setObject:strprice forKey:@"productprice" ];
        [ pproduct setObject:@"imageurl" forKey:@"productimage" ];
        [ ptableviewdata addObject:pproduct ];
//        [ pproducts addObject:pproduct ];
    }
//    [ pviewdata setObject:pproducts forKey:PRODUCTS_KEY ];
    
//    NSMutableArray* pworkers = [ [NSMutableArray alloc] init ];
    for (NSInteger j = 1; j < 21; j++)
    {
        NSString* susername = [ NSString stringWithFormat:@"user%03ld", (long)j ];
        NSString* suserid   = [ NSString stringWithFormat:@"userid%03ld", (long)j ];
        NSString* suserdesc = [ NSString stringWithFormat:@"%@", @"this is a good worker" ];
        NSString* suserimage= [ NSString stringWithFormat:@"%@", @"imageurl" ];
        NSMutableDictionary* pworker = [ [NSMutableDictionary alloc] init ];
        [ pworker setObject:susername   forKey:@"workname" ];
        [ pworker setObject:suserid     forKey:@"workid" ];
        [ pworker setObject:suserdesc   forKey:@"workdesc" ];
        [ pworker setObject:suserimage  forKey:@"workimage" ];
        [ ptableviewdata addObject:pworker ];
//        [ pworkers addObject:pworker ];
    }
//    [ pviewdata setObject:pworkers forKey:WORKERS_KEY ];
    
//    NSLog(@"view data:%@", pviewdata);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) getcellviewtype:(NSInteger)lindex
{
    NSInteger ltype = CELL_VIEW_APP;
    switch (lindex) {
        case 0:
        {
            ltype = CELL_VIEW_APP;
            break;
        }
        case 1:
        case 2:
        {
            ltype = CELL_VIEW_PRODUCT;
            break;
        }
        default:
        {
            ltype = CELL_VIEW_WORKER;
            break;
        }
    }
    return ltype;
}

-(NSDictionary*) getcellviewdata:(NSInteger)lindex
{
    return (NSDictionary*)[ ptableviewdata objectAtIndex:lindex ];
}

-(CMyTableViewCell*) CreateCellView:(CGRect) arect index:(NSInteger)lindex
{
    
    CMyTableViewCell* pcellview = [ [CMyTableViewCell alloc] initWithData:arect pdata:[ self getcellviewdata:lindex ] type:[ self getcellviewtype:lindex ] ];
    return pcellview;
}

#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString * const kCellIdentifier = @"defaultCell";
    
//    NSInteger ltype = [ self getcellviewtype:indexPath.row ];
    cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    NSDictionary* ptuijiandic = [ ptableviewdata objectAtIndex:indexPath.row ];
    NSString* sid = [ ptuijiandic objectForKey:@"id" ];
    NSString* simagename = [ NSString stringWithFormat:@"%@%@", [ [CMyLocalDatas SharedLocalDatas] getphotopath ], sid ];
    
    if (![ [CMyLocalDatas SharedLocalDatas] isExistAnImage:sid ])
    {
        simagename = [ NSString stringWithFormat:@"%@", @"localdefaultimage" ];
    }
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
        CGRect arect = CGRectMake(2, 2, cell.contentView.frame.size.width-2*2, cell.contentView.frame.size.height-2*2);
        
        UIImageView* pimageview = [ [UIImageView alloc] initWithFrame:arect ];
        [ cell.contentView addSubview:pimageview ];
        [ pimageview setImage:[ UIImage imageNamed:simagename ] ];
        [ pimageview setTag:100 ];
        /*
        CGRect imagerect = CGRectMake(5, 2, arect.size.height-2*2, arect.size.height-2*2);
        UIImageView* pimageview = [ [UIImageView alloc] initWithFrame:imagerect ];
        [ cell.contentView addSubview:pimageview ];
        [ pimageview setImage:[ UIImage imageNamed:@"face_girl.png" ] ];
        [ pimageview setTag:100 ];
        
        CGRect namerect = CGRectMake(imagerect.origin.x + imagerect.size.width + 20, 5, arect.size.width-imagerect.size.width-20-20, 15);
        UILabel* pusername = [ [UILabel alloc] initWithFrame:namerect ];
        [ cell.contentView addSubview:pusername ];
        [ pusername setText:@"username" ];
        [ pusername setTextAlignment:NSTextAlignmentLeft ];
        [ pusername setTag:101 ];
        
        CGRect descrect = CGRectMake(namerect.origin.x, namerect.origin.y + namerect.size.height + 5, namerect.size.width, namerect.size.height);
        UILabel* puserdesc = [ [UILabel alloc] initWithFrame:descrect ];
        [ cell.contentView addSubview:puserdesc ];
        [ puserdesc setText:@"this worker is good" ];
        [ puserdesc setTextAlignment:NSTextAlignmentLeft ];
        [ puserdesc setTag:102 ];
        */
    }
    else
    {
        [ UIView beginAnimations:nil context:nil ];
        UIImageView* pcellview = (UIImageView*)[ cell.contentView viewWithTag:100 ];
        [ pcellview setImage:[ UIImage imageNamed:simagename ] ];
        [ UIView commitAnimations ];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ptableviewdata.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger lheight = 50;
    return lheight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* ptuijian = [ ptableviewdata objectAtIndex:indexPath.row ];
    NSString* saddress = [ ptuijian objectForKey:@"address" ];
    CMyTuijianDetailViewController* ptuijaindetailviewcontrol = [ [CMyTuijianDetailViewController alloc] initWithdata:saddress ];
    [ self presentViewController:ptuijaindetailviewcontrol animated:YES completion:nil ];
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
