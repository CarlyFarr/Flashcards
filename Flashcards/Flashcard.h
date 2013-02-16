//
//  Flashcard.h
//  Flashcards
//
//  Created by Chris Vanderschuere on 2/15/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class FlashcardDeck;

@interface Flashcard : NSManagedObject

@property (nonatomic, retain) NSString * frontSide;
@property (nonatomic, retain) NSString * backSide;
@property (nonatomic, retain) FlashcardDeck *deck;

@end
