//
//  CMyUserRegisterView.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserRegisterView.h"

#import "CMyNetWorkInterface.h"


@implementation CMyUserRegisterView

@synthesize userlogindelegate = puserviewdelegate;

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
    NSInteger lx = 20;
    NSInteger ly = 50;
    
    NSInteger llablewidth = 80;
    NSInteger llableheight = 30;
    
    NSInteger ltextwidth = 150;
    NSInteger ltextheight = llableheight;
    
    NSInteger lheightspace = 5;
    NSInteger lwidthspace = 10;
    
    plableusername = [ [UILabel alloc] init ];
    [ plableusername setText:@"用户名:" ];
    [ plableusername setTextAlignment:NSTextAlignmentRight ];
    [ self addSubview:plableusername ];
    
    plableuserpwd = [ [UILabel alloc] init ];
    [ plableuserpwd setText:@"密码:" ];
    [ plableuserpwd setTextAlignment:NSTextAlignmentRight ];
    [ self addSubview:plableuserpwd ];

    plableusertype = [ [UILabel alloc] init ];
    [ plableusertype setText:@"用户类型:" ];
    [ plableusertype setTextAlignment:NSTextAlignmentRight ];
    [ self addSubview:plableusertype ];

    plabletypedesc = [ [UILabel alloc] init ];
    [ plabletypedesc setText:@"点击更改用户" ];
    [ plabletypedesc setTextAlignment:NSTextAlignmentRight ];
    [ self addSubview:plabletypedesc ];
    
    ptextusername = [ [UITextField alloc] init ];
    [ ptextusername setTextAlignment:NSTextAlignmentLeft ];
//    [ ptextusername setText:@"17792039701" ];
    [ ptextusername setSecureTextEntry:NO ];
    [ ptextusername setDelegate:self ];
    [ ptextusername setBackgroundColor:[ UIColor whiteColor ] ];
    [ ptextusername setTag:100 ];
    [ ptextusername setAutocorrectionType:UITextAutocorrectionTypeNo ];
//    [ ptextusername setKeyboardType:UIKeyboardTypeDefault ];
    [ ptextusername setPlaceholder:@"输入手机号" ];
    [ self addSubview:ptextusername ];
    
    ptextuserpwd = [ [UITextField alloc] init ];
//    [ ptextuserpwd setText:@"123456" ];
    [ ptextuserpwd setSecureTextEntry:NO ];
    [ ptextuserpwd setBackgroundColor:[ UIColor whiteColor ] ];
    [ ptextuserpwd setTag:101 ];
    [ ptextuserpwd setDelegate:self ];
    [ ptextuserpwd setAutocorrectionType:UITextAutocorrectionTypeNo ];
    [ self addSubview:ptextuserpwd ];
    
    pbtusertype = [ [UIButton alloc] init ];
    [ pbtusertype setTitle:@"用户" forState:UIControlStateNormal ];
    [ pbtusertype setTitle:@"工人" forState:UIControlStateSelected ];
    [ pbtusertype setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pbtusertype addTarget:self action:@selector(ClickUserType:) forControlEvents:UIControlEventTouchUpInside ];
    [ pbtusertype setSelected:NO ];
    [ self addSubview:pbtusertype ];
    
    CGRect namerect1 = CGRectMake(lx, ly, llablewidth, llableheight);
    [ plableusername setFrame:namerect1 ];
    CGRect namerect2 = CGRectMake(lx+llablewidth+lwidthspace, ly, ltextwidth, ltextheight);
    [ ptextusername setFrame:namerect2 ];
    
    ly = ly + llableheight+lheightspace;
    CGRect pwdrect1 = CGRectMake(lx, ly, llablewidth, llableheight);
    [ plableuserpwd setFrame:pwdrect1 ];
    CGRect pwdrect2 = CGRectMake(lx+llablewidth+lwidthspace, ly, ltextwidth, ltextheight);
    [ ptextuserpwd setFrame:pwdrect2 ];
    
    ly = ly + llableheight+lheightspace;
    CGRect typerect1 = CGRectMake(lx, ly, llablewidth, llableheight);
    [ plableusertype setFrame:typerect1 ];
    CGRect typerect2 = CGRectMake(lx+llablewidth+lwidthspace, ly, 80, 40);
    [ pbtusertype setFrame:typerect2 ];
    CGRect typerect3 = CGRectMake(typerect2.origin.x+typerect2.size.width+lwidthspace, ly, 140, llableheight);
    [ plabletypedesc setFrame:typerect3 ];
    
    ly = ly + 40 + lheightspace;
    
    /*
    UILabel*        plablemsgcode;
    UITextField*    ptextmsgcode;
    UIButton*       pbtmsgcode;
    */
    
    plablemsgcode = [ [UILabel alloc] init ];
    [ plablemsgcode setText:@"验证码:" ];
    [ plablemsgcode setTextAlignment:NSTextAlignmentRight ];
    [ self addSubview:plablemsgcode ];
    
    ptextmsgcode = [ [UITextField alloc] init ];
    [ ptextmsgcode setTextAlignment:NSTextAlignmentLeft ];
    [ ptextmsgcode setText:@"" ];
    [ ptextmsgcode setSecureTextEntry:NO ];
    [ ptextmsgcode setDelegate:self ];
    [ ptextmsgcode setBackgroundColor:[ UIColor whiteColor ] ];
    [ ptextmsgcode setTag:102 ];
    [ ptextmsgcode setPlaceholder:@"输入验证码" ];
//    [ ptextusername setKeyboardType:UIKeyboardTypeNumberPad ];
    [ self addSubview:ptextmsgcode ];
    
    pbtmsgcode = [ [UIButton alloc] init ];
    [ pbtmsgcode setTitle:@"获取验证码" forState:UIControlStateNormal ];
    [ pbtmsgcode setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pbtmsgcode addTarget:self action:@selector(ClickGetMsgCode:) forControlEvents:UIControlEventTouchUpInside ];
    [ self addSubview:pbtmsgcode ];

    CGRect msgrect1 = CGRectMake(lx, ly, llablewidth, llableheight);
    [ plablemsgcode setFrame:msgrect1 ];
    CGRect msgrect2 = CGRectMake(lx+llablewidth+lwidthspace, ly, 100, ltextheight);
    [ ptextmsgcode setFrame:msgrect2 ];
    CGRect msgrect3 = CGRectMake(msgrect2.origin.x+msgrect2.size.width+lwidthspace , ly, 120, 40);
    [ pbtmsgcode setFrame:msgrect3 ];

    ly = ly + 40 + lheightspace;
    pbtcancel = [ [UIButton alloc] init ];
    [ pbtcancel setTitle:@"取消" forState:UIControlStateNormal ];
    [ pbtcancel setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pbtcancel addTarget:self action:@selector(ClickCancel:) forControlEvents:UIControlEventTouchUpInside ];
    [self addSubview:pbtcancel];
    
    pbtsubmit = [ [UIButton alloc] init ];
    [ pbtsubmit setTitle:@"注册" forState:UIControlStateNormal ];
    [ pbtsubmit setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pbtsubmit addTarget:self action:@selector(ClickSubmit:) forControlEvents:UIControlEventTouchUpInside ];
    [self addSubview:pbtsubmit];

    CGRect cancelrect = CGRectMake(lx, ly, 80, 40);
    [ pbtcancel setFrame:cancelrect ];
    
    CGRect submitrect = CGRectMake(lx+cancelrect.size.width+lwidthspace, ly, 80, 40);
    [ pbtsubmit setFrame:submitrect ];
    
    [ self addGesture ];
}

- (void)addGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickRestRect:)];
    tap.numberOfTouchesRequired = 1; //手指数
    tap.numberOfTapsRequired = 1; //tap次数
    [self addGestureRecognizer:tap];
}

-(void) ClickRestRect:(UITapGestureRecognizer *)tap
{
    [ self closeinput ];
}

-(void) closeinput
{
    [ ptextuserpwd resignFirstResponder ];
    [ ptextusername resignFirstResponder ];
}

-(void) ClickCancel:(id)sender
{
    [ self closeinput ];
    [ atimer invalidate ];
    
    [ puserviewdelegate BtClickCancel:sender ];
}

-(void) ClickSubmit:(id)sender
{
    [ self closeinput ];
    [ atimer invalidate ];
    
    [ puserviewdelegate BTClickSubmit:sender ];
}

-(void) ClickUserType:(id)sender
{
    [ self closeinput ];
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

-(void) ClickGetMsgCode:(id)sender
{
    NSLog(@"------%s-----", __FUNCTION__);
    UIButton* pbt = (UIButton*)sender;
    
    ltimerest = 60;
    NSString* str = [ NSString stringWithFormat:@"%ld秒后重试", ltimerest ];
    [ pbt setTitle:str forState:UIControlStateDisabled ];
    [ pbt setEnabled:NO ];
    
    atimer = [ NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(Enablemsgcodebt) userInfo:nil repeats:YES ];
    [[NSRunLoop currentRunLoop]addTimer:atimer forMode:NSDefaultRunLoopMode];
    
    NSString* sphone = [ ptextusername text ];
    
    CMyGetMsgCodeParaments* pmsgcodeparaments = [ [CMyGetMsgCodeParaments alloc] initWithData:sphone type:@"0" ];
    NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserMsgCode:[ pmsgcodeparaments GetServerInterfaceParamens ] ];
    CMyServerResultData* presult = [ [CMyServerResultData alloc] initWithResultData:sret ];
    if ([presult GetResult] == SERVER_RESULT_SUCC)
    {
        NSLog(@"get msg code successful");
    }
    else
    {
        ;
    }
}

-(void) Enablemsgcodebt
{
    ltimerest--;
    if (ltimerest == 0)
    {
        [ atimer invalidate ];
        [pbtmsgcode setEnabled:YES];
        return;
    }
    
    NSString* str = [ NSString stringWithFormat:@"%ld秒后重试", ltimerest ];
    [ UIView beginAnimations:nil context:nil ];
    [ pbtmsgcode setTitle:str forState:UIControlStateDisabled ];
    [ UIView commitAnimations ];
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
