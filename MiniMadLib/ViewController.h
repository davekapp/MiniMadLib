//
//  ViewController.h
//  MiniMadLib
//
//  Created by David Kapp on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *place;
@property (strong, nonatomic) IBOutlet UITextField *verb;
@property (strong, nonatomic) IBOutlet UITextField *number;
@property (strong, nonatomic) IBOutlet UITextView *storyTemplate;
@property (strong, nonatomic) IBOutlet UITextView *story;
@property (strong, nonatomic) IBOutlet UIButton *generateButton;

- (IBAction)generateStory:(id)sender;
- (IBAction)endEditing:(id)sender;

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
- (BOOL)textViewShouldEndEditing:(UITextView *)textView;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
