//
//  ViewController.m
//  Flashcards
//
//  Created by kuwaharg on 1/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "AddFlashCardViewController.h"
#import "Flashcard.h"

@implementation AddFlashCardViewController

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
    
    
}


- (IBAction)saveButtonPressed:(id)sender {
    //Create new flashcard
    Flashcard *newCard = [NSEntityDescription insertNewObjectForEntityForName:@"Flashcard" inManagedObjectContext:self.delegate.deck.managedObjectContext];
    newCard.deck = self.delegate.deck;
    newCard.frontSide = self.front.text;
    newCard.backSide = self.back.text;
    
    self.delegate.deck = self.delegate.deck; //This is cheating....don't do this (again)
    
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
