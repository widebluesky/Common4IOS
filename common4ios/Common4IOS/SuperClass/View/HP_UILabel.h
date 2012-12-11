//
//  HP_UILabel.h
//  blog
//
//  Created by Yi Xu on 12-11-26.
//  Copyright (c) 2012年 Yi Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HP_UILabel : UILabel

@property(nonatomic) UIEdgeInsets insets;

- (id)initWithFrame:(CGRect)frame andInsets:(UIEdgeInsets) insets;

- (id)initWithInsets:(UIEdgeInsets) insets;

@end
