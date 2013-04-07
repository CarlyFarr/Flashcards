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
@synthesize flashCardView = _flashCardView;
@synthesize deck = _deck;
@synthesize nextButton = _nextButton;
@synthesize previousButton = _previousButton;
@synthesize lazyModeButton =  _lazyModeButton;
@synthesize lazyModeTimer = _lazyModeTimer;


- (void) viewDidLoad {
    [super viewDidLoad];
    
    //Force setMyArray to be called again after outlets set
    self.deck = self.deck;
    
}
-(void) setDeck:(DeckModel *)deck{
    _deck = deck;
    
    if (_deck !=nil && _deck.flashcards.count > 0) {
        UIButton *currentButton = (UIButton*) self.flashCardView;
        self.flashCardView.hidden = NO;
        [currentButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        self.currentFlashcard = [self.deck.flashcards lastObject];
         
        [currentButton setTitle:self.currentFlashcard.frontString forState:UIControlStateNormal];
    }
    else{
        self.flashCardView.hidden = YES;
    }

        
    
    
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
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button setTitle:self.currentFlashcard.frontString forState:UIControlStateNormal];
        button.tag = FRONT; 
        newView = button;
    }
    else{
        //Make back view
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:[UIImage imageNamed:@"flashcardImage.jpg"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(flipButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = self.flashCardView.frame;
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button setTitle:self.currentFlashcard.backString forState:UIControlStateNormal];
        button.tag = BACK;
        newView = button;
    }
    
    
    //Flipping direction based on side
    /*
    [UIView transitionFromView:self.flashCardView toView:newView duration:.5 options:self.flashCardView.tag == FRONT? UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished){
        if (finished) {
            self.flashCardView = (UIView*) newView;
        }
                
    }];*/
    
    self.nextButton.enabled = NO;
    self.previousButton.enabled = NO;
    [UIView animateWithDuration:.3 animations:^{
        //Transition the current view to sideways
        CATransform3D rotationTransform = CATransform3DMakeRotation(M_PI_2, 0, 1, 0);
        self.flashCardView.layer.transform = rotationTransform;
    }completion:^(BOOL finished) {
        //Add the new view and remove the old view
        newView.layer.transform = self.flashCardView.layer.transform;
        [self.flashCardView removeFromSuperview];
        [self.view addSubview:newView];
        self.flashCardView = newView;

        //Transition the new view to the correct way
        [UIView animateWithDuration:.3 animations:^{
            self.flashCardView.layer.transform = CATransform3DIdentity;
        }
         completion:^(BOOL finished) {
             self.nextButton.enabled = YES; 
             self.previousButton.enabled = YES; 
         }];
        
    }];
}
- (void)viewDidUnload {
    [self setFlashCardView:nil];
    [self setNextButton:nil];
    [self setPreviousButton:nil];
    [self setLazyModeButton:nil];
    [super viewDidUnload];
}
- (IBAction)Next:(id)sender {
    if (self.deck == nil || self.deck.flashcards.count == 0)
        return;
    
    UIView *newView;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
    [button addTarget:self
               action:@selector(flipButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = self.flashCardView.frame;
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    NSUInteger nextIndex = ([self.deck.flashcards indexOfObject:self.currentFlashcard]+1)%self.deck.flashcards.count;
    self.currentFlashcard = [self.deck.flashcards objectAtIndex:nextIndex];
    [button setTitle: [[self.deck.flashcards objectAtIndex:nextIndex] frontString] forState:UIControlStateNormal];
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
    if (self.deck == nil || self.deck.flashcards.count == 0)
        return;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
    [button addTarget:self
               action:@selector(flipButtonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = self.flashCardView.frame;
    
    //Move to previous index...check if less than 0 (If so make equal to count - 1)
   // NSUInteger prevIndex = ([self.myArray indexOfObject:currentButton.currentTitle]-1)%self.myArray.count;  
    NSInteger prevIndex = [self.deck.flashcards indexOfObject:self.currentFlashcard];
    if (prevIndex-1<0)
        prevIndex = self.deck.flashcards.count-1;
    else 
        prevIndex = prevIndex-1;
    
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle: [[self.deck.flashcards objectAtIndex:prevIndex] frontString] forState:UIControlStateNormal];
    self.currentFlashcard = [self.deck.flashcards objectAtIndex:prevIndex];
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

- (IBAction)lazyModePressed:(id)sender {
    if (self.lazyModeTimer == nil|| self.lazyModeTimer.isValid == NO) {
        self.lazyModeTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(moveInLazyMode) userInfo:nil repeats:YES];
    }
    else {
        [self.lazyModeTimer invalidate];
    }
}

- (IBAction)editButtonPressed:(id)sender {
}

- (void) moveInLazyMode{
    if (self.flashCardView.tag == FRONT) {
        [self flipButtonPressed:nil];
    }
    else {
        [self Next:nil];
    }
}
    


@end
