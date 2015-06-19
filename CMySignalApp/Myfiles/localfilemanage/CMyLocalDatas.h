//
//  CMyLocalDatas.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "globaldefine.h"

#define LOCAL_USERPHONE_KEY         @"userphone"
#define LOCAL_USERID_KEY            @"userid"
#define LOCAL_TOKEN_KEY             @"token"
#define LOCAL_USERLEVEL_KEY         @"userlevel"
#define LOCAL_USERTYPE_KEY          @"usertype"
#define LOCAL_NICKNAME_KEY          @"nickname"
#define LOCAL_ADDRESS_KEY           @"address"
#define LOCAL_STATUS_KEY            @"status"

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

-(void)     cleanlocalinfos;

-(BOOL)      getlocallogined;

-(NSString*) getlocaluserid;
-(void)      setlocaluserid:(NSString*)suserid;

-(NSString*) getlocaluserphone;
-(void)      setlocaluserphone:(NSString*)sphone;

-(NSString*) getlocalusernickname;
-(void)      setlocalusernickname:(NSString*)sphone;

-(NSString*) getlocaluseraddress;
-(void)      setlocaluseraddress:(NSString*)sphone;

-(NSString*) getlocaltoken;
-(void)      setlocaltoken:(NSString*)stoken;

-(NSString*) getlocaluserstype;
-(NSInteger) getlocalusertype;
-(void)      setlocalusertype:(NSInteger)ltype;

-(NSString*) getlocaluserlevel;
-(void)      setlocaluserlevel:(NSString*)suserlevel;

-(NSString*) getlocaluserstatus;
-(void)      setlocaluserstatus:(NSString*)suserstatus;

-(void)      loginwithyouke;


@end
