//
//  FlashCardDisplayViewController.m
//  Flashcards
//
//  Created by kuwaharg on 1/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FlashCardDisplayViewController.h"

#define FRONT 100
#define BACK 200

@implementation FlashCardDisplayViewController
@synthesize flashCardView;
@synthesize myArray;

- (void) viewDidLoad {
    [super viewDidLoad];
    self.myArray = [NSArray arrayWithObjects: @"One",@"Two", nil];
    
}

- (IBAction)flipButtonPressed:(id)sender {
    UIView *newView;
    //Decide what newView will be
    if (self.flashCardView.tag == BACK) {
        //We want to transition to front side
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
        [button addTarget:self
                   action:@selector(flipButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
        button.frame = self.flashCardView.frame;
        button.tag = FRONT; 
        newView = button;
    }
    else{
        //Make back view
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"flashcardImage.jpg"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(flipButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = self.flashCardView.frame;
        button.tag = BACK;
        newView = button;
    }
    //Flipping direction based on side 
    [UIView transitionFromView:self.flashCardView toView:newView duration:.5 options:self.flashCardView.tag == FRONT? UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished){
        if (finished) {
            self.flashCardView = (UIView*) newView;
        }
                
    }];
    
}
- (void)viewDidUnload {
    [self setFlashCardView:nil];
    [super viewDidUnload];
}
- (IBAction)Next:(id)sender {
}

- (IBAction)Previous:(id)sender {
}
@end
