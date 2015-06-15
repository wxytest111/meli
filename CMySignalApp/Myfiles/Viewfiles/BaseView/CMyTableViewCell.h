//
//  CMyTableViewCell.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

enum
{
    CELL_VIEW_APP = 0,
    CELL_VIEW_PRODUCT,
    CELL_VIEW_WORKER,
    CELL_VIEW_OTHER
};


@interface CMyTableViewCell : UIView
{
    NSInteger   viewtype;
}

-(instancetype) initWithData:(CGRect)arect pdata:(NSDictionary*)pdic type:(NSInteger)ltype;

-(void) updateview:(NSDictionary*)pdic type:(NSInteger)ltype;

-(void) createappview:(NSDictionary*)pdic;
-(void) createproductview:(NSDictionary*)pdic;
-(void) createworkerview:(NSDictionary*)pdic;

-(void) updateappview:(NSDictionary*)pdic;
-(void) updateproductview:(NSDictionary*)pdic;
-(void) updateworkerview:(NSDictionary*)pdic;


@end
