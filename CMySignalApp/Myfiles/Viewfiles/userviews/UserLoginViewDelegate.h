//
//  UserLoginViewDelegate.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#ifndef CMySignalApp_UserLoginViewDelegate_h
#define CMySignalApp_UserLoginViewDelegate_h


#define UserAddress     @"address"
#define UserStatus      @"status"
#define UserMobile      @"mobile"
#define UserType        @"user_type"

#if (__TYPE__==__USER__)

#define UserID          @"customer_id"
#define UserName        @"nick_name"

#else if( __TYPE__==__WORKER__ )

#define UserID          @"worker_id"
#define UserName        @"name"

#endif

@protocol UserLoginViewDelegate <NSObject>

-(void) BtClickCancel:(id)sender;
-(void) BTClickSubmit:(id)sender;
-(void) BTClickRegister:(id)sender;

@end

@protocol UserInfoDetailViewDelegate <NSObject>

-(void) BtClickBack:(id)sender;
-(void) BtClickUplevel:(id)sender;

@end

#endif
