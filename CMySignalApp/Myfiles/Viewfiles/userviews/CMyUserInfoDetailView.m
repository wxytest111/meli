//
//  CMyUserInfoDetailView.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserInfoDetailView.h"

#import "CMyNetWorkInterface.h"


@implementation CMyUserInfoDetailView

@synthesize userdetaildelegate = puserdetaildelegate;

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [ super initWithFrame:frame ];
    
    if (self)
    {
        [ self setBackgroundColor:[ UIColor grayColor ] ];
        [ self lineviews ];
    }
    
    return self;
}


-(void) lineviews
{
    ;
}



@end
