//
//  SJBorderedReversibleButton.m
//
//  Created by Shunji Li on 7/2/14.
//  Copyright (c) 2014 shunjili. All rights reserved.
//

#import "SJBorderedReversibleButton.h"
#import "UIView+SJAdditions.h"

@interface SJBorderedReversibleButton()
@property (nonatomic, assign, readwrite) EBReverseButtonStyle style;
@property (nonatomic, assign) EBReverseButtonStyle currentStyle;
@end

@implementation SJBorderedReversibleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _style = EBReverseButtonStyleHollow;
        _currentStyle = _style;
        
        // remove the UIButton default views
        // so they are not in the view hierarchy
        [self.titleLabel removeFromSuperview];
        [self.imageView removeFromSuperview];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame style:(EBReverseButtonStyle)style
{
    self = [self initWithFrame:frame];
    _style = style;
    _currentStyle = _style;
    return self;
}

- (id)initWithStyle:(EBReverseButtonStyle)style
{
    self = [self initWithFrame:CGRectZero style:style];
    return self;
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    [self setNeedsDisplay];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if ((self.style == EBReverseButtonStyleHollow && highlighted) || (self.style == EBReverseButtonStyleFilled && !highlighted)) {
        self.currentStyle = EBReverseButtonStyleFilled;
    }
    else
    {
        self.currentStyle = EBReverseButtonStyleHollow;
    }
    
    [self setNeedsDisplay];
}

- (void)tintColorDidChange
{
    [self setTitleColor:self.tintColor forState:UIControlStateNormal];
    [self setTitleColor:self.tintColor forState:UIControlStateHighlighted];
    
    [super tintColorDidChange];
}

- (void)drawRect:(CGRect)rect
{
    UIColor *textColor = [self titleColorForState:self.state];
    
    if (self.currentStyle == EBReverseButtonStyleHollow) {
        
        // Drawing the border
        CGContextRef context=UIGraphicsGetCurrentContext();
        CGFloat cornerRadius = 5.0f;
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius: cornerRadius];
        CGContextAddPath(context, bezierPath.CGPath);
        CGContextClip(context);
        bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
        bezierPath.lineWidth = 2.0f;
        CGContextSetStrokeColorWithColor(context, textColor.CGColor);
        [bezierPath stroke];
        NSString *title = [self titleForState:self.state];
        CGSize size = [title sizeWithAttributes:self.attributes];
        CGPoint textOrigin = CGPointMake((rect.size.width/2 - size.width/2) - 0.5, (rect.size.height/2 - size.height/2) - 0.5);
        NSMutableDictionary *stateAttributes = [self.attributes mutableCopy];
        stateAttributes[NSForegroundColorAttributeName] = textColor;
        [title drawAtPoint:textOrigin withAttributes:stateAttributes];
    }
    else
    {
        // Drawing the border
        CGContextRef context=UIGraphicsGetCurrentContext();
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5.0f];
        CGContextSetFillColorWithColor(context, textColor.CGColor);
        [bezierPath fill];
        CGContextSaveGState(context);
        CGContextSetBlendMode(context, kCGBlendModeClear);
        NSString *title = [self titleForState:self.state];
        CGSize size = [title sizeWithAttributes:self.attributes];;
        CGPoint textOrigin = CGPointMake(( rect.size.width/2 - size.width/2) - 0.5, (rect.size.height/2 - size.height/2) - 0.5);
        NSMutableDictionary *stateAttributes = [self.attributes mutableCopy];
        stateAttributes[NSForegroundColorAttributeName] = [UIColor clearColor];
        [title drawAtPoint:textOrigin withAttributes:stateAttributes];
        CGContextSaveGState(context);
    }
}

@end

