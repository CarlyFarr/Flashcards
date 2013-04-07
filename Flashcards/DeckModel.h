//
//  DeckModel.h
//  Flashcards
//
//  Created by Carly Farr on 4/7/13.
//
//

#import <Foundation/Foundation.h>

@interface DeckModel : NSObject

@property (nonatomic, strong) NSString *deckName;
@property (nonatomic, strong) NSOrderedSet *flashcards;


@end
