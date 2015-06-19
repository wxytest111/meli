//
//  CMyWorkerContendDetailViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/18.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerContendDetailViewController.h"

#import "CMyNetWorkInterface.h"


@interface CMyWorkerContendDetailViewController ()

@end

@implementation CMyWorkerContendDetailViewController

-(instancetype) initWithContend:(NSDictionary*)info
{
    self = [ super initWithItem:YES ];
    
    if (self)
    {
        pcontendinfo = [ [NSDictionary alloc] initWithDictionary:info ];
        sright = @"应约";
    }
    
    return self;
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
    
    [ self lineviews ];
    // Do any additional setup after loading the view.
}

-(void) viewWillDisappear:(BOOL)animated
{
    [ super viewWillDisappear:animated ];
    
    [self.navigationController popViewControllerAnimated:NO];
}

-(void) lineviews
{
    [ self loadView ];
    
    NSInteger lx = 10;
    NSInteger ly = 30;
    
    NSInteger lrest = 3;
    
    NSInteger lwidth = ScreenWidth-10*2;
    NSInteger lheight= 20;
    
    NSDictionary* pcustomer = [ pcontendinfo objectForKey:@"customer" ];
    NSString* sname = [ NSString stringWithFormat:@"用户：%@", [pcustomer objectForKey:@"nick_name"] ];
    CGRect namerect = CGRectMake(lx, ly, lwidth, lheight);
    plableusername = [ [UILabel alloc] initWithFrame:namerect ];
    [ plableusername setText:sname ];
    [ self.view addSubview:plableusername ];
    ly = ly + lheight + lrest;
    
    NSString* sdate  = [ NSString stringWithFormat:@"%@", [ pcontendinfo objectForKey:@"date"] ];
    NSString* sdate1 = [ NSString stringWithFormat:@"%@", [ pcontendinfo objectForKey:@"start_time"] ];
    NSString* sdate2 = [ NSString stringWithFormat:@"%@", [ pcontendinfo objectForKey:@"end_time"] ];
    
    NSString*   stime = [ NSString stringWithFormat:@"时间：%@ %@--%@", sdate, sdate1, sdate2 ];

    CGRect timerect = CGRectMake(lx, ly, lwidth, lheight);
    plabletimerange = [ [UILabel alloc] initWithFrame:timerect ];
    [ plabletimerange setText:stime ];
    [ self.view addSubview:plabletimerange ];
    ly = ly + lheight + lrest;

    NSString* saddress = [ NSString stringWithFormat:@"地址：%@", [pcontendinfo objectForKey:@"address"] ];
    CGRect addressrect = CGRectMake(lx, ly, lwidth, lheight);
    plableaddress = [ [UILabel alloc] initWithFrame:addressrect ];
    [ plableaddress setText:saddress ];
    [ self.view addSubview:plableaddress ];
    ly = ly + lheight + lrest;

    NSDictionary*   product = [ pcontendinfo objectForKey:@"product" ];
    NSString* sproduct = [ NSString stringWithFormat:@"产品：%@", [product objectForKey:@"name"] ];
    CGRect productrect = CGRectMake(lx, ly, lwidth, lheight);
    plableproduct = [ [UILabel alloc] initWithFrame:productrect ];
    [ plableproduct setText:sproduct ];
    [ self.view addSubview:plableproduct ];
    ly = ly + lheight + lrest;

    NSDictionary*   service = [ pcontendinfo objectForKey:@"service" ];
    NSString* sservice = [ NSString stringWithFormat:@"服务：%@", [service objectForKey:@"name"] ];
    CGRect servicerect = CGRectMake(lx, ly, lwidth, lheight);
    plableservice = [ [UILabel alloc] initWithFrame:servicerect ];
    [ plableservice setText:sservice ];
    [ self.view addSubview:plableservice ];
    ly = ly + lheight + lrest;
}

-(void) ClickRightBt:(UIButton*)pbt
{
    NSString* contend = [ NSString stringWithFormat:@"%@", [pcontendinfo objectForKey:@"id"] ];
    CMyWorkerConfirmContendParaments* pconfirmcontend = [ [CMyWorkerConfirmContendParaments alloc] initWithData:contend ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] WorkerConfirmContend:[ pconfirmcontend GetServerInterfaceParamens ] ];
    CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ pserverresult GetResult ])
    {
        NSLog(@"confirm contend success");
    }
    else
    {
        NSLog(@"confirm contend failed");
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
