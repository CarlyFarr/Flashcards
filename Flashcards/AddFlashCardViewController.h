//
//  ViewController.h
//  Flashcards
//
//  Created by kuwaharg on 1/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashcardDeck.h"


@protocol AddFlashCardDelegate <NSObject>

@property (nonatomic, strong) FlashcardDeck* deck;

@end


@interface AddFlashCardViewController: UIViewController <UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *back;
@property (weak, nonatomic) IBOutlet UITextField *front;
@property (nonatomic, strong) UIImage *frontImage;
@property (nonatomic, strong) UIImage *backImage;

@property (nonatomic,strong) UIPopoverController* cameraPopover;

@property (nonatomic,weak) id<AddFlashCardDelegate> delegate;
- (IBAction)frontPicButtonPressed:(id)sender;
- (IBAction)backPicButtonPressed:(id)sender;

- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;
@end
