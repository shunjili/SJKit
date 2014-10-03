//
//  UIImageView+SJAdditions.m
//  Home
//
//  Created by Shunji Li on 10/1/14.
//  Copyright (c) 2014 Shunji Li. All rights reserved.
//

#import "UIImageView+SJAdditions.h"

@implementation UIImageView (SJAdditions)

+ (instancetype) sj_autoLayoutImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    return imageView;
}
@end
