//
//  CMyTableView.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/12.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyTableView.h"
#import "CMyTableViewCellView.h"

#define ITEM_BG_SELECTED_IMAGE              @"background_blue"
#define ITEM_BG_NORMAL_IMAGE                @"bg_blue_little"


@implementation CMyTableView

#define BG_IMAGE_NAME       @"tab_bg_all"


@synthesize tableviewdelegate = ptableviewdelegate;

-(instancetype) initWithdata:(CGRect)frame data:(NSArray*)pdata
{
    self = [ super initWithFrame:frame ];
    
    if (self)
    {
        [ self initmyself:pdata ];
    }
    
    return self;
}

-(void) initmyself:(NSArray*)pdata
{
    lselected = -1;
    [ self setImage:[ UIImage imageNamed:BG_IMAGE_NAME ] ];
    
    NSInteger lwidth = self.frame.size.width;
    NSInteger awidth = lwidth/pdata.count;
    
    for (NSInteger i = 0; i < pdata.count; i++)
    {
        CGRect arect = CGRectMake(awidth*i, 0, awidth, self.frame.size.height);
        
        if (i == 0)
        {
            pselectview = [ [UIImageView alloc] initWithFrame:arect ];
            [ pselectview setImage:[ UIImage imageNamed:ITEM_BG_SELECTED_IMAGE ] ];
//            [self addSubview:pselectview];
//            [ pselectview setUserInteractionEnabled:YES ];
        }
        
        CMyTableViewCellView* pcellview = [ [CMyTableViewCellView alloc] initWithdata:arect data:[ pdata objectAtIndex:i ] ];
//        [ pcellview addTarget:self action:@selector(ClickCellView:) forControlEvents:UIControlEventTouchUpInside ];
        [ pcellview setTag:100+i ];
        [ self addSubview:pcellview ];
    }
}

-(void) ClickCellView:(id)sender
{
    CMyTableViewCellView* pcellview = (CMyTableViewCellView*)sender;
    NSInteger lindex = pcellview.tag;
    
    [ UIView beginAnimations:nil context:NULL ];
    [ pselectview setFrame:pcellview.frame ];
    [ UIView commitAnimations ];
    
    [ ptableviewdelegate didItemView:lindex ];
}

-(void) setDefaultSelected:(NSInteger)lindex
{
//    lselected = lindex;
//    CMyTableViewCellView* pcellview = (CMyTableViewCellView*)[ self viewWithTag:lindex+100 ];
//    [ pcellview setSelected:YES ];
}


@end
