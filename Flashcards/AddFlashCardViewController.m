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
@synthesize delegate = _delegate;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoa
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

BOOL isFront;
    

- (IBAction)frontPicButtonPressed:(id)sender {
   // if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = @[(NSString*)kUTTypeImage];
        
        self.cameraPopover = [[UIPopoverController alloc] initWithContentViewController:picker];
        [self.cameraPopover presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        isFront = YES;
//    }
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //Get image out of dict
    if (isFront == YES) {
        self.frontImage = [info objectForKey:UIImagePickerControllerEditedImage];
    }
    else{
        self.backImage = [info objectForKey:UIImagePickerControllerEditedImage];
        }
    
    //Do something
}

- (IBAction)backPicButtonPressed:(id)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = @[(NSString*)kUTTypeImage];
        
        self.cameraPopover = [[UIPopoverController alloc] initWithContentViewController:picker];
        [self.cameraPopover presentPopoverFromRect:[sender frame] inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        isFront = NO;
    }
}


- (IBAction)saveButtonPressed:(id)sender {
    //Create new flashcard
    Flashcard *newCard = [NSEntityDescription insertNewObjectForEntityForName:@"Flashcard" inManagedObjectContext:self.delegate.deck.managedObjectContext];
    newCard.deck = self.delegate.deck;
    newCard.frontSide = self.front.text;
    newCard.backSide = self.back.text;
    newCard.frontImage = UIImagePNGRepresentation(self.frontImage);
    
    self.delegate.deck = self.delegate.deck; //This is cheating....don't do this (again)
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
