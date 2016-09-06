//
//  ViewController.m
//  UIViewDrawings
//
//  Created by EnzoF on 04.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "ViewController.h"
#import "Star.h"
#import "DrawTool.h"
#import "Canvas.h"

typedef enum{
    ViewControllerViewTypeColor = 200,
    ViewControllerViewTypeSize = 100
}ViewControllerViewType;
@interface ViewController ()
@property (strong, nonatomic) DrawTool *drawTool;
@property (strong, nonatomic) Canvas *canvas;
@property (strong, nonatomic) NSMutableArray *mArrayToolViews;
@property (strong,nonatomic) UIView *currentvView;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    CGRect rectDrawTools = CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMinY(self.view.bounds), CGRectGetWidth(self.view.bounds) / 5, CGRectGetHeight(self.view.bounds));
    CGPoint point = CGPointMake(CGRectGetMaxX(rectDrawTools), CGRectGetMinY(self.view.bounds));
    CGRect rectDrawing = CGRectMake(point.x + 5.f, point.y, CGRectGetMaxX(self.view.bounds) - point.x, CGRectGetHeight(self.view.bounds));

    self.drawTool = [[DrawTool alloc]initWithFrame:rectDrawTools];
    self.canvas = [[Canvas alloc]initWithFrame:rectDrawing];
    self.canvas.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.canvas];
    [self.view addSubview:self.drawTool];
    
    self.canvas.autoresizingMask =  UIViewAutoresizingFlexibleHeight        |
                                    UIViewAutoresizingFlexibleLeftMargin    |
                                    UIViewAutoresizingFlexibleWidth;
    
    
    self.drawTool.autoresizingMask = UIViewAutoresizingFlexibleHeight       |
                                     UIViewAutoresizingFlexibleLeftMargin   |
                                     UIViewAutoresizingFlexibleRightMargin  |
                                     UIViewAutoresizingFlexibleWidth;

    for (UIView *view in self.drawTool.arraySizeView)
    {
        [self.mArrayToolViews addObject:view];
    }
    for (UIView *view in self.drawTool.arrayColorView)
    {
        [self.mArrayToolViews addObject:view];
    }

    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - Initialization
-(NSMutableArray*)mArrayToolViews{
    if(!_mArrayToolViews)
    {
        _mArrayToolViews = [[NSMutableArray alloc]init];
    }
    return _mArrayToolViews;
}

#pragma mark - Rotation
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{

       [self.canvas setNeedsDisplay];
}



#pragma mark - UITouch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.drawTool];
    UIView *currentView = [self searchLocalViewFromArray:self.mArrayToolViews contentPoint:touchPoint];
    if(currentView)
    {
        switch (currentView.tag) {
            case ViewControllerViewTypeSize:
                self.canvas.currentSizeView = CGSizeMake(CGRectGetWidth(currentView.frame),CGRectGetHeight(currentView.frame));
                break;
            case ViewControllerViewTypeColor:
                self.canvas.currentColor = currentView.backgroundColor;
                break;

        }
        [self.canvas setNeedsDisplay];
        
    }
    
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.canvas];
    NSValue *currentPointValue = [NSValue valueWithCGPoint:touchPoint];
    [self.canvas.mArrayCentralPoints addObject:currentPointValue];
    NSValue *sizeViewValue = [NSValue valueWithCGSize:self.canvas.currentSizeView];
    [self.canvas.mArraySizeViews addObject:sizeViewValue];
    
    [self.canvas.mArrayColorViews addObject:self.canvas.currentColor];
    
    [self.canvas setNeedsDisplay];
    
}
#pragma mark - metods

-(nullable UIView*)searchLocalViewFromArray:(NSMutableArray*)maArrayViews contentPoint:(CGPoint)contentPoint{
    UIView *totalView = nil;
    for (UIView *currentView in maArrayViews)
    {
        if(CGRectContainsPoint(currentView.frame, contentPoint))
        {
                totalView = currentView;
                break;
        }
    }
    return totalView;
}

@end
