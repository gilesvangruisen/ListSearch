//
//  MasterViewController.m
//  List Master
//
//  Created by Giles Van Gruisen on 3/13/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

#import "MasterViewController.h"

@interface MasterViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *messageLabel;
@end

@implementation MasterViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor = [UIColor colorWithWhite:0.97 alpha:1];
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, self.view.frame.size.width - 40, 40)];
        self.textField.delegate = self;
        self.textField.borderStyle = UITextBorderStyleRoundedRect;
        [self.view addSubview:self.textField];
        self.messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 80)];
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:self.messageLabel];
    }
    return self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.messageLabel.text = [NSString stringWithFormat:@"Begin: %@", textField.text];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.messageLabel.text = [NSString stringWithFormat:@"End: %@", textField.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
