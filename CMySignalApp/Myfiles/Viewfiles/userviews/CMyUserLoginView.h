//
//  CMyUserLoginView.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserLoginViewDelegate.h"


@interface CMyUserLoginView : UIView < UITextFieldDelegate>
{
    id<UserLoginViewDelegate>   puserlogindelegate;
    
    UITextField* ptextpwd;
    UITextField* ptextphone;
    UIButton*   pbtusertype;
}

@property   (atomic) id<UserLoginViewDelegate>   userlogindelegate;

-(void) lineviews;

- (void)addGesture;
-(void) ClickRestRect:(UITapGestureRecognizer *)tap;

-(void) ClickCancel:(id)sender;
-(void) ClickSubmit:(id)sender;
-(void) ClickRegister:(id)sender;

@end
