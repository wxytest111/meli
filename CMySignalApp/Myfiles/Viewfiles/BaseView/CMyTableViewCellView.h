//
//  CMyTableViewCellView.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/12.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMyTableViewCellView : UIButton
{
    ;
}

-(instancetype) initWithdata:(CGRect)frame data:(NSDictionary*)pdata;
-(void) initmyself:(NSDictionary*)pdata;

@end
