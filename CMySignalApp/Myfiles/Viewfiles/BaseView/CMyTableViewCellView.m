//
//  CMyTableViewCellView.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/12.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyTableViewCellView.h"

#define ITEM_BG_SELECTED_IMAGE              @"background_blue"
#define ITEM_BG_NORMAL_IMAGE                @"bg_blue_little"


@implementation CMyTableViewCellView

-(instancetype) initWithdata:(CGRect)frame data:(NSDictionary*)pdata
{
    self = [ super initWithFrame:frame ];
    
    if (self)
    {
        [ self initmyself:pdata ];
    }
    
    return self;
}

-(void) initmyself:(NSDictionary*)pdata
{
    [ self setBackgroundImage:[ UIImage imageNamed:ITEM_BG_NORMAL_IMAGE ] forState:UIControlStateNormal ];
    [ self setBackgroundImage:[ UIImage imageNamed:ITEM_BG_SELECTED_IMAGE ] forState:UIControlStateSelected ];
    
    NSInteger lwidth = self.frame.size.width;
    NSInteger lx = (lwidth-30)*0.5;
    
    CGRect imagerect = CGRectMake(lx, 0, self.frame.size.height, self.frame.size.height);
    
    /*
    UIButton* pimageview = [ [UIButton alloc] initWithFrame:imagerect ];
    [ pimageview setBackgroundImage:[ UIImage imageNamed:[ NSString stringWithString:[ pdata objectForKey:@"image" ] ] ] forState:UIControlStateNormal ];
    [ self addSubview:pimageview ];
    [ pimageview addTarget:self action:@selector(ClickCellView:) forControlEvents:UIControlEventTouchUpInside ];
    */
    
    UIImageView* pimageview = [ [UIImageView alloc] initWithFrame:imagerect ];
    [ pimageview setImage:[ UIImage imageNamed:[ NSString stringWithString:[ pdata objectForKey:@"image" ] ] ] ];
    [ self addSubview:pimageview ];
    [ pimageview setUserInteractionEnabled:NO ];
    
    CGRect labrect = CGRectMake(lx-10, 30, 50, 20);
    UILabel* plable = [ [UILabel alloc] initWithFrame:labrect ];
    [ self addSubview:plable ];
    [ plable setText:[ NSString stringWithString:[ pdata objectForKey:@"title" ] ] ];
    [ plable setTextAlignment:NSTextAlignmentCenter ];
    plable.font = [UIFont boldSystemFontOfSize:10];
    [ plable setUserInteractionEnabled:NO ];
    
    [ self addGesture ];
}

- (void)addGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(ClickCellView:)];
    tap.numberOfTouchesRequired = 1; //手指数
    tap.numberOfTapsRequired = 1; //tap次数
    [self addGestureRecognizer:tap];
}

-(void) ClickCellView:(UITapGestureRecognizer *)tap
{
    NSLog(@"11111111222222");
}

@end
