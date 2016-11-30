//
//  ColorDesctiption.h
//  ColorBoard
//
//  Created by Rainbow on 16/11/29.
//  Copyright © 2016年 PizzaLiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ColorDesctiption : NSObject <NSCoding>

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSString *name;

@end
