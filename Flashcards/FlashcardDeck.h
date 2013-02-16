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
@property (nonatomic, retain) NSSet *flashcards;
@end

@interface FlashcardDeck (CoreDataGeneratedAccessors)

- (void)addFlashcardsObject:(NSManagedObject *)value;
- (void)removeFlashcardsObject:(NSManagedObject *)value;
- (void)addFlashcards:(NSSet *)values;
- (void)removeFlashcards:(NSSet *)values;

@end
