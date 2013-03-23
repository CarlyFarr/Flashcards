//
//  ViewController.m
//  Flashcards
//
//  Created by kuwaharg on 1/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize topView;
@synthesize bottomView;
@synthesize saveButton;

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
    
    UITextView *topTextView = [[UITextView alloc] initWithFrame:self.topView.frame];
    topTextView.text = @"something";
    topTextView.font = [UIFont systemFontOfSize:26];
    topTextView.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:topTextView];
    [topTextView sizeToFit];
    
    UITextView *bottomTextView = [[UITextView alloc] initWithFrame:self.bottomView.frame]; 
    bottomTextView. text = @"BOTTOM";
    bottomTextView.font = [UIFont systemFontOfSize:26];
    bottomTextView.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:bottomTextView];
    [bottomTextView sizeToFit];

    
}

- (void)viewDidUnload
{
    [self setTopView:nil];
    [self setBottomView:nil];
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
    return YES;
}

- (IBAction)saveButtonPressed:(id)sender {
}
@end
