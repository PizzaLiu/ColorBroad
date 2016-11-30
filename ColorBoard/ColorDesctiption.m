//
//  ColorDesctiption.m
//  ColorBoard
//
//  Created by Rainbow on 16/11/29.
//  Copyright © 2016年 PizzaLiu. All rights reserved.
//

#import "ColorDesctiption.h"

@implementation ColorDesctiption

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"blue";
        _color = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:1.0];
    }

    return self;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.color forKey:@"color"];
    [aCoder encodeObject:self.name forKey:@"name"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.color = (UIColor *)[aDecoder decodeObjectForKey:@"color"];
    self.name = (NSString *)[aDecoder decodeObjectForKey:@"name"];

    return self;
}

@end
