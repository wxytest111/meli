//
//  CMyLocalDatas.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyLocalDatas.h"

#import "CMyNetWorkInterface.h"


#define SYSTEM_FOLDER_BASE_PATH                     @"Documents"
#define SYSTEM_FOLDER_PHOTO_PATH                    @"images"

#define LOCAL_INFO_FILENAME                         @"localdata"


CMyLocalDatas*      g_localdatas;

@implementation CMyLocalDatas

+(CMyLocalDatas*) SharedLocalDatas
{
    if (!g_localdatas)
    {
        g_localdatas = [ [CMyLocalDatas alloc] init ];
    }
    
    return g_localdatas;
}

-(instancetype) init
{
    self = [ super init ];
    
    if (self)
    {
        [ self initmyself ];
    }
    
    return self;
}

-(void)     initmyself
{
    m_pfilemanager = [ [NSFileManager alloc] init ];
    [ self loadlocalinfo ];
    [ self createfolders ];
    
    if ([ self getlocaluserid ] == nil)
    {
        [ self loginwithyouke ];
    }
}

-(void)      loginwithyouke
{
    while (0)
    {
        NSString* sret = [ [CMyNetWorkInterface SharedNetWork] UserLoginWithyouke:nil ];
        CMyServerResultData* pserverresult = [ [CMyServerResultData alloc] initWithResultData:sret ];
        if ([pserverresult GetResult]==SERVER_RESULT_SUCC)
        {
            NSDictionary* puserinfo = [ pserverresult GetResultData ];
            [ [CMyLocalDatas SharedLocalDatas] setlocaluserid:[ puserinfo objectForKey:@"user_id" ] ];
            [ [CMyLocalDatas SharedLocalDatas] setlocaltoken:[ pserverresult GetToken ] ];
            NSString* stype = [ NSString stringWithString:[ puserinfo objectForKey:@"user_type"  ] ];
            [ [CMyLocalDatas SharedLocalDatas] setlocalusertype:[ stype integerValue ] ];
            
            [ [CMyLocalDatas SharedLocalDatas] savelocalinfo ];
            return;
        }
    }
}

-(NSString*) getlocalinfofilename
{
    NSString* sdocpath = [NSHomeDirectory() stringByAppendingPathComponent:SYSTEM_FOLDER_BASE_PATH];
    return [ NSString stringWithFormat:@"%@/%@", sdocpath, LOCAL_INFO_FILENAME ];
}

-(NSString*) getphotopath
{
    NSString* sdocpath = [NSHomeDirectory() stringByAppendingPathComponent:SYSTEM_FOLDER_BASE_PATH];
    return [ NSString stringWithFormat:@"%@/%@/", sdocpath, SYSTEM_FOLDER_PHOTO_PATH ];
}

-(BOOL)     isExistAnImage:(NSString*)sid
{
    NSString* sfilename = [ NSString stringWithFormat:@"%@%@.png", [ self getphotopath ], sid ];
    return [ self IsExitsFile:sfilename ];
}

-(void)     WriteAnImage:(NSString*)sid image:(NSData*)pdata
{
    NSString* sfilename = [ NSString stringWithFormat:@"%@%@.png", [ self getphotopath ], sid ];
    [ pdata writeToFile:sfilename atomically:YES ];
}

-(NSString*) getlocaluserid
{
    return [ m_plocalInfodic objectForKey:LOCAL_USERID_KEY ];
}

-(void)      setlocaluserid:(NSString*)suserid
{
    [  m_plocalInfodic setObject:suserid forKey:LOCAL_USERID_KEY];
}

-(NSString*) getlocaltoken
{
    return [ m_plocalInfodic objectForKey:LOCAL_TOKEN_KEY ];
}

-(void)      setlocaltoken:(NSString*)stoken
{
    [  m_plocalInfodic setObject:stoken forKey:LOCAL_TOKEN_KEY];
}

-(NSString*) getlocaluserstype
{
    return [ m_plocalInfodic objectForKey:LOCAL_USERTYPE_KEY ];
}

-(NSInteger) getlocalusertype
{
    NSString* stype = [ m_plocalInfodic objectForKey:LOCAL_USERTYPE_KEY ];
    if (stype)
    {
        return [ stype integerValue ];
    }
    else
    {
        return USER_TYPE_OTHER;
    }
}

-(void)      setlocalusertype:(NSInteger)ltype
{
    [  m_plocalInfodic setObject:[ NSNumber numberWithInteger:ltype ] forKey:LOCAL_USERTYPE_KEY ];
}

-(NSString*) getlocaluserlevel
{
    return [ m_plocalInfodic objectForKey:LOCAL_USERLEVEL_KEY ];
}

-(void)      setlocaluserlevel:(NSString*)suserlevel
{
    [  m_plocalInfodic setObject:suserlevel forKey:LOCAL_USERLEVEL_KEY];
}

-(void) loadlocalinfo
{
    [ self Loadfile:[ self getlocalinfofilename ] ];
}

-(void) savelocalinfo
{
    [ self Savedatafile:[ self getlocalinfofilename ] data:m_plocalInfodic ];
}

-(BOOL) IsExitsFile:(NSString*)sfilename
{
    if (![ m_pfilemanager fileExistsAtPath:sfilename ])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

-(NSMutableDictionary*) GetLocalInfo
{
    return m_plocalInfodic;
}

-(NSMutableDictionary*) Loadfile:(NSString*)sfilename
{
    if (![ self IsExitsFile:sfilename ])
    {
        return [ [NSMutableDictionary alloc] init ];
    }
    
    return [ [NSMutableDictionary alloc] initWithContentsOfFile:sfilename ];
}

-(BOOL)     Removefile:(NSString*)sfilename
{
    return [ m_pfilemanager removeItemAtPath:sfilename error:nil ];
}


-(BOOL) Savedatafile:(NSString*)sfilename data:(NSMutableDictionary*)pdata
{
    [ self Removefile:sfilename ];
    return [ pdata writeToFile:sfilename atomically:YES ];
}

-(void) createfolders
{
    [ self CreateAnFolder:[ self getphotopath ] ];
}

-(void) CreateAnFolder:(NSString*)sfilepath
{
    BOOL bisPath = NO;
    BOOL bisexits = [ m_pfilemanager fileExistsAtPath:sfilepath isDirectory:&bisPath ];
    if (bisexits)
    {
        if (!bisPath)
        {
            [ m_pfilemanager removeItemAtPath:sfilepath error:nil ];
            [ m_pfilemanager createDirectoryAtPath:sfilepath withIntermediateDirectories:YES attributes:nil error:nil ];
        }
    }
    else
    {
        [ m_pfilemanager createDirectoryAtPath:sfilepath withIntermediateDirectories:YES attributes:nil error:nil ];
    }
}

@end
