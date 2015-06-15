//
//  CMyWorkerDetailViewController.m
//  CMySignalApp
//
//  Created by 3A-5-5-79  朱昌 on 15/6/10.
//  Copyright (c) 2015年 alex. All rights reserved.
//

#import "CMyWorkerDetailViewController.h"
#import "CMyCreateOderViewController.h"


@interface CMyWorkerDetailViewController ()

@end

@implementation CMyWorkerDetailViewController

- (instancetype)init
{
    self  = [ super init ];
    
    if (self)
    {
        self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
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

    pcreateorderbt = [ [UIButton alloc] init ];
    
    [ pcreateorderbt setTitle:@"order" forState:UIControlStateNormal ];
    [ pcreateorderbt setBackgroundImage:[ UIImage imageNamed:@"nav_bg_all" ] forState:UIControlStateNormal ];
    [ pcreateorderbt addTarget:self action:@selector(ClickCreatOrder:) forControlEvents:UIControlEventTouchUpInside ];
    [ self.view addSubview:pcreateorderbt ];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect backrect = CGRectMake(30, 30, 50, 30);
    [pbackbt setFrame:backrect];

    CGRect arect = self.view.frame;
    CGRect orderrect = CGRectMake(arect.size.width-60-20, 30, 60, 30);
    [ pcreateorderbt setFrame:orderrect ];
}

-(void) Clickbackbt:(id)sender
{
    [ self dismissViewControllerAnimated:YES completion:nil ];
}

-(void) ClickCreatOrder:(id)sender
{
    NSLog(@"发起一个预约");
    
    CMyCreateOderViewController* pcreateorderviewcontrol = [ [CMyCreateOderViewController alloc] init ];
    [ self presentViewController:pcreateorderviewcontrol animated:YES completion:nil ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setworker:(NSDictionary*)pdic
{
    ;
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
