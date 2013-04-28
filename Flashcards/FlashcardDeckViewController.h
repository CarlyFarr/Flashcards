//
//  FlashcardDeckViewController.h
//  Flashcards
//
//  Created by Carly Farr on 4/6/13.
//
//

#import <UIKit/UIKit.h>
#import "FlashCardDisplayViewController.h"
#import "DeckModel.h"

@interface FlashcardDeckViewController : UICollectionViewController <NSFetchedResultsControllerDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)addDeck:(id)sender;

@end
