//
//  Star.m
//  UIViewDrawings
//
//  Created by EnzoF on 04.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "Star.h"
@interface Star()

@property (assign, nonatomic) CGPoint centerPoint;
@property (assign, nonatomic) CGFloat radius;
@property (assign, nonatomic) CGFloat widthLine;

@property (assign, nonatomic) CGColorRef starColorRef;
@property (assign, nonatomic) CGColorRef lineColorRef;
@property (assign, nonatomic) CGColorRef circleColorRef;
@property (assign, nonatomic) BOOL isNoFirstDraw;
@property (assign, nonatomic) CGContextRef contextRef;

@end

@implementation Star

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self)
    {
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSLog(@"Drawing %@",NSStringFromCGRect(rect));
    if(!self.radius){self.radius = 200.f;}
    if(!self.widthLine){self.widthLine = 3.f;}
    if(!self.starColorRef){self.starColorRef = [UIColor redColor].CGColor;}
    if(!self.lineColorRef){self.lineColorRef = [UIColor greenColor].CGColor;}
    if(!self.circleColorRef){self.circleColorRef = [UIColor blueColor].CGColor;}
    if(!self.isNoFirstDraw)
    {
        self.contextRef = UIGraphicsGetCurrentContext();
        self.radius = 200.f;
        self.widthLine = 3.f;
        self.starColorRef = [UIColor redColor].CGColor;
        self.lineColorRef = [UIColor greenColor].CGColor;
        self.circleColorRef = [UIColor blueColor].CGColor;
        self.centerPoint = self.center;
        [self createStar];
        self.isNoFirstDraw = YES;
    }
    else
    {
        self.radius = 50.f;
        self.widthLine = 1.f;
        for(int starCount = 1;starCount <= 5;starCount++)
        {
            self.starColorRef = [self randomColor].CGColor;
            self.lineColorRef = [self randomColor].CGColor;
            self.circleColorRef = [self randomColor].CGColor;
            CGFloat randomX = arc4random() % (int)(CGRectGetWidth(rect) - 2*self.radius) + self.radius;
            CGFloat randomY = arc4random() % (int)(CGRectGetHeight(rect) - 2*self.radius) + self.radius;
            self.centerPoint = CGPointMake(randomX, randomY);
            [self createStar];
        }
    }
}

#pragma mark - metods
CGFloat sqrf(CGFloat number){
    
    return number*number;
}


-(void)createStar{

    //CGContextRef context = contextRef;
    //self.center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    
    CGContextSetFillColorWithColor(self.contextRef, self.starColorRef);
    
    CGFloat offsetVertex3X = sqrtf(2.f) * sqrtf(1 - cos(2*M_PI/5)) * self.radius / 2;
    CGFloat offsetVertex3Y = sqrtf(sqrf(self.radius) - sqrf(offsetVertex3X));
    
    CGFloat offsetVertex5X = sqrtf(2.f) * sqrtf(1 - cos(4*M_PI/5)) * self.radius / 2;
    CGFloat offsetVertex5Y = sqrtf(sqrf(self.radius) - sqrf(offsetVertex5X));
    
    CGFloat offsetVertex2X = offsetVertex5X;
    CGFloat offsetVertex2Y = offsetVertex5Y;
    
    CGFloat offsetVertex4X = offsetVertex3X;
    CGFloat offsetVertex4Y = offsetVertex3Y;
    
    CGPoint vertex1 = CGPointMake(self.centerPoint.x, self.centerPoint.y - self.radius);
    CGPoint vertex2 = CGPointMake(self.centerPoint.x + offsetVertex2X,self.centerPoint.y - offsetVertex2Y);
    CGPoint vertex3 = CGPointMake(self.centerPoint.x + offsetVertex3X,self.centerPoint.y + offsetVertex3Y);
    CGPoint vertex4 = CGPointMake(self.centerPoint.x - offsetVertex4X,self.centerPoint.y + offsetVertex4Y);
    CGPoint vertex5 = CGPointMake(self.centerPoint.x - offsetVertex5X,self.centerPoint.y - offsetVertex5Y);
    
    //star
    CGContextMoveToPoint(self.contextRef, vertex1.x, vertex1.y);
    CGContextAddLineToPoint(self.contextRef,vertex3.x,  vertex3.y);
    CGContextAddLineToPoint(self.contextRef,vertex5.x,  vertex5.y);
    CGContextAddLineToPoint(self.contextRef,vertex2.x,  vertex2.y);
    CGContextAddLineToPoint(self.contextRef,vertex4.x,  vertex4.y);
    CGContextAddLineToPoint(self.contextRef,vertex1.x,  vertex1.y);
    CGContextFillPath(self.contextRef);
    
    
    // Line
    CGContextSetStrokeColorWithColor(self.contextRef, self.lineColorRef);
    CGContextMoveToPoint(self.contextRef, vertex1.x, vertex1.y);
    CGContextAddLineToPoint(self.contextRef,vertex2.x,  vertex2.y);
    CGContextAddLineToPoint(self.contextRef,vertex3.x,  vertex3.y);
    CGContextAddLineToPoint(self.contextRef,vertex4.x,  vertex4.y);
    CGContextAddLineToPoint(self.contextRef,vertex5.x,  vertex5.y);
    CGContextAddLineToPoint(self.contextRef,vertex1.x,  vertex1.y);
    CGContextSetLineWidth(self.contextRef, self.widthLine);
    CGContextStrokePath(self.contextRef);
    
    //Circle on Vertex
    CGFloat circleRadius = self.radius / 5;
    CGContextSetFillColorWithColor(self.contextRef, self.circleColorRef);
    
    CGContextAddArc(self.contextRef,vertex1.x,vertex1.y, circleRadius, 0, 2 * M_PI, 1);
    CGContextFillPath(self.contextRef);
    
    CGContextAddArc(self.contextRef,vertex2.x,vertex2.y, circleRadius, 0, 2 * M_PI, 1);
    CGContextFillPath(self.contextRef);
    
    CGContextAddArc(self.contextRef,vertex3.x,vertex3.y, circleRadius, 0, 2 * M_PI, 1);
    CGContextFillPath(self.contextRef);
    
    CGContextAddArc(self.contextRef,vertex4.x,vertex4.y, circleRadius, 0, 2 * M_PI, 1);
    CGContextFillPath(self.contextRef);
    
    CGContextAddArc(self.contextRef,vertex5.x,vertex5.y, circleRadius, 0, 2 * M_PI, 1);
    CGContextFillPath(self.contextRef);
}


- (UIColor*)randomColor{
    
    CGFloat red = (float)arc4random_uniform(256) / 255.f;
    CGFloat green = (float)arc4random_uniform(256) / 255.f;
    CGFloat blue = (float)arc4random_uniform(256) / 255.f;
    CGFloat alpha = (float)arc4random_uniform(256) / 255.f;
    return [[UIColor alloc] initWithRed:red green:green blue:blue alpha:alpha];
}



@end
