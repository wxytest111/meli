//
//  CMyUserLoginView.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserLoginView.h"
#import "CMyNetWorkInterface.h"
#import "MainViewControler.h"

#import "CMyLocalDatas.h"
//
//#define UserAddress     @"address"
//#define UserStatus      @"status"
//#define UserMobile      @"mobile"
//#define UserType        @"user_type"
//
#if (__TYPE__==__USER__)

#define loginname          @"17792039701"
#define loginpasswd        @"17792039701"

#else if( __TYPE__==__WORKER__ )

#define loginname          @"13264319058"
#define loginpasswd        @"13264319058"

#endif

@implementation CMyUserLoginView

@synthesize userlogindelegate = puserlogindelegate;

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [ super initWithFrame:frame ];
    
    if (self)
    {
        [ self setBackgroundColor:[ UIColor grayColor ] ];
        [ self lineviews ];
    }
    return self;
}


-(void) lineviews
{
    NSInteger lx = 10;
    NSInteger ly = 30;
    
    NSInteger llablewidth = 80;
    NSInteger llableheight = 30;
    
    NSInteger ltextwidth = 120;
    NSInteger ltextheight = llableheight;
    
    NSInteger lbtwidth = 80;
    NSInteger lbtheight = 40;
    
    NSInteger lwidthspace = 20;
    NSInteger lheightspce = 10;
    
    CGRect rect1 = CGRectMake(lx, ly, llablewidth, llableheight);
    UILabel* plablephone = [ [UILabel alloc] initWithFrame:rect1 ];
    [ plablephone setText:@"手机号:" ];
    [ plablephone setTextAlignment:NSTextAlignmentRight ];
    [ self addSubview:plablephone ];
    
    CGRect rect2 = CGRectMake(lx+llablewidth+lwidthspace, ly, ltextwidth, ltextheight);
    ptextphone = [ [UITextField alloc] initWithFrame:rect2 ];
    [ ptextphone setTextAlignment:NSTextAlignmentLeft ];
    [ ptextphone setText:loginname ];
    [ ptextphone setDelegate:self ];
    [ ptextphone setBackgroundColor:[ UIColor whiteColor ] ];
    [ ptextphone setSecureTextEntry:NO ];
    [ ptextpwd setTag:100 ];
    [ self addSubview:ptextphone ];
    
    ly = ly + ltextheight + lheightspce;
    CGRect rect3 = CGRectMake(lx, ly, llablewidth, llableheight);
    UILabel* plablepwd = [ [UILabel alloc] initWithFrame:rect3 ];
    [ plablepwd setText:@"密码:" ];
    [ plablepwd setTextAlignment:NSTextAlignmentRight ];
    [ self addSubview:plablepwd ];
    
    CGRect rect4 = CGRectMake(lx+llablewidth+lwidthspace, ly, ltextwidth, ltextheight);
    ptextpwd = [ [UITextField alloc] initWithFrame:rect4 ];
    [ ptextpwd setTextAlignment:NSTextAlignmentLeft ];
    [ ptextpwd setText:loginpasswd ];
    [ ptextpwd setSecureTextEntry:YES ];
    [ ptextpwd setDelegate:self ];
    [ ptextpwd setBackgroundColor:[ UIColor whiteColor ] ];
    [ ptextpwd setTag:101 ];
    [ self addSubview:ptextpwd ];
    
    ly = ly + ltextheight+5;
    CGRect typerect1 = CGRectMake(lx, ly, llablewidth, llableheight);
    CGRect typerect2 = CGRectMake(lx+llablewidth+lwidthspace, ly, lbtwidth, lbtheight);

    UILabel*  ptypelable = [ [UILabel alloc] initWithFrame:typerect1 ];
    [ ptypelable setText:@"用户类型:" ];
    [ ptypelable setTextAlignment:NSTextAlignmentRight ];
//    [ self addSubview:ptypelable ];
    
    pbtusertype = [ [UIButton alloc] initWithFrame:typerect2 ];
    [ pbtusertype setTitle:@"用户" forState:UIControlStateNormal ];
    [ pbtusertype setTitle:@"工人" forState:UIControlStateSelected ];
    [ pbtusertype setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pbtusertype addTarget:self action:@selector(ClickUserType:) forControlEvents:UIControlEventTouchUpInside ];
    [ pbtusertype setSelected:NO ];
//    [ self addSubview:pbtusertype ];
    
    ly = ly + ltextheight + lheightspce + 100;
    CGRect rect5 = CGRectMake(lx, ly, lbtwidth, lbtheight);
    UIButton* pbtcancel = [ [UIButton alloc] initWithFrame:rect5 ];
    [ pbtcancel setTitle:@"cancel" forState:UIControlStateNormal ];
    [ pbtcancel setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pbtcancel addTarget:self action:@selector(ClickCancel:) forControlEvents:UIControlEventTouchUpInside ];
    [ self addSubview:pbtcancel ];
    
    lx = lx + lbtwidth + lwidthspace;
    CGRect rect6 = CGRectMake(lx, ly, lbtwidth, lbtheight);
    UIButton* pbtsubmit = [ [UIButton alloc] initWithFrame:rect6 ];
    [ pbtsubmit setTitle:@"submit" forState:UIControlStateNormal ];
    [ pbtsubmit setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pbtsubmit addTarget:self action:@selector(ClickSubmit:) forControlEvents:UIControlEventTouchUpInside ];
    [ self addSubview:pbtsubmit ];
    
    lx = lx + lbtwidth + lwidthspace;
    CGRect rect7 = CGRectMake(lx, ly, lbtwidth, lbtheight);
    UIButton* pbtregister = [ [UIButton alloc] initWithFrame:rect7 ];
    [ pbtregister setTitle:@"register" forState:UIControlStateNormal ];
    [ pbtregister setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pbtregister addTarget:self action:@selector(ClickRegister:) forControlEvents:UIControlEventTouchUpInside ];
    [ self addSubview:pbtregister ];
    
    [ self addGesture ];
}

- (void)addGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickRestRect:)];
    tap.numberOfTouchesRequired = 1; //手指数
    tap.numberOfTapsRequired = 1; //tap次数
    [self addGestureRecognizer:tap];
}

-(void) ClickUserType:(id)sender
{
    UIButton* pbt = (UIButton*)sender;
    
    if (pbt.selected)
    {
        [ pbt setSelected:NO ];
    }
    else
    {
        [ pbt setSelected:YES ];
    }
}

-(void) ClickRestRect:(UITapGestureRecognizer *)tap
{
    [ ptextpwd resignFirstResponder ];
    [ ptextphone resignFirstResponder ];
}

-(void) ClickCancel:(id)sender
{
    [ [CMyLocalDatas SharedLocalDatas] setlocalusertype:0 ];
    [ [CMyLocalDatas SharedLocalDatas] setlocaluserid:@"" ];
    [ [CMyLocalDatas SharedLocalDatas] setlocaltoken:@"" ];
    [ [CMyLocalDatas SharedLocalDatas] setlocaluserphone:@"" ];
    [ [CMyLocalDatas SharedLocalDatas] savelocalinfo ];
    
    MainViewControler* pmainview = [ [MainViewControler alloc] init ];
    self.window.rootViewController = pmainview;
    return ;
}

-(void) ClickSubmit:(id)sender
{
    NSString* sphone = ptextphone.text;
    NSString* spwd = ptextpwd.text;
    
#if (__TYPE__==__USER__)
    NSString* stype = [ NSString stringWithFormat:@"1" ];
#else if( __TYPE__==__WORKER__ )
    NSString* stype = [ NSString stringWithFormat:@"2" ];
#endif

    CMyUserLoginParements* ploginparament = [ [CMyUserLoginParements alloc] initWitData:sphone pwd:spwd type:stype  ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserLogin:[ ploginparament GetServerInterfaceParamens ] ];
    CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([ pserverresult GetResult ])
    {
        NSString* stoken = [ NSString stringWithString:[ pserverresult GetToken ] ];
        NSDictionary* pdata     = [ pserverresult GetResultData ];
        NSString* suserphone    = [ pdata objectForKey:UserMobile ];
        NSString* susertype     = [ pdata objectForKey:UserType ];
        NSString* suserid       = [ pdata objectForKey:UserID ];
        NSString* susername     = [ pdata objectForKey:UserName ];
        NSString* suserstatus   = [ pdata objectForKey:UserStatus ];
        NSString* suseraddress  = [ pdata objectForKey:UserAddress ];
        
        [ [CMyLocalDatas SharedLocalDatas] setlocaluserstatus:suserstatus];
        [ [CMyLocalDatas SharedLocalDatas] setlocaluseraddress:suseraddress];
        [ [CMyLocalDatas SharedLocalDatas] setlocalusernickname:susername ];
        [ [CMyLocalDatas SharedLocalDatas] setlocaluserphone:suserphone ];
        [ [CMyLocalDatas SharedLocalDatas] setlocaltoken:stoken ];
        [ [CMyLocalDatas SharedLocalDatas] setlocaluserid:suserid ];
        [ [CMyLocalDatas SharedLocalDatas] setlocalusertype:[ susertype integerValue ] ];
        
        [ [CMyLocalDatas SharedLocalDatas] savelocalinfo ];
        
        NSLog(@"login success");
    }
    else
    {
        NSLog(@"login failed");
    }
    
    MainViewControler* pmainview = [ [MainViewControler alloc] init ];
    self.window.rootViewController = pmainview;
}

-(void) ClickRegister:(id)sender
{
    MainViewControler* pmainview = [ [MainViewControler alloc] init ];
    self.window.rootViewController = pmainview;
    NSLog(@"------%s-----", __FUNCTION__);
}

#pragma mark UITextViewDelegate
// return NO to disallow editing.
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"------%s-----", __FUNCTION__);
    return YES;
}

// became first responder
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"------%s-----", __FUNCTION__);
}

// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"------%s-----", __FUNCTION__);
    return YES;
}

// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [ textField resignFirstResponder ];
    NSLog(@"------%s-----", __FUNCTION__);
}

// return NO to not change text
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"------%s-----", __FUNCTION__);
    return YES;
}

// called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"------%s-----", __FUNCTION__);
    return YES;
}

// called when 'return' key pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"------%s-----", __FUNCTION__);
    [ textField resignFirstResponder ];
    return YES;
}


@end
