//
//  CMyUserInfoDetailView.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserLoginViewDelegate.h"

@interface CMyUserInfoDetailView : UIScrollView
{
    id<UserInfoDetailViewDelegate>  puserdetaildelegate;
    
    UIImageView*    pimageview;
    UILabel*        plablename;
    UILabel*        plablemobile;
    UILabel*        plableaddress;
    UILabel*        plablehistory;
}

@property   (atomic) id<UserInfoDetailViewDelegate>  userdetaildelegate;

-(void) lineviews;


@end
