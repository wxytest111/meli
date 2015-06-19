//
//  CMyTableViewCell.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyTableViewCell.h"

#import "CMyServerResultData.h"


@implementation CMyTableViewCell


-(instancetype) initWithData:(CGRect)arect pdata:(NSDictionary*)pdic type:(NSInteger)ltype
{
    self = [ super init ];
    
    if (self)
    {
        viewtype = ltype;
        [self setFrame:arect];
    }
    
    return self;
}

-(void) updateview:(NSDictionary*)pdic type:(NSInteger)ltype
{
    CGRect arect = self.frame;
    CGRect imagerect = CGRectMake(5, 2, arect.size.height-2*2, arect.size.height-2*2);
    UIImageView* pimageview = [ [UIImageView alloc] initWithFrame:imagerect ];
    [ self addSubview:pimageview ];
    [ pimageview setImage:[ UIImage imageNamed:USER_DEFAULT_IMAGE ] ];
    
    CGRect namerect = CGRectMake(imagerect.origin.x + imagerect.size.width + 20, 5, arect.size.width-imagerect.size.width-20-20, 15);
    UILabel* pusername = [ [UILabel alloc] initWithFrame:namerect ];
    [ self addSubview:pusername ];
    [ pusername setText:@"username" ];
    [ pusername setTextAlignment:NSTextAlignmentLeft ];
    
    CGRect descrect = CGRectMake(namerect.origin.x, namerect.origin.y + namerect.size.height + 5, namerect.size.width, namerect.size.height);
    UILabel* puserdesc = [ [UILabel alloc] initWithFrame:descrect ];
    [ self addSubview:puserdesc ];
    [ puserdesc setText:@"this worker is good" ];
    [ puserdesc setTextAlignment:NSTextAlignmentLeft ];
}

-(void) createappview:(NSDictionary*)pdic
{
    ;
}

-(void) createproductview:(NSDictionary*)pdic
{
    ;
}

-(void) createworkerview:(NSDictionary*)pdic
{
    ;
}

-(void) updateappview:(NSDictionary*)pdic
{
    ;
}

-(void) updateproductview:(NSDictionary*)pdic
{
    ;
}

-(void) updateworkerview:(NSDictionary*)pdic
{
    ;
}

@end
