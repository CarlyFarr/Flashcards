//
//  FlashCardDisplayViewController.h
//  Flashcards
//
//  Created by kuwaharg on 1/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Flashcard.h"
#import "FlashcardDeck.h"
#import "AddFlashCardViewController.h"

@interface FlashCardDisplayViewController : UIViewController <AddFlashCardDelegate>

- (IBAction)flipButtonPressed:(UIButton*)sender;
@property (weak, nonatomic) IBOutlet UIView *flashCardView;
@property (strong, nonatomic) FlashcardDeck *deck;
@property (nonatomic, strong) Flashcard *currentFlashcard;//always set to flashcard thats visible on screen
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;
@property (weak, nonatomic) IBOutlet UIButton *lazyModeButton;
@property (strong, nonatomic) NSTimer *lazyModeTimer;
@property (weak, nonatomic) IBOutlet UIButton *editButton;

- (IBAction)Next:(id)sender;
- (IBAction)Previous:(id)sender;
- (IBAction)lazyModePressed:(id)sender;
- (IBAction)editButtonPressed:(id)sender;


@end
