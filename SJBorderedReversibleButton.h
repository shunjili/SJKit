
//
//  SJBorderedReversibleButton.h
//
//  Created by Shunji Li on 7/2/14.
//  Copyright (c) 2014 shunjili. All rights reserved.
//

//Thanks to Eric Welander who contributed to make this class work

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    EBReverseButtonStyleFilled,
    EBReverseButtonStyleHollow,
} EBReverseButtonStyle;

@interface SJBorderedReversibleButton : UIButton

@property (nonatomic, strong) NSDictionary *attributes;

@property (nonatomic, readonly, assign) EBReverseButtonStyle style;

- (id)initWithFrame:(CGRect)frame style:(EBReverseButtonStyle)style;

- (id)initWithStyle:(EBReverseButtonStyle)style;

@end
