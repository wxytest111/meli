//
//  CMyWorkerOrderDetailViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/18.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerOrderDetailViewController.h"

#import "CMyNetWorkInterface.h"

@interface CMyWorkerOrderDetailViewController ()

@end

@implementation CMyWorkerOrderDetailViewController

-(instancetype) initWithContend:(NSDictionary*)info
{
    BOOL bright = NO;
    pcontendinfo = [ [NSDictionary alloc] initWithDictionary:info ];
    
    NSString* status = [ NSString stringWithFormat:@"%@", [pcontendinfo  objectForKey:@"status"] ];
    if ([ status isEqualToString:@"waiting" ])
    {
        sright = @"取消";
        bright = YES;
    }
    else if( [ status isEqualToString:@"ready" ] )
    {
        bright = YES;
        sright = @"开始";
    }
    else if( [ status isEqualToString:@"begin" ] )
    {
        bright = YES;
        sright = @"完成";
    }
    else
    {
        bright = NO;
    }
    
    self = [ super initWithItem:bright ];
    
    return self;
}

-(void) ClickRightBt:(UIButton*)pbt
{
    NSString* status = [ NSString stringWithFormat:@"%@", [pcontendinfo  objectForKey:@"status"] ];
    if ([ status isEqualToString:@"waiting" ])
    {
        [ self CancelOrder ];
    }
    else if( [ status isEqualToString:@"ready" ] )
    {
        [ self BeginOrder ];
    }
    else if( [ status isEqualToString:@"begin" ] )
    {
        [ self FinishOrder ];
    }
    [ self.navigationController popToRootViewControllerAnimated:YES ];
}

-(void) CancelOrder
{
    NSString* sid = [ NSString stringWithFormat:@"%@", [pcontendinfo objectForKey:@"id"] ];
    CMyWorkerCancelOrderParaments* pcancel = [ [CMyWorkerCancelOrderParaments alloc] initWithData:sid ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] WorkerCancelOrder:[ pcancel GetServerInterfaceParamens ] ];
    CMyServerResultData* presult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ presult GetResult ])
    {
        NSLog(@"worker cancel order success");
    }
    else
    {
        NSLog(@"worker cancel order failed");
    }
    [ self.navigationController popToRootViewControllerAnimated:YES ];
}

-(void) BeginOrder
{
    NSString* orderid = [ NSString stringWithFormat:@"%@", [pcontendinfo objectForKey:@"id"] ];
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
    
    [ self.navigationController popToRootViewControllerAnimated:YES ];
}

-(void) FinishOrder
{
    NSString* orderid = [ NSString stringWithFormat:@"%@", [pcontendinfo objectForKey:@"id"] ];
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


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
