//
//  SJGeometryUtils.h
//  Rotational Gesture Recognizer Demo
//
//  Created by Shunji Li on 9/7/14.
//  Copyright (c) 2014 Shunji Li. All rights reserved.
//

#import <UIKit/UIKit.h>
CGFloat angleBetweenPoints(CGPoint pointA, CGPoint pointB, CGPoint pointC);
CGFloat distanceBetweentPoints(CGPoint pointA, CGPoint pointB);
BOOL isClockWise(CGPoint pointA, CGPoint center, CGPoint pointB);

