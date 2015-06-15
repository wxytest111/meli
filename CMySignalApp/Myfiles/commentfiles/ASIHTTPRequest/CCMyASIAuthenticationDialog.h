//
//  ASIAuthenticationDialog.h
//  Part of ASIHTTPRequest -> http://allseeing-i.com/ASIHTTPRequest
//
//  Created by Ben Copsey on 21/08/2009.
//  Copyright 2009 All-Seeing Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CCMyASIHTTPRequest;

typedef enum _CCMyASIAuthenticationType {
	ASIStandardAuthenticationType = 0,
    ASIProxyAuthenticationType = 1
} CCMyASIAuthenticationType;

@interface CCMyASIAutorotatingViewController : UIViewController
@end

@interface CCMyASIAuthenticationDialog : CCMyASIAutorotatingViewController <UIActionSheetDelegate, UITableViewDelegate, UITableViewDataSource> {
	CCMyASIHTTPRequest *request;
	CCMyASIAuthenticationType type;
	UITableView *tableView;
	UIViewController *presentingController;
	BOOL didEnableRotationNotifications;
}
+ (void)presentAuthenticationDialogForRequest:(CCMyASIHTTPRequest *)request;
+ (void)dismiss;

@property (atomic, retain) CCMyASIHTTPRequest *request;
@property (atomic, assign) CCMyASIAuthenticationType type;
@property (atomic, assign) BOOL didEnableRotationNotifications;
@property (retain, nonatomic) UIViewController *presentingController;
@end
