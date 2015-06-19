//
//  CMyWorkerDetailViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ModuleViewBaseViewController.h"


@interface CMyWorkerDetailViewController : ModuleViewBaseViewController
{
//    UIButton* pbackbt;
//    UIButton* pcreateorderbt;
    
    UIScrollView* pscrolview;
    
    UIImageView* pimageview;
    
    UILabel*    plablename;
    UILabel*    plablestarts;
    UILabel*    plabledesc;
    UILabel*    plableskill;
    
    NSDictionary*       pworkerinfo;
    
    BOOL            border;
}

-(void) setworker:(NSDictionary*)pdic;
-(void) lineviews;

-(void) Clickbackbt:(id)sender;
-(void) ClickCreatOrder:(id)sender;


@end
