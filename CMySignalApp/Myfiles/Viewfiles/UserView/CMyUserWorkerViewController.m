//
//  CMyUserWorkerViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserWorkerViewController.h"

#import "CMyWorkerDetailViewController.h"
#import "CMyCreateOderViewController.h"

#import "CMyLoadWorkersParaments.h"

#import "CMyLocalDatas.h"

#import "CMyNetWorkInterface.h"

@interface CMyUserWorkerViewController ()

@end

@implementation CMyUserWorkerViewController

#pragma mark - ViewController Life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"技师";
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

    lshowpage = 0;
    
    [ self loadworkers:1 ];
    
//    [ self loadworkerlist ];
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect arect = self.view.frame;
//    [self.view setFrame:CGRectMake(arect.origin.x, arect.origin.y, arect.size.width, arect.size.height-50)];
    
    [ptableview setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    NSLog(@"11111");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadworkers:(NSInteger)lpage
{
    CMyLoadWorkersParaments* ploadworkersparaments = [ [CMyLoadWorkersParaments alloc] initWithdata:[ [CMyLocalDatas SharedLocalDatas] getlocaluserid ] type:[ [CMyLocalDatas SharedLocalDatas] getlocaluserstype ] token:[ [CMyLocalDatas SharedLocalDatas] getlocaltoken ] page:[ NSString stringWithFormat:@"%ld", lpage ] ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserLoadWorkerlist:[ ploadworkersparaments GetServerInterfaceParamens ] ];
    CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([pserverresult GetResult] == SERVER_RESULT_SUCC )
    {
        pworkerlist = [ [NSMutableArray alloc] initWithArray:(NSArray*)[ pserverresult GetResultData ] ];
        
        if (pworkerlist.count > 0)
        {
            lshowpage++;
        }
        
        @autoreleasepool
        {
            for (NSInteger i = 0; i < pworkerlist.count; i++)
            {
                NSDictionary* pworker = [ pworkerlist objectAtIndex:i ];
                NSString* sworkerid = [ NSString stringWithString:[ pworker objectForKey:@"id" ] ];
                NSString* savatar = [ NSString stringWithString:[ pworker objectForKey:@"avatar" ] ];
                
                NSData* pdata = [ NSData dataWithContentsOfURL:[ NSURL URLWithString:savatar ] ];
                if ([ [CMyLocalDatas SharedLocalDatas] isExistAnImage:sworkerid ])
                {
                    continue;
                }
                [ [CMyLocalDatas SharedLocalDatas] WriteAnImage:sworkerid image:pdata ];
            }
        }
    }
}

-(void) loadworkerlist
{
    NSString* simageboy = [ NSString stringWithFormat:@"%@", @"face_boy.png" ];
    NSString* simagegirl = [ NSString stringWithFormat:@"%@", @"face_girl.png" ];
    
    pworkerlist = [ [NSMutableArray alloc] init ];
    for (int i = 0; i < 50; i++)
    {
        NSMutableDictionary* pworker = [ [NSMutableDictionary alloc] init ];
        
        NSString* susername = [ NSString stringWithFormat:@"user%03d", i ];
        NSString* suserid   = [ NSString stringWithFormat:@"userid%05d", i];
        NSString* suserdesc = [ NSString stringWithFormat:@"%@", @"this is a good worker" ];
        
        [ pworker setObject:susername forKey:@"username" ];
        [ pworker setObject:suserid forKey:@"userid" ];
        [ pworker setObject:suserdesc forKey:@"userdesc" ];
        if (i%2)
        {
            [ pworker setObject:simageboy forKey:@"image" ];
        }
        else
        {
            [ pworker setObject:simagegirl forKey:@"image" ];
        }
        
        [ pworkerlist addObject:pworker ];
    }
    
}


#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString * const kCellIdentifier = @"workerCell";
    
    //    NSInteger ltype = [ self getcellviewtype:indexPath.row ];
    cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if (pworkerlist.count == indexPath.row+1)
    {
        @autoreleasepool
        {
            [ self loadworkers:lshowpage ];
        }
    }
    
    NSDictionary* pwoker = [ pworkerlist objectAtIndex:indexPath.row ];
    NSString* simagename = [ pwoker objectForKey:@"userid" ];
    NSString* sworkername = [ pwoker objectForKey:@"name" ];
    NSString* sworkerskill = [ pwoker objectForKey:@"jineng" ];
    NSInteger lstarts   = [[ pwoker objectForKey:@"star" ] integerValue];
    NSString* startdesc = [ NSString stringWithFormat:@"%ld 星", lstarts ];
    if (![ [CMyLocalDatas SharedLocalDatas] isExistAnImage:simagename ])
    {
        simagename = [ NSString stringWithFormat:@"%@", @"face_girl" ];
    }
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
        CGRect arect = CGRectMake(2, 2, cell.contentView.frame.size.width-2*2, cell.contentView.frame.size.height-2*2);
        
        CGRect imagerect = CGRectMake(5, 2, arect.size.height-2*2, arect.size.height-2*2);
        UIImageView* pimageview = [ [UIImageView alloc] initWithFrame:imagerect ];
        [ cell.contentView addSubview:pimageview ];
        [ pimageview setImage:[ UIImage imageNamed:simagename ] ];
        [ pimageview setTag:100 ];
        
        CGRect namerect = CGRectMake(imagerect.origin.x + imagerect.size.width + 20, 5, arect.size.width-imagerect.size.width-20-20, 15);
        UILabel* pusername = [ [UILabel alloc] initWithFrame:namerect ];
        [ cell.contentView addSubview:pusername ];
        [ pusername setText:[ NSString stringWithString:sworkername] ];
        [ pusername setTextAlignment:NSTextAlignmentLeft ];
        [ pusername setTag:101 ];
        
        CGRect descrect = CGRectMake(namerect.origin.x, namerect.origin.y + namerect.size.height + 5, namerect.size.width, namerect.size.height);
        UILabel* puserdesc = [ [UILabel alloc] initWithFrame:descrect ];
        [ cell.contentView addSubview:puserdesc ];
        [ puserdesc setText:[ NSString stringWithString:sworkerskill ] ];
        [ puserdesc setTextAlignment:NSTextAlignmentLeft ];
        [ puserdesc setTag:102 ];
        
        CGRect startrect = CGRectMake(namerect.origin.x, namerect.origin.y + namerect.size.height + 5, namerect.size.width, namerect.size.height);
        UILabel* pstartdesc = [ [UILabel alloc] initWithFrame:startrect ];
        [ cell.contentView addSubview:pstartdesc ];
        [ pstartdesc setText:[ NSString stringWithString:startdesc ] ];
        [ pstartdesc setTextAlignment:NSTextAlignmentLeft ];
        [ pstartdesc setTag:103 ];

    }
    else
    {
        UIImageView* pcellview = (UIImageView*)[ cell.contentView viewWithTag:100 ];
        [ pcellview setImage:[ UIImage imageNamed:[ NSString stringWithString:[ pwoker objectForKey:@"image" ] ] ] ];
        
        UILabel* username = (UILabel*)[ cell.contentView viewWithTag:101 ];
        [ username setText:[ NSString stringWithString:sworkername ] ];
        
        UILabel* userdesc = (UILabel*)[ cell.contentView viewWithTag:102 ];
        [ userdesc setText:[ NSString stringWithString:sworkerskill ] ];

        UILabel* pstartdesc = (UILabel*)[ cell.contentView viewWithTag:103 ];
        [ pstartdesc setText:[ NSString stringWithString:startdesc ] ];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return pworkerlist.count;
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
    CMyWorkerDetailViewController* pworkerdetailviercontroler = [ [CMyWorkerDetailViewController alloc] init ];
    NSDictionary* pdic = [ pworkerlist objectAtIndex:indexPath.row ];
    [ pworkerdetailviercontroler setworker:pdic ];
    [ self presentViewController:pworkerdetailviercontroler animated:YES completion:nil ];
}



@end
