//
//  ViewController.m
//  MiniMadLib
//
//  Created by David Kapp on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
  
@property (strong, nonatomic) NSMutableSet *dissmissableViews;

@end
  
@implementation ViewController
@synthesize story;
@synthesize generateButton;
@synthesize place;
@synthesize verb;
@synthesize number;
@synthesize storyTemplate;
@synthesize dissmissableViews;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];  
	// Do any additional setup after loading the view, typically from a nib.
  self.dissmissableViews = [[NSMutableSet alloc] init];
  
  [self.dissmissableViews addObject:self.place];
  [self.dissmissableViews addObject:self.verb];
  [self.dissmissableViews addObject:self.number];
  [self.dissmissableViews addObject:self.storyTemplate];
  [self.dissmissableViews addObject:self.story];
}

- (void)viewDidUnload
{
    [self setPlace:nil];
    [self setVerb:nil];
    [self setNumber:nil];    
    [self setStory:nil];
    [self setStoryTemplate:nil];
    [self setGenerateButton:nil];
    [self setDissmissableViews:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)generateStory:(id)sender {
}

- (IBAction)endEditing:(id)sender {
  [sender resignFirstResponder];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
  return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
  return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [[event allTouches] anyObject];
  UIView *touchedView = [touch view];
  UIView *firstResponderView = nil;
  for (UIView *view in [self.view subviews]) {
    if ([view isFirstResponder]) {
      firstResponderView = view;
      break;
    }
  }
  
  // if the view that is the first responder is dismissable and the view that was touched is not the first responder,
  // then make the first responder resign that status to make the keyboard go away
  if ([dissmissableViews containsObject:firstResponderView] && touchedView != firstResponderView) {
    [firstResponderView resignFirstResponder];
  }
         
  [super touchesBegan:touches withEvent:event];
}

@end
