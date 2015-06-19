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
    
    {
        UIButton *btback = [UIButton buttonWithType:UIButtonTypeCustom];
        btback.frame = CGRectMake(2, 0, 44, 33);
        [ btback setBackgroundImage:[UIImage imageNamed:@"backItem"] forState:UIControlStateNormal];
        [ btback setTitle:@"返回" forState:UIControlStateNormal ];
        [ btback addTarget:self action:@selector(Clickbackbt:) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btback];
    }
    
    pwebview = [ [UIWebView alloc] init ];
    [ pwebview loadRequest: [ NSURLRequest requestWithURL:[ NSURL URLWithString:saddress ] ] ];
    [ self.view addSubview:pwebview ];
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect backrect = CGRectMake(30, 0, 50, 30);
    [pbackbt setFrame:backrect];
    
    CGRect arect = self.view.frame;
    CGRect webviewrect = CGRectMake(0, 0, arect.size.width, self.view.frame.size.height);
    [ pwebview setFrame:webviewrect ];
}

-(void) Clickbackbt:(id)sender
{
    [ self.navigationController popViewControllerAnimated:YES ];
    //[ self dismissViewControllerAnimated:YES completion:nil ];
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
