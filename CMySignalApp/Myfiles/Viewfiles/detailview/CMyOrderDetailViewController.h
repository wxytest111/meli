//
//  CMyOrderDetailViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMyOrderDetailViewController : UIViewController
{
    UIButton*       pbackbt;
    NSDictionary*   porderinfo;
}

-(void) ClickBackBt:(id)sender;


-(void) setorderinfo:(NSDictionary*)porder;

@end
