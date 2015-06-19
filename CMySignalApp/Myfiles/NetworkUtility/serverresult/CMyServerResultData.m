//
//  CMyServerResultData.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyServerResultData.h"

@implementation CMyServerResultData

-(instancetype) initWithResultData:(NSString*)sResult
{
    self = [ super init ];
    
    if (self)
    {
        assert(sResult);
        CCMySBJsonParser *parser = [[CCMySBJsonParser alloc] init];
        m_pResultData = [ [ NSDictionary alloc] initWithDictionary:[parser objectWithString:sResult ]];
    }
    return self;
}

-(NSInteger) GetResult
{
    NSString* sresult = [ NSString stringWithFormat:@"%@", [ m_pResultData objectForKey:REQUEST_RESULT_RESULT ] ];
    return [ sresult integerValue ];
}

-(NSInteger) GetErrorCode;
{
    NSString* sresult = [ NSString stringWithString:[ m_pResultData objectForKey:REQUEST_RESULT_ERRORCODE ] ];
    return [ sresult integerValue ];
}

-(NSString*) GetErrorString;
{
    return [ NSString stringWithString:[ m_pResultData objectForKey:REQUEST_RESULT_ERRORSTRING ] ];
}
-(NSString*) GetToken
{
    return [ NSString stringWithString:[ m_pResultData objectForKey:REQUEST_RESULT_TOKEN ] ];
}

-(id) GetResultData
{
    id adata = [ m_pResultData objectForKey:REQUEST_RESULT_DATA ];
    return adata;
}

@end
