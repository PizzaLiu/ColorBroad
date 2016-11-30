//
//  ColorViewController.m
//  ColorBoard
//
//  Created by Rainbow on 16/11/28.
//  Copyright © 2016年 PizzaLiu. All rights reserved.
//

#import "ColorViewController.h"
#import "PaletteViewController.h"

@interface ColorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *colorNameLabel;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@end

@implementation ColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.isExistingColor) {
        self.navigationItem.rightBarButtonItem = nil;
    }
    if (self.colorDesc) {
        UIColor *color = self.colorDesc.color;
        self.colorNameLabel.text = self.colorDesc.name;
        CGFloat red, green, blue;
        [color getRed:&red green:&green blue:&blue alpha:nil];

        self.redSlider.value = red;
        self.greenSlider.value = green;
        self.blueSlider.value = blue;
        self.view.backgroundColor = color;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self saveEditingColor];
    [super viewWillDisappear:animated];
}

#pragma mark - IBAction

- (IBAction)dismiss:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)changeColor:(id)sender
{
    float red = self.redSlider.value;
    float green = self.greenSlider.value;
    float blue = self.blueSlider.value;

    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];

    self.view.backgroundColor = color;
}

#pragma mark - restore

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    ColorViewController *cvc = nil;
    UIStoryboard *storyBoard = [coder decodeObjectForKey:UIStateRestorationViewControllerStoryboardKey];

    if (storyBoard) {
        cvc = [storyBoard instantiateViewControllerWithIdentifier:@"ColorViewController"];
        cvc.restorationIdentifier = [identifierComponents lastObject];
        cvc.restorationClass = [ColorViewController class];
    }

    return cvc;
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
    [self saveEditingColor];
    [coder encodeObject:self.colorDesc forKey:@"colorDesc"];
    [coder encodeBool:self.isExistingColor forKey:@"isExistingColor"];

    [super encodeRestorableStateWithCoder:coder];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    self.colorDesc = (ColorDesctiption *)[coder decodeObjectForKey:@"colorDesc"];
    self.isExistingColor = [coder decodeBoolForKey:@"isExistingColor"];

    [super decodeRestorableStateWithCoder:coder];
}

- (void)saveEditingColor
{
    self.colorDesc.color = self.view.backgroundColor;
    self.colorDesc.name = self.colorNameLabel.text;
}

@end
