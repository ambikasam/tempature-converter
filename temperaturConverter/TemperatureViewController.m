//
//  TemperatureViewController.m
//  temperaturConverter
//
//  Created by Ambika Janardhanan on 8/7/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\ambika. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()

@property(nonatomic, strong) NSString *selectedField;

- (void)updateValues;
- (void)convertButtonClick;
- (float)fahrenheit2celsius:(float) fahrenheit;
- (float)celsius2farenheit:(float) celsius;

@end

@implementation TemperatureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Temperature Converter";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.celsiusTextField.delegate = self;
    self.fahrenheitTextField.delegate = self;
    
    [self.convertButton addTarget:self action:@selector(convertButtonClick) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField  {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    self.selectedField = textField.placeholder;
    return YES;
}


#pragma mark - Private methods

- (void)onDoneButton {
    [self.view endEditing:YES];
}

- (IBAction)convertButtonClick {
    self.navigationItem.rightBarButtonItem = nil;
    [self.view endEditing:YES];
    [self updateValues];
}

//(5/9-->1/(5/9)-->1.8)
- (float) fahrenheit2celsius:(float) fahrenheit { return (fahrenheit-32)/1.8; }
//(9/5-->1.8)
- (float) celsius2farenheit:(float) celsius   { return   (celsius*1.8)+32; }

- (void)updateValues {
    if ((self.celsiusTextField.text.length == 0) && (self.fahrenheitTextField.text.length > 0)) {
        float celsius = [self fahrenheit2celsius:[self.fahrenheitTextField.text floatValue]];
        self.celsiusTextField.text = [NSString stringWithFormat:@"%.2f", celsius];
    }
    else if ((self.fahrenheitTextField.text.length == 0) && (self.celsiusTextField.text.length > 0))
    {
        float fahrenheit = [self celsius2farenheit:[self.celsiusTextField.text floatValue]];
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%.2f", fahrenheit];
    }
    else if ((self.fahrenheitTextField.text.length > 0) && (self.celsiusTextField.text.length > 0)) {
        if ([self.selectedField isEqualToString:@"Celsius Temp"]) {
            float fahrenheit = [self celsius2farenheit:[self.celsiusTextField.text floatValue]];
            self.fahrenheitTextField.text = [NSString stringWithFormat:@"%.2f", fahrenheit];
        }
        else {
            float celsius = [self fahrenheit2celsius:[self.fahrenheitTextField.text floatValue]];
            self.celsiusTextField.text = [NSString stringWithFormat:@"%.2f", celsius];
        }
    }
}

@end
