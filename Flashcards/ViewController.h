//
//  ViewController.h
//  Flashcards
//
//  Created by kuwaharg on 1/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *topView;
@property (weak, nonatomic) IBOutlet UIButton *bottomView;
- (IBAction)saveButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@end
