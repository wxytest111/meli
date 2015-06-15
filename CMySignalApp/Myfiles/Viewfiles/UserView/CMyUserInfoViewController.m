//
//  CMyUserInfoViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserInfoViewController.h"

#import "CMyUserRegisterView.h"
#import "CMyUserLoginView.h"
#import "CMyUserInfoDetailView.h"

#import "CMyLocalDatas.h"


@interface CMyUserInfoViewController ()

@end

@implementation CMyUserInfoViewController

#pragma mark - ViewController Life
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"用户";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect arect1 = [ [UIScreen mainScreen] applicationFrame ];
    CGRect arect = CGRectMake(0, 0, arect1.size.width, arect1.size.height-93);
    
    NSString* suserid = [ [CMyLocalDatas SharedLocalDatas] getlocaluserid ];
    NSInteger sltype = [ [CMyLocalDatas SharedLocalDatas] getlocalusertype ];
    
    if (suserid == nil || sltype == USER_TYPE_OTHER)
    {
        CMyUserLoginView* ploginview = [ [CMyUserLoginView alloc] initWithFrame:arect ];
        [ self.view addSubview:ploginview ];
        [ ploginview setUserlogindelegate:self ];
        [ ploginview setTag:100 ];
    }
    else
    {
        CMyUserInfoDetailView* pinfodetailview = [ [CMyUserInfoDetailView alloc] initWithFrame:arect ];
        [ self.view addSubview:pinfodetailview ];
        [ pinfodetailview setUserdetaildelegate:self ];
        [ pinfodetailview setTag:100 ];
    }
}

- (void)didReceiveMemoryWarning
{
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

#pragma mark UserInfoDetailViewDelegate
-(void) BtClickBack:(id)sender
{
    UIView* pview = (UIView*)[ self.view viewWithTag:100 ];
    [ pview removeFromSuperview ];
}

-(void) BtClickUplevel:(id)sender
{
    ;
}


#pragma mark UserLoginViewDelegate
-(void) BtClickCancel:(id)sender
{
    UIView* pview = (UIView*)[ self.view viewWithTag:100 ];
    [ pview removeFromSuperview ];
}

-(void) BTClickSubmit:(id)sender
{
    ;
}

-(void) BTClickRegister:(id)sender
{
    UIView* pview = (UIView*)[ self.view viewWithTag:100 ];

    CMyUserRegisterView* pregisterview = [ [CMyUserRegisterView alloc] initWithFrame:pview.frame ];
    [ self.view addSubview:pregisterview ];
    [ pregisterview setUserlogindelegate:self ];
    [ pregisterview setTag:100 ];
    
    [ pview removeFromSuperview ];
}


@end
