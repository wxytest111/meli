//
//  CMyTableView.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/12.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyTableViewDelegate <NSObject>

@optional
- (void)didItemView:(NSInteger)index;
@end


@interface CMyTableView : UIImageView
{
    id<MyTableViewDelegate>     ptableviewdelegate;
    
    NSInteger                   lselected;
    UIImageView*                pselectview;
}

@property(atomic)       id<MyTableViewDelegate>     tableviewdelegate;

-(instancetype) initWithdata:(CGRect)frame data:(NSArray*)pdata;
-(void) initmyself:(NSArray*)pdata;

-(void) ClickCellView:(id)sender;
-(void) setDefaultSelected:(NSInteger)lindex;


@end
