//
//  CMyServerResultData.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JSON.h"
#import "MyMD5.h"

#import "globaldefine.h"

#define REQUEST_RESULT_RESULT               @"result"
#define REQUEST_RESULT_ERRORCODE            @"errorCode"
#define REQUEST_RESULT_ERRORSTRING          @"errorMsg"
#define REQUEST_RESULT_DATA                 @"data"
#define REQUEST_RESULT_TOKEN                @"token"

@interface CMyServerResultData : NSObject
{
    NSDictionary* m_pResultData;
}

-(instancetype) initWithResultData:(NSString*)sResult;

-(NSInteger) GetResult;
-(NSInteger) GetErrorCode;
-(NSString*) GetErrorString;
-(NSString*) GetToken;
-(id) GetResultData;


@end