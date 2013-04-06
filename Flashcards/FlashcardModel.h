//
//  FlashcardModel.h
//  Flashcards
//
//  Created by Carly Farr on 4/5/13.
//
//

#import <Foundation/Foundation.h>

@interface FlashcardModel : NSObject

@property (nonatomic, strong) NSString *frontString;
@property (nonatomic, strong) NSString *backString;

+(id) flashCardWithFront:(NSString*)front Back:(NSString*)back;

@end
