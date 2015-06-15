//
//  CMyTuijianDetailViewController.m
//  CMySignalApp
//
//  Created by baby on 15/6/14.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyTuijianDetailViewController.h"

@interface CMyTuijianDetailViewController ()

@end

@implementation CMyTuijianDetailViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype) initWithdata:(NSString*)saddres
{
    self  = [ super init ];
    
    if (self)
    {
        self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        saddress = [ [NSString alloc] initWithString:saddres ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ self.view setBackgroundColor:[ UIColor grayColor ] ];
    
    pbackbt = [ [UIButton alloc] init ];
    [ pbackbt setTitle:@"返回" forState:UIControlStateNormal ];
    [ pbackbt setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pbackbt addTarget:self action:@selector(Clickbackbt:) forControlEvents:UIControlEventTouchUpInside ];
    [self.view addSubview:pbackbt];
    
    pwebview = [ [UIWebView alloc] init ];
    [ pwebview loadRequest: [ NSURLRequest requestWithURL:[ NSURL URLWithString:saddress ] ] ];
    [ self.view addSubview:pwebview ];
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect backrect = CGRectMake(30, 30, 50, 30);
    [pbackbt setFrame:backrect];
    
    CGRect arect = self.view.frame;
    CGRect webviewrect = CGRectMake(arect.size.width-60-20, 30, 60, self.view.frame.size.height-30-30);
    [ pwebview setFrame:webviewrect ];
}

-(void) Clickbackbt:(id)sender
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
