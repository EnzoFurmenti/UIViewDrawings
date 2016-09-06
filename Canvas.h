//
//  Drawing.h
//  UIViewDrawings
//
//  Created by EnzoF on 05.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Canvas : UIView
@property (strong, nonatomic) NSMutableArray *mArrayCentralPoints;
@property (strong, nonatomic) NSMutableArray *mArraySizeViews;
@property (strong, nonatomic) NSMutableArray *mArrayColorViews;
@property (strong, nonatomic) UIColor *currentColor;
@property (assign, nonatomic) CGSize currentSizeView;
@end
