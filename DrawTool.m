//
//  DrawTool.m
//  UIViewDrawings
//
//  Created by EnzoF on 05.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "DrawTool.h"
@interface DrawTool()

@property (strong,nonatomic) UIColor *currentColorView;

@end

@implementation DrawTool

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.currentColorView = [UIColor grayColor];
        self.backgroundColor = [UIColor yellowColor];
//        self.layer.shadowOffset = CGSizeMake(0, 20);
//        self.layer.shadowColor = [UIColor blueColor].CGColor;
        //CGFloat indentWithinSizeView = 2.f;
        CGFloat upIndentView = 20.f;
        CGFloat indentView = 20.f;
        
        CGFloat sizeViewMinX = CGRectGetMinX(frame) + indentView;
        CGFloat sizeViewMinY = CGRectGetMinY(frame) + 50.f;
        UIView *sizeView5x5 = [[UIView alloc]initWithFrame:
                               CGRectMake(sizeViewMinX, sizeViewMinY, 5.f, 5.f)];
        
        
        UIView *sizeView10x10 = [[UIView alloc]initWithFrame:
                                 CGRectMake(CGRectGetMinX(sizeView5x5.frame), CGRectGetMaxY(sizeView5x5.frame) + upIndentView, 10.f, 10.f)];
        
        UIView *sizeView15x15 = [[UIView alloc]initWithFrame:
                                 CGRectMake(CGRectGetMinX(sizeView5x5.frame), CGRectGetMaxY(sizeView10x10.frame) + upIndentView, 15.f, 15.f)];
        
        UIView *sizeView20x20 = [[UIView alloc]initWithFrame:
                                 CGRectMake(CGRectGetMinX(sizeView5x5.frame), CGRectGetMaxY(sizeView15x15.frame) + upIndentView, 20.f, 20.f)];
        UIView *sizeView30x30 = [[UIView alloc]initWithFrame:
                                 CGRectMake(CGRectGetMinX(sizeView5x5.frame), CGRectGetMaxY(sizeView15x15.frame) + upIndentView, 30.f, 30.f)];
        
        self.arraySizeView = [[NSArray alloc] initWithObjects:sizeView5x5,sizeView10x10,sizeView15x15,sizeView20x20,sizeView30x30, nil];
        
        for (UIView *currenSizeView in self.arraySizeView)
        {
            currenSizeView.backgroundColor = self.currentColorView;
            currenSizeView.center = CGPointMake(sizeViewMinX,CGRectGetMidY(currenSizeView.frame));
            currenSizeView.tag = 100;
            currenSizeView.layer.shadowColor = [UIColor greenColor].CGColor;
            currenSizeView.layer.shadowOffset = CGSizeMake(-50, -30);
            [self addSubview:currenSizeView];
        }
        
        CGFloat colorViewMinX = CGRectGetMaxX(frame) - (50.f + indentView);
        CGFloat colorViewMinY = CGRectGetMinY(frame) + 50.f;
        CGSize colorViewSize = CGSizeMake(50.f, 50.f);
        
        UIView *colorRedView = [[UIView alloc]initWithFrame:
                               CGRectMake(colorViewMinX, colorViewMinY, colorViewSize.width,colorViewSize.height)];
        colorRedView.backgroundColor = [UIColor redColor];
        
        UIView *colorGreenView = [[UIView alloc]initWithFrame:
                                 CGRectMake(colorViewMinX, CGRectGetMaxY(colorRedView.frame) + upIndentView, colorViewSize.width,colorViewSize.height)];
        colorGreenView.backgroundColor = [UIColor greenColor];
        
        
        UIView *colorBlueView = [[UIView alloc]initWithFrame:
                                 CGRectMake(colorViewMinX, CGRectGetMaxY(colorGreenView.frame) + upIndentView, colorViewSize.width,colorViewSize.height)];
        colorBlueView.backgroundColor = [UIColor blueColor];
        
        UIView *colorBlackView = [[UIView alloc]initWithFrame:
                                 CGRectMake(colorViewMinX, CGRectGetMaxY(colorBlueView.frame) + upIndentView, colorViewSize.width,colorViewSize.height)];
        colorBlackView.backgroundColor = [UIColor blackColor];
        

        UIView *colorWhiteView =  [[UIView alloc]initWithFrame:
                                    CGRectMake(colorViewMinX, CGRectGetMaxY(colorBlackView.frame) + upIndentView, colorViewSize.width,colorViewSize.height)];
        colorWhiteView.backgroundColor = [UIColor whiteColor];
        
        UIView *colorYellowView =  [[UIView alloc]initWithFrame:
                                     CGRectMake(colorViewMinX, CGRectGetMaxY(colorWhiteView.frame) + upIndentView, colorViewSize.width,colorViewSize.height)];
        colorYellowView.backgroundColor = [UIColor yellowColor];

        self.arrayColorView = [[NSArray alloc]initWithObjects:colorRedView,colorGreenView,colorBlueView ,colorBlackView,colorWhiteView, colorYellowView,nil];
        
        [self addSubview:colorRedView];
        [self addSubview:colorGreenView];
        [self addSubview:colorBlueView];
        [self addSubview:colorBlackView];
        [self addSubview:colorWhiteView];
        [self addSubview:colorBlueView];
        [self addSubview:colorYellowView];
        
        for (UIView *currentView in self.arrayColorView)
        {
            currentView.tag = 200;
            currentView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        }
    }
    return self;
}

@end
