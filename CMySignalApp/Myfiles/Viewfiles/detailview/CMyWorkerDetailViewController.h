//
//  CMyWorkerDetailViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMyWorkerDetailViewController : UIViewController
{
    UIButton* pbackbt;
    UIButton* pcreateorderbt;
}

-(void) setworker:(NSDictionary*)pdic;

-(void) Clickbackbt:(id)sender;
-(void) ClickCreatOrder:(id)sender;


@end
