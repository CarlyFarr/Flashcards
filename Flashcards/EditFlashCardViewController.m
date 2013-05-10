//
//  EditFlashCardViewController.m
//  Flashcards
//
//  Created by Chris Vanderschuere on 5/4/13.
//
//

#import "EditFlashCardViewController.h"

@implementation EditFlashCardViewController

@synthesize flashcard;
@synthesize frontSide;
@synthesize backSide;

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
    
    
    //loading front and back side strings/objects from Flashcard
    //x = 5;
    
    self.frontSide.text = self.flashcard.frontSide;
    self.backSide.text = self.flashcard.backSide;
}

- (void)viewDidUnload {
    [self setFrontSide:nil];
    [self setBackSide:nil];
    [super viewDidUnload];
}
- (IBAction)saveButtonPressed:(id)sender {
    //update flashcard change(s)
    self.flashcard.frontSide = self.frontSide.text;
    self.flashcard.backSide = self.backSide.text;
    
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
