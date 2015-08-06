//
//  Shape.m
//  test
//
//  Created by Preston Taukulis on 8/3/15.
//  Copyright (c) 2015 Preston Taukulis. All rights reserved.
//

#import "Shape.h"

@implementation Shape

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self sizeToFit];
        
        
        [self drawView];
    }
    return self;
}

-(void)drawView {
    UILabel *flagOptionsButton = [[UILabel alloc]initWithFrame:CGRectMake(15 , 60, 80, 20)];
    flagOptionsButton.backgroundColor = [UIColor blueColor];
    [self addSubview:flagOptionsButton];
}
@end
