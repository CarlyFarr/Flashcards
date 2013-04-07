//
//  FlashcardDeckViewController.m
//  Flashcards
//
//  Created by Carly Farr on 4/6/13.
//
//

/*
 
 dog.thisIsARandomProperty ; [dog setThisIsARandomProperty:property]
 */


#import "FlashcardDeckViewController.h"

@interface FlashcardDeckViewController ()

@end

@implementation FlashcardDeckViewController

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"segue %@",segue.identifier);
    if ([segue.identifier isEqualToString: @"DisplayDeck"] && [segue.destinationViewController respondsToSelector:@selector(setDeck:)]){
        //Make Deck Model
        DeckModel *deckOne = [[DeckModel alloc] init];
        deckOne.deckName = @"deckOne";
        deckOne.flashcards = [NSOrderedSet orderedSetWithObjects:[FlashcardModel flashCardWithFront:@"Christopher" Back:@"Is a butt"],[FlashcardModel flashCardWithFront:@"Carly" Back:@"Farr"],[FlashcardModel flashCardWithFront:@"Scotty" Back:@"Z"],nil];
        
        [segue.destinationViewController setDeck:deckOne];
    }
        
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
