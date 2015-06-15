//
//  CMyUserRegisterView.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserLoginViewDelegate.h"

@interface CMyUserRegisterView : UIView < UITextFieldDelegate >
{
    UILabel*        plableusername;
    UITextField*     ptextusername;
    
    UILabel*        plableuserpwd;
    UITextField*     ptextuserpwd;
    
    UILabel*        plableusertype;
    UIButton*       pbtusertype;
    UILabel*        plabletypedesc;
    
    UIButton*       pbtcancel;
    UIButton*       pbtsubmit;
    
    UILabel*        plablemsgcode;
    UITextField*    ptextmsgcode;
    UIButton*       pbtmsgcode;
    NSInteger       ltimerest;
    
    NSTimer*        atimer;
    id<UserLoginViewDelegate>   puserviewdelegate;
}

@property   (atomic) id<UserLoginViewDelegate>   userlogindelegate;

-(void) lineviews;

- (void)addGesture;
-(void) ClickRestRect:(UITapGestureRecognizer *)tap;


-(void) ClickCancel:(id)sender;
-(void) ClickSubmit:(id)sender;
-(void) ClickUserType:(id)sender;
-(void) ClickGetMsgCode:(id)sender;

-(void) Enablemsgcodebt;

-(void) closeinput;

@end
