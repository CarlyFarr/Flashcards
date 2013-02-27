//
//  FlashCardDisplayViewController.h
//  Flashcards
//
//  Created by kuwaharg on 1/29/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlashCardDisplayViewController : UIViewController

- (IBAction)flipButtonPressed:(UIButton*)sender;
@property (weak, nonatomic) IBOutlet UIView *flashCardView;
@property (strong, nonatomic) NSMutableArray *myArray;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *previousButton;

- (IBAction)Next:(id)sender;
- (IBAction)Previous:(id)sender;


@end
