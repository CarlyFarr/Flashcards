//
//  EditFlashCardViewController.h
//  Flashcards
//
//  Created by Chris Vanderschuere on 5/4/13.
//
//

#import <Foundation/Foundation.h>
#import "Flashcard.h"

@interface EditFlashCardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *frontSide;
@property (weak, nonatomic) IBOutlet UITextField *backSide;
@property (nonatomic, strong) Flashcard *flashcard;


- (IBAction)saveButtonPressed:(id)sender;


- (IBAction)cancelButtonPressed:(id)sender;


@end
