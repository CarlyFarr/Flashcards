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
    UIView *newView;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
    [button addTarget:self
               action:@selector(flipButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = self.flashCardView.frame;
    button.tag = FRONT; 
    newView = button;
    
    [self.view insertSubview:newView belowSubview:self.flashCardView]; 
    
        
    //Animation to slide newView from 
    [UIView animateWithDuration:.5 animations:^{
        self.flashCardView.frame = CGRectOffset(self.flashCardView.frame, 0, -(self.flashCardView.frame.origin.y + self.flashCardView.frame.size.height));
    }completion:^(BOOL finished) {
        [self.flashCardView removeFromSuperview];
        self.flashCardView = newView;
        
    }];
    
}

- (IBAction)Previous:(id)sender {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
    [button addTarget:self
               action:@selector(flipButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(self.flashCardView.frame.origin.x, -self.flashCardView.frame.size.height, self.flashCardView.frame.size.width, self.flashCardView.frame.size.height);
    
    button.tag = FRONT; 
    
    [self.view insertSubview:button aboveSubview:self.flashCardView];
    
    [UIView animateWithDuration:.5 animations:^{
        //Make button have the frame of self.flashCardView
            button.frame = self.flashCardView.frame;
        }completion:^(BOOL finished) {
            [self.flashCardView removeFromSuperview];
            self.flashCardView = button;
        
        }
     ];
    
    
}
@end
