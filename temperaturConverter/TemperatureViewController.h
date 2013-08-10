//
//  TemperatureViewController.h
//  temperaturConverter
//
//  Created by Ambika Janardhanan on 8/7/13.
//  Copyright (c) 2013 Y.CORP.YAHOO.COM\ambika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TemperatureViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *fahrenheitTextField;
@property (nonatomic, strong) IBOutlet UITextField *celsiusTextField;
@property (nonatomic, strong) IBOutlet UIButton *convertButton;

- (IBAction)onDoneButton;
- (IBAction)convertButtonClick;

@end
