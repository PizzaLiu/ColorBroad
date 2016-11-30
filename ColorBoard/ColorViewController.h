//
//  ColorViewController.h
//  ColorBoard
//
//  Created by Rainbow on 16/11/28.
//  Copyright © 2016年 PizzaLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorDesctiption.h"

@interface ColorViewController : UIViewController <UIViewControllerRestoration>

@property (nonatomic, strong) ColorDesctiption *colorDesc;
@property (nonatomic, assign) BOOL isExistingColor;

@end
