//
//  SJGeometryUtils.m
//  Rotational Gesture Recognizer Demo
//
//  Created by Shunji Li on 9/7/14.
//  Copyright (c) 2014 Shunji Li. All rights reserved.
//

#import "SJGeometryUtils.h"

CGFloat angleBetweenPoints(CGPoint pointA, CGPoint pointB, CGPoint pointC)
{
    CGFloat a = distanceBetweentPoints(pointC, pointB);
    CGFloat b = distanceBetweentPoints(pointA, pointC);
    CGFloat c = distanceBetweentPoints(pointB, pointA);
    CGFloat result = acosf((powf(a, 2) + powf(c, 2) - powf(b, 2))/(2 * a * c));
    return result;
}

CGFloat distanceBetweentPoints(CGPoint pointA, CGPoint pointB)
{
    return sqrtf(powf((pointB.x - pointA.x), 2) + powf(pointB.y - pointA.y, 2));
}

BOOL isClockWise(CGPoint pointA, CGPoint center, CGPoint pointB)
{
    CGPoint vec1 = CGPointMake(pointA.x - center.x, pointA.y - center.y);
    CGPoint vec2 = CGPointMake(pointB.x - center.x, pointB.y - center.y);
    return  (vec1.x * vec2.y - vec1.y * vec2.x) < 0;
}