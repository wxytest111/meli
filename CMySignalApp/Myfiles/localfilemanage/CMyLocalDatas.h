//
//  CMyLocalDatas.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "globaldefine.h"

#define LOCAL_USERID_KEY            @"userid"
#define LOCAL_TOKEN_KEY             @"token"
#define LOCAL_USERLEVEL_KEY         @"userlevel"
#define LOCAL_USERTYPE_KEY          @"usertype"


@interface CMyLocalDatas : NSObject
{
    NSFileManager*              m_pfilemanager;
    NSMutableDictionary*        m_plocalInfodic;
}

+(CMyLocalDatas*) SharedLocalDatas;

-(void) createfolders;

-(NSString*) getphotopath;

-(BOOL)     isExistAnImage:(NSString*)sid;
-(void)     WriteAnImage:(NSString*)sid image:(NSData*)pdata;

-(NSString*) getlocalinfofilename;
-(void) loadlocalinfo;
-(void) savelocalinfo;
-(NSMutableDictionary*) GetLocalInfo;

-(NSString*) getlocaluserid;
-(void)      setlocaluserid:(NSString*)suserid;

-(NSString*) getlocaltoken;
-(void)      setlocaltoken:(NSString*)stoken;

-(NSString*) getlocaluserstype;
-(NSInteger) getlocalusertype;
-(void)      setlocalusertype:(NSInteger)ltype;

-(NSString*) getlocaluserlevel;
-(void)      setlocaluserlevel:(NSString*)suserlevel;

-(void)      loginwithyouke;


@end
