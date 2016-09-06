//
//  Drawing.m
//  UIViewDrawings
//
//  Created by EnzoF on 05.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Canvas.h"

@implementation Canvas
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self)
    {
        NSLog(@"drawing init");
    }
    return self;
}
-(void)drawRect:(CGRect)rect
{
    NSLog(@"drawing");
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSUInteger currentViewIndex = 0;
    for (NSValue *pointValue in self.mArrayCentralPoints)
    {
        CGColorRef currentColorRef= [[self.mArrayColorViews objectAtIndex:currentViewIndex] CGColor];
        CGContextSetFillColorWithColor(context, currentColorRef);
        CGPoint currentPoint = [pointValue CGPointValue];
        
        CGSize currentSize = [[self.mArraySizeViews objectAtIndex:currentViewIndex] CGSizeValue];
        CGContextAddArc(context, currentPoint.x, currentPoint.y, currentSize.width, 0, 2*M_PI, 1);
        CGContextFillPath(context);
        currentViewIndex++;
    }
}

#pragma mark - initialization
-(NSMutableArray*)mArrayCentralPoints{
    
    if(!_mArrayCentralPoints)
    {
        _mArrayCentralPoints = [[NSMutableArray alloc]init];
    }
    return _mArrayCentralPoints;
}

-(NSMutableArray*)mArrayColorViews{
    
    if(!_mArrayColorViews)
    {
        _mArrayColorViews = [[NSMutableArray alloc]init];
    }
    return _mArrayColorViews;
}

-(NSMutableArray*)mArraySizeViews{
    
    if(!_mArraySizeViews)
    {
        _mArraySizeViews = [[NSMutableArray alloc]init];
    }
    return _mArraySizeViews;
}

-(UIColor*)currentColor{
    if(!_currentColor)
    {
        _currentColor = [UIColor blackColor];
    }
    return _currentColor;
}

-(CGSize)currentSizeView{
    if(_currentSizeView.width == 0.f || _currentSizeView.height == 0.f)
    {
        _currentSizeView = CGSizeMake(3.f, 3.f);
    }
    return _currentSizeView;
}
@end
