//
//  FlashcardModel.m
//  Flashcards
//
//  Created by Carly Farr on 4/5/13.
//
//

#import "FlashcardModel.h"

@implementation FlashcardModel

@synthesize frontString;
@synthesize backString;


+(id)flashCardWithFront:(NSString *)front Back:(NSString *)back{
    FlashcardModel* newFlashCard = [[FlashcardModel alloc] init];
    
    newFlashCard.frontString = front;
    newFlashCard.backString = back;
    
    
    return newFlashCard;
}

@end
