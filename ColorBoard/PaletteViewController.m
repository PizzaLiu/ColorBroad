//
//  PaletteViewController.m
//  ColorBoard
//
//  Created by Rainbow on 16/11/29.
//  Copyright © 2016年 PizzaLiu. All rights reserved.
//

#import "PaletteViewController.h"
#import "ColorViewController.h"
#import "ColorDesctiption.h"

@interface PaletteViewController ()

@property (nonatomic, strong) NSMutableArray *colors;

@end

@implementation PaletteViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.colors count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];

    ColorDesctiption *color = (ColorDesctiption *)[self.colors objectAtIndex:indexPath.row];
    cell.textLabel.text = color.name;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ExsitingColor"]) {
        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        ColorViewController *cvc = segue.destinationViewController;
        cvc.colorDesc = self.colors[path.row];
        cvc.isExistingColor = YES;
    } else {
        ColorDesctiption *color = [[ColorDesctiption alloc] init];
        [self.colors addObject:color];
        UINavigationController *nav = segue.destinationViewController;
        ColorViewController *cvc = (ColorViewController *)nav.topViewController;
        cvc.colorDesc = color;
        cvc.isExistingColor = NO;
    }
}

- (NSMutableArray *)colors
{
    if (!_colors) {
        _colors = [[NSMutableArray alloc] init];
        ColorDesctiption *color = [[ColorDesctiption alloc] init];
        [_colors addObject:color];
    }

    return _colors;
}

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    PaletteViewController *cv = nil;
    UIStoryboard *storyBoard = [coder decodeObjectForKey:UIStateRestorationViewControllerStoryboardKey];
    if (storyBoard) {
        cv = [storyBoard instantiateViewControllerWithIdentifier:@"PaletteViewController"];
        cv.restorationIdentifier = [identifierComponents lastObject];
        cv.restorationClass = [PaletteViewController class];
    }

    return cv;
}


@end
