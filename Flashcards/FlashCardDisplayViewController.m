//
//  FlashCardDisplayViewController.m
//  Flashcards
//
//  Created by kuwaharg on 1/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "FlashCardDisplayViewController.h"

@implementation FlashCardDisplayViewController
@synthesize flashCardView;

- (IBAction)flipButtonPressed:(id)sender {
    UIView *newView;
    //Decide what newView will be
    if ([self.flashCardView isKindOfClass:[UIImageView class]]) {
        //We want to transition to front side
   //     newView = [[UIView alloc] initWithFrame:self.flashCardView.frame];
     //   newView.backgroundColor = [UIColor blueColor];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
        [button addTarget:self
                   action:@selector(flipButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"Show View" forState:UIControlStateNormal];
        button.frame = self.flashCardView.frame;
        newView = button;
        
    }
    else{
        //Transition to back view
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"flashcardImage.jpg"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(flipButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = self.flashCardView.frame;
        
        newView = button;
    }
    
    [UIView transitionFromView:self.flashCardView toView:newView duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished){
        if (finished) {
            self.flashCardView = (UIView*) newView;
        }
    }];
    
}
- (void)viewDidUnload {
    [self setFlashCardView:nil];
    [super viewDidUnload];
}
@end
