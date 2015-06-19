//
//  ModuleViewBaseViewController.m
//  CLaborManager
//
//  Created by 3A-5-5-79  朱昌 on 15/6/15.
//  Copyright (c) 2015年 ___GRANDSOFT___. All rights reserved.
//

#import "ModuleViewBaseViewController.h"

@interface ModuleViewBaseViewController ()

@end

@implementation ModuleViewBaseViewController


-(instancetype) initWithItem:(BOOL)bcreatebt
{
    self = [ super init ];
    
    bCreateItem = bcreatebt;

    return self;
}

-(void) loadView
{
//    CGRect arect = CGRectMake(0, Statusbarheight+Navigationbarheight+40, ScreenWidth, ScreenHeight-(Statusbarheight+Navigationbarheight-TablebarHeight+60));
    UIView *view = [[UIView alloc] init];
    self.view = view;
    
    if (bCreateItem)
    {
        UIButton *createbt = [UIButton buttonWithType:UIButtonTypeCustom];
        createbt.frame = CGRectMake(2, 0, 44, 33);
        [ createbt setBackgroundImage:[UIImage imageNamed:@"backItem"] forState:UIControlStateNormal];
        [ createbt setBackgroundColor:[ UIColor redColor ] ];
        [ createbt setTitle:sright forState:UIControlStateNormal ];
        [ createbt addTarget:self action:@selector(ClickRightBt:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:createbt];
    }
}

-(void) viewWillAppear:(BOOL)animated
{
    [ super viewWillAppear:animated ];

    CGRect arect = CGRectMake(40, Navigationbarheight, ScreenWidth-40*2, ScreenHeight-(Navigationbarheight-TablebarHeight));
    [self.view setFrame:arect];
}

-(void) ClickRightBt:(UIButton*)pbt
{
    NSLog(@"super ClickCreateBt");
}


/*
- (void)backRootVC:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
