//
//  CMyOrderCreateViewController.h
//  CMySignalApp
//
//  Created by 3A-5-5-79  azld on 15/6/17.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "ModuleViewBaseViewController.h"

@interface CMyOrderCreateViewController : ModuleViewBaseViewController < UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate >
{
    UILabel*    plabletime;
    UILabel*    ptime;
    UIButton*   ptimebt;
    
    UILabel*    plableaddress;
    UITextField*    paddress;
    
    UILabel*    plableproduce;
    UILabel*    pproduct;
    UIButton*   pproductbt;
    
    UILabel*    plableservice;
    UILabel*    pservice;
    UIButton*   pservicebt;
    
    NSInteger   ltype;
    
    UIPickerView*   pickview;
    NSMutableArray* pdatedays;
    NSMutableArray* pdatezones;
    NSInteger   lday;
    NSInteger   lzone;
    
    UIPickerView*   pickview2;
    NSMutableArray* products;
    
    UIPickerView*   pickview3;
    NSMutableArray* service;
    
    UIImageView*    pworkerimage;
    UILabel*        pworkername;
    
    NSDictionary*   pworkerinfo;
}

-(instancetype) initWithItem:(BOOL)bcreatebt worker:(NSDictionary*)worker;

-(void) lineviews;


@end
