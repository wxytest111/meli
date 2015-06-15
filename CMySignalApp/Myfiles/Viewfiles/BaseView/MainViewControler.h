//
//  MainViewControler.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ItemView.h"
#import "CMyTableView.h"


@interface MainViewControler : UITabBarController < ItemViewDelegate, UINavigationControllerDelegate, MyTableViewDelegate>
{
@private
    UIImageView* m_tabBarBG;
    UIImageView* m_selectView;
    
    NSInteger   lawidth;
}

// 排布用户界面
-(void) lineusercustomtablebarview;
-(void) loaduserallcontrolerview;


// 排布工人界面
-(void) lineworkercustomtablebarview;
-(void) loadworkerallcontrolview;

-(void) showuserloginview;

@end