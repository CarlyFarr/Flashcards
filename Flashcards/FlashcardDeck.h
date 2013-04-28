//
//  FlashcardDeck.h
//  Flashcards
//
//  Created by Chris Vanderschuere on 2/15/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FlashcardDeck : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSOrderedSet *flashcards;
@end

@interface FlashcardDeck (CoreDataGeneratedAccessors)

- (void)addFlashcardsObject:(NSManagedObject *)value;
- (void)removeFlashcardsObject:(NSManagedObject *)value;
- (void)addFlashcards:(NSOrderedSet *)values;
- (void)removeFlashcards:(NSOrderedSet *)values;

@end
