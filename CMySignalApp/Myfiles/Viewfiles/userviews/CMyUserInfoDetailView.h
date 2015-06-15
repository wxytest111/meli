//
//  CMyUserInfoDetailView.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserLoginViewDelegate.h"

@interface CMyUserInfoDetailView : UIView
{
    id<UserInfoDetailViewDelegate>  puserdetaildelegate;
}

@property   (atomic) id<UserInfoDetailViewDelegate>  userdetaildelegate;

-(void) lineviews;


@end
