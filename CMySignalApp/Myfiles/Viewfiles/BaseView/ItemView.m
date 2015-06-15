//
//  ItemView.m
//  CLaborManager
//
//  Created by admin on 15/5/26.
//  Copyright (c) 2015年 ___GRANDSOFT___. All rights reserved.
//

#import "ItemView.h"

#import "UIViewExt.h"

@implementation ItemView

@synthesize title = m_title;
@synthesize itemImage = m_itemImage;
@synthesize delegateItemView = m_delegateItemView;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSubviews];
        
        [self addGesture];
    }
    return self;
}

- (void)initSubviews
{
    // 小图片
    m_itemImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/2.0-15, 5, 30, 22)];
    m_itemImage.contentMode = UIViewContentModeScaleAspectFit;
    m_itemImage.userInteractionEnabled = YES;
    [self addSubview:m_itemImage];
    
    // 小标题
    m_title = [[UILabel alloc] initWithFrame:CGRectMake(0, m_itemImage.bottom+5, self.width, 10)];
    m_title.backgroundColor = [UIColor clearColor];
    m_title.textColor = [UIColor whiteColor];
    m_title.font = [UIFont boldSystemFontOfSize:10];
    m_title.textAlignment = NSTextAlignmentCenter;
    [ m_title setBackgroundColor:[ UIColor clearColor ] ];
    [self addSubview:m_title];
    
    [ self setBackgroundColor:[ UIColor clearColor ] ];
}

- (void)addGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didItemView:)];
    tap.numberOfTouchesRequired = 1; //手指数
    tap.numberOfTapsRequired = 1; //tap次数
    [self addGestureRecognizer:tap];
}

#pragma mark - Target Actions
- (void)didItemView:(UITapGestureRecognizer *)tap
{
    if ([self.delegateItemView respondsToSelector:@selector(didItemView:atIndex:)])
    {
        [self.delegateItemView didItemView:self atIndex:self.tag];
    }
}

@end
