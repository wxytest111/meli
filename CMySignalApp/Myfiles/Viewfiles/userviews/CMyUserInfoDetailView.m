//
//  CMyUserInfoDetailView.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/11.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyUserInfoDetailView.h"

#import "CMyNetWorkInterface.h"

#import "UIViewExt.h"


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
    CGRect imagerect = CGRectMake(10, 10, 100, 100);
    NSString* simage = [ NSString stringWithFormat:@"%@", [ [CMyLocalDatas SharedLocalDatas] getlocaluserid ] ];
    pimageview = [ [UIImageView alloc] init ];
//    [pimageview setImage:[ UIImage imageNamed:simage ]];
    [pimageview setImage:[ UIImage imageNamed:USER_DEFAULT_BOY_IMAGE ]];
    [ self addSubview:pimageview ];
    pimageview.frame = imagerect;

    CGRect namerect = CGRectMake(100+10+10, 10+5, ScreenWidth-(100+10+10), 30);
    NSString* susername = [ NSString stringWithFormat:@"昵称：%@", [  [CMyLocalDatas SharedLocalDatas] getlocalusernickname ] ];
    plablename = [ [UILabel alloc] init ];
    [ plablename setText:susername ];
    [ self addSubview:plablename ];
    plablename.frame = namerect;
    
    CGRect mobilerect = CGRectMake(100+10+10, 10+5+30+5, ScreenWidth-(100+10+10), 30);
    NSString* susermobile = [ NSString stringWithFormat:@"昵称：%@", [  [CMyLocalDatas SharedLocalDatas] getlocaluserphone ] ];
    plablemobile = [ [UILabel alloc] init ];
    [ plablemobile setText:susermobile ];
    [ self addSubview:plablemobile ];
    plablemobile.frame = mobilerect;
    
    CGRect addresrect = CGRectMake( 10, 100+10, ScreenWidth, 60);
    NSString* suseraddres = [ NSString stringWithFormat:@"地址：%@", [  [CMyLocalDatas SharedLocalDatas] getlocaluseraddress ] ];
    plableaddress = [ [UILabel alloc] init ];
    [ plableaddress setText:suseraddres ];
    [ self addSubview:plableaddress ];
    [ plableaddress setNumberOfLines:0 ];
    plableaddress.frame = addresrect;

    CGRect hisrect = CGRectMake( 10, 100+10+60+10, ScreenWidth, 60);
    NSString* suserhistory = [ NSString stringWithFormat:@"总计：%d，成功：%d， 爽约：%d", 50, 40, 10 ];
    plablehistory = [ [UILabel alloc] init ];
    [ plablehistory setText:suserhistory ];
    [ self addSubview:plablehistory ];
    [ plablehistory setNumberOfLines:0 ];
    plablehistory.frame = hisrect;
}


@end
