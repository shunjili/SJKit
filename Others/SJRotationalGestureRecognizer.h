//
//  SJRotationalGestureRecognizer.h
//  Rotational Gesture Recognizer Demo
//
//  Created by Shunji Li on 9/7/14.
//  Copyright (c) 2014 Shunji Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>


@interface SJRotationalGestureRecognizer : UIGestureRecognizer
@property (nonatomic, assign) CGFloat rotation;
@property (nonatomic, assign) CGPoint center;
- (instancetype) initWithTarget:(id)target action:(SEL)action andCenterPoint:(CGPoint)center;
@end
