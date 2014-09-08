//
//  SJRotationalGestureRecognizer.m
//  Rotational Gesture Recognizer Demo
//
//  Created by Shunji Li on 9/7/14.
//  Copyright (c) 2014 Shunji Li. All rights reserved.
//

#import "SJRotationalGestureRecognizer.h"
#import "SJGeometryUtils.h"
@interface SJRotationalGestureRecognizer()
@property (nonatomic, assign) CGPoint previousPoint;
@end

@implementation SJRotationalGestureRecognizer

#pragma mark - Initializers
- (instancetype) initWithTarget:(id)target action:(SEL)action andCenterPoint:(CGPoint)center
{
    self = [super initWithTarget:target action:action];
    if (self)
    {
        _center = center;
    }
    return self;
}
//Overriding the function

- (void)reset
{
    [super reset];
    self.rotation = 0.0f;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    self.state = UIGestureRecognizerStateBegan;
    self.previousPoint = [[touches anyObject] locationInView:self.view];
    
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    self.state = UIGestureRecognizerStateChanged;
    CGPoint currentLocation = [[touches anyObject] locationInView:self.view];
    if (distanceBetweentPoints(currentLocation, self.previousPoint) > 3)
    {
        CGFloat angle = angleBetweenPoints(currentLocation, self.center, self.previousPoint);
        if (isClockWise(self.previousPoint, self.center, currentLocation))
        {
            angle = - angle;
        }
        self.rotation += angle;
        self.previousPoint = currentLocation;
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    self.state = UIGestureRecognizerStateEnded;
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateCancelled;
}
@end
