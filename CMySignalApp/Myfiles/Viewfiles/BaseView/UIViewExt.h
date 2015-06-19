/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

#define ScreenWidth            [ [UIScreen mainScreen] bounds ].size.width
#define ScreenHeight           [ [UIScreen mainScreen] bounds ].size.height
#define ScreenHeightAppframe   [ [UIScreen mainScreen] applicationFrame ].size.height

#define TablebarHeight         49
#define Navigationbarheight    44
#define Statusbarheight        20

#define Tarbaritemrest      5

#define Tabbaritemwidth     ((ScreenWidth-Tarbaritemrest*2)/4)

#define ContentviewHeight      (ScreenHeight-Statusbarheight-Navigationbarheight-TablebarHeight)


CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
@end