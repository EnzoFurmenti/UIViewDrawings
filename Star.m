//
//  Star.m
//  UIViewDrawings
//
//  Created by EnzoF on 04.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Star.h"

@implementation Star

-(instancetype)initWithRadiusCircumCicleForStar:(CGFloat)radius
                                    centerPoint:(CGPoint)centerPoint
                                      widthLine:(CGFloat)widthLine
                                      starColor:(CGColorRef)starColor
                                   lineColorRef:(CGColorRef)lineColor
                                   circleColorRef:(CGColorRef)circleColor{
    self = [super init];
    if(self)
    {
        self.radius = radius;
        self.centerPoint = centerPoint;
        self.widthLine = widthLine;
        self.starColorRef = starColor;
        self.lineColorRef = lineColor;
        self.circleColorRef = circleColor;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"Drawing %@",NSStringFromCGRect(rect));
    if(!self.radius){self.radius = 20.f;}
    if(!self.widthLine){self.widthLine = 1.f;}
    if(!self.starColorRef){self.starColorRef = [UIColor redColor].CGColor;}
    if(!self.lineColorRef){self.lineColorRef = [UIColor greenColor].CGColor;}
    if(!self.circleColorRef){self.circleColorRef = [UIColor blueColor].CGColor;}
    
    NSLog(@"context");
    CGContextRef context = UIGraphicsGetCurrentContext();
    self.starColorRef = [UIColor redColor].CGColor;
    self.radius = 200.f;
    self.center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));

    CGContextSetFillColorWithColor(context, self.starColorRef);
    
    CGFloat offsetVertex3X = sqrtf(2.f) * sqrtf(1 - cos(2*M_PI/5)) * self.radius / 2;
    CGFloat offsetVertex3Y = sqrtf(sqrf(self.radius) - sqrf(offsetVertex3X));
    
    CGFloat offsetVertex5X = sqrtf(2.f) * sqrtf(1 - cos(4*M_PI/5)) * self.radius / 2;
    CGFloat offsetVertex5Y = sqrtf(sqrf(self.radius) - sqrf(offsetVertex5X));
    
    CGFloat offsetVertex2X = offsetVertex5X;
    CGFloat offsetVertex2Y = offsetVertex5Y;
    
    CGFloat offsetVertex4X = offsetVertex3X;
    CGFloat offsetVertex4Y = offsetVertex3Y;
    
    CGPoint vertex1 = CGPointMake(self.center.x, self.center.y - self.radius);
    CGPoint vertex2 = CGPointMake(self.center.x + offsetVertex2X,self.center.y - offsetVertex2Y);
    CGPoint vertex3 = CGPointMake(self.center.x + offsetVertex3X,self.center.y + offsetVertex3Y);
    CGPoint vertex4 = CGPointMake(self.center.x - offsetVertex4X,self.center.y + offsetVertex4Y);
    CGPoint vertex5 = CGPointMake(self.center.x - offsetVertex5X,self.center.y - offsetVertex5Y);
    
//star
    CGContextMoveToPoint(context, vertex1.x, vertex1.y);
    CGContextAddLineToPoint(context,vertex3.x,  vertex3.y);
    CGContextAddLineToPoint(context,vertex5.x,  vertex5.y);
    CGContextAddLineToPoint(context,vertex2.x,  vertex2.y);
    CGContextAddLineToPoint(context,vertex4.x,  vertex4.y);
    CGContextAddLineToPoint(context,vertex1.x,  vertex1.y);
    CGContextFillPath(context);
    
    
// Line
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextMoveToPoint(context, vertex1.x, vertex1.y);
    CGContextAddLineToPoint(context,vertex2.x,  vertex2.y);
    CGContextAddLineToPoint(context,vertex3.x,  vertex3.y);
    CGContextAddLineToPoint(context,vertex4.x,  vertex4.y);
    CGContextAddLineToPoint(context,vertex5.x,  vertex5.y);
    CGContextAddLineToPoint(context,vertex1.x,  vertex1.y);
    CGContextStrokePath(context);
    
//Circle on Vertex
    CGFloat radius = self.radius / 5;
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextAddArc(context,vertex1.x,vertex1.y, radius, 0, 2 * M_PI, 1);
    CGContextFillPath(context);
    
    CGContextAddArc(context,vertex2.x,vertex2.y, radius, 0, 2 * M_PI, 1);
    CGContextFillPath(context);

    CGContextAddArc(context,vertex3.x,vertex3.y, radius, 0, 2 * M_PI, 1);
    CGContextFillPath(context);
    
    CGContextAddArc(context,vertex4.x,vertex4.y, radius, 0, 2 * M_PI, 1);
    CGContextFillPath(context);
    
    CGContextAddArc(context,vertex5.x,vertex5.y, radius, 0, 2 * M_PI, 1);
    CGContextFillPath(context);
}

CGFloat sqrf(CGFloat number){
    
    return number*number;
}

@end
