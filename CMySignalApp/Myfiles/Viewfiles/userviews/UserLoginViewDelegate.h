//
//  UserLoginViewDelegate.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#ifndef CMySignalApp_UserLoginViewDelegate_h
#define CMySignalApp_UserLoginViewDelegate_h


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
