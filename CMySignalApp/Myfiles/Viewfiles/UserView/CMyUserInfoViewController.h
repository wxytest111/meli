//
//  CMyUserInfoViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/9.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserLoginViewDelegate.h"

#import "ModuleViewBaseViewController.h"

// 用户信息界面

@interface CMyUserInfoViewController : ModuleViewBaseViewController < UserLoginViewDelegate , UserInfoDetailViewDelegate>
{
    BOOL bleftbt;
}


@end
