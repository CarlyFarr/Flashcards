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
    if ([segue.identifier isEqualToString: @"DisplayDeck"] && [segue.destinationViewController respondsToSelector:@selector(setMyArray:)]){
        [segue.destinationViewController setMyArray:
            [NSMutableArray arrayWithObjects:[FlashcardModel flashCardWithFront:@"Front" Back:@"Back"],[FlashcardModel flashCardWithFront:@"Carly" Back:@"Tiguay"], [FlashcardModel flashCardWithFront:@"Christopher" Back:@"Cwiiss"], nil]
         ];
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
