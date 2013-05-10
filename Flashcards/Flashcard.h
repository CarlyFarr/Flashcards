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

@property (nonatomic, strong) NSString * frontSide;
@property (nonatomic, strong) NSString * backSide;
@property (nonatomic, strong) FlashcardDeck *deck;
@property (nonatomic, strong) NSData* frontImage;

@end
