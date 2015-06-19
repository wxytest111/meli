//
//  ModuleViewBaseViewController.h
//  CLaborManager
//
//  Created by 3A-5-5-79  朱昌 on 15/6/15.
//  Copyright (c) 2015年 ___GRANDSOFT___. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIViewExt.h"

@interface ModuleViewBaseViewController : UIViewController 
{
    BOOL    bCreateItem;
    
    NSString*   sright;
    NSString*   sleft;
}

-(instancetype) initWithItem:(BOOL)bcreatebt;

-(void) loadView;

-(void) ClickRightBt:(UIButton*)pbt;

@end
