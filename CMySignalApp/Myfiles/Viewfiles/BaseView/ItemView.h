//
//  ItemView.h
//  CLaborManager
//
//  Created by admin on 15/5/26.
//  Copyright (c) 2015年 ___GRANDSOFT___. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemView;
@protocol ItemViewDelegate <NSObject>

@optional
- (void)didItemView:(ItemView *)itemView atIndex:(NSInteger)index;

@end


@interface ItemView : UIView
{
@private
    UIImageView*    m_itemImage;
    UILabel*        m_title;

    id< ItemViewDelegate >  m_delegateItemView;
}

@property (nonatomic, readonly) UIImageView *itemImage;
@property (nonatomic, readonly) UILabel     *title;
@property (nonatomic) id <ItemViewDelegate> delegateItemView;

- (void)addGesture;
- (void)initSubviews;

@end
