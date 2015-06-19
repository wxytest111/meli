//
//  CMyCreateOderViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyCreateOderViewController.h"

@interface CMyCreateOderViewController ()

@end

@implementation CMyCreateOderViewController

-(instancetype) initWithItem:(BOOL)bcreatebt
{
    self = [ super initWithItem:bcreatebt ];
    
    if (self)
    {
        sright = [ NSString stringWithFormat:@"%@", @"创建" ];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[ UIColor grayColor ]];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) ClickRightBt:(UIButton*)pbt
{
    ;
}

-(void) submitorder
{
    ;
}

-(void) ClickSubmitbt:(id)sender
{
    [ self submitorder ];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) ClickCancelbt:(id)sender
{
    [ self dismissViewControllerAnimated:YES completion:nil ];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
