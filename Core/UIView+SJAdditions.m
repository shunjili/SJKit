//
//  UIView+SJAdditions.m
//  Universal Watch
//
//  Created by Shunji Li on 9/7/14.
//  Copyright (c) 2014 Shunji Li. All rights reserved.
//

#import "UIView+SJAdditions.h"

@implementation UIView (SJAdditions)
+(instancetype)sj_autolayoutView
{
    UIView *view = [[self alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}
@end
