//
//  CMyUserInfoViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserInfoViewController.h"

#import "CMyUserRegisterView.h"
#import "CMyUserLoginView.h"
#import "CMyUserInfoDetailView.h"

#import "CMyUserLogingViewController.h"


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
        bleftbt = NO;
    }
    return self;
}

-(instancetype) initWithItem:(BOOL)bcreatebt
{
    self = [ super initWithItem:bcreatebt ];
    
    if (self)
    {
        if ([ [CMyLocalDatas SharedLocalDatas] getlocallogined ])
        {
            sright = [ NSString stringWithFormat:@"%@", @"注销" ];
            sleft = [ NSString stringWithFormat:@"%@", @"编辑" ];
            bleftbt = YES;
        }
        else
        {
            sright = [ NSString stringWithFormat:@"%@", @"注销" ];
        }
        
        [ self showeditbt ];
    }
    return self;
}

-(void) showeditbt
{
    if (bleftbt)
    {
        UIButton* editbt = [UIButton buttonWithType:UIButtonTypeCustom];
        editbt.frame = CGRectMake(2, 0, 44, 33);
        [ editbt setBackgroundImage:[UIImage imageNamed:@"backItem"] forState:UIControlStateNormal];
        [ editbt setBackgroundColor:[ UIColor redColor ] ];
        [ editbt setTitle:sleft forState:UIControlStateNormal ];
        [ editbt addTarget:self action:@selector(ClickRightBt:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:editbt];
    }
}

-(void) ClickLeftBt:(UIButton*)pbt
{
    ;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    CGRect arect1 = [ [UIScreen mainScreen] applicationFrame ];
    CGRect arect = CGRectMake(0, 0, ScreenWidth, ContentviewHeight);
    
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

-(void) viewDidAppear:(BOOL)animated
{
    [ super viewDidAppear:animated ];
    
    CGRect arect1 = [ [UIScreen mainScreen] applicationFrame ];
    CGRect arect = CGRectMake(0, 0, arect1.size.width, arect1.size.height-93);
    
    if ([ [CMyLocalDatas SharedLocalDatas] getlocallogined ])
    {
        CMyUserInfoDetailView* pinfodetailview = [ [CMyUserInfoDetailView alloc] initWithFrame:arect ];
        self.view = pinfodetailview;
    }
    else
    {
        CMyUserLoginView* ploginview = [ [CMyUserLoginView alloc] initWithFrame:arect ];
        self.view = ploginview;

    }
}

-(void) ClickRightBt:(UIButton*)pbt
{
    CMyUserLogingViewController* ploginview = [ [CMyUserLogingViewController alloc] init ];
    self.view.window.rootViewController = ploginview;
//    NSLog(@"super ClickCreateBt");
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
