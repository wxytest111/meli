//
//  CMyCreateOderViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMyCreateOderViewController : UIViewController
{
    UIButton*   psubmitbt;
    UIButton*   pcancelbt;
}

-(void) ClickSubmitbt:(id)sender;
-(void) ClickCancelbt:(id)sender;

-(void) submitorder;

@end
