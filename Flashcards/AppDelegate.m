//
//  AppDelegate.m
//  Flashcards
//
//  Created by kuwaharg on 1/25/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Flashcard.h"
#import "FlashcardDeck.h"
#import "FlashcardDeckViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize database = _database;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSURL* documentURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"database"];
    
    //Open/Create Database Document
    self.database = [[UIManagedDocument alloc] initWithFileURL:documentURL];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.database.fileURL.path]){
        //Open existing document
        NSLog(@"Openning Existing Document");

        [self.database openWithCompletionHandler:^(BOOL success) {
            if (!success) {
                NSLog(@"Error: %d",self.database.documentState);
            }
            else{
                //Test that we persisted data between launches
                
                UINavigationController* topNav = (UINavigationController*) self.window.rootViewController;
                if ([topNav.topViewController isKindOfClass:[FlashcardDeckViewController class]]){
                    FlashcardDeckViewController* deckVC = (FlashcardDeckViewController*) topNav.topViewController;
                    [deckVC.collectionView reloadData];
                }
                
                
                
                /*
                //Query for all objects...that have a specific value for "frontSide" property
                NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Flashcard"];
                fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"backSide" ascending:YES]];
                fetchRequest.predicate = [NSPredicate predicateWithFormat:@"frontSide == %@",@"Test String"];
                
                //Execute fetch request
                NSError *error = nil;
                NSArray *fetchedObjects = [self.database.managedObjectContext executeFetchRequest:fetchRequest error:&error];
                if (!error) {
                    NSLog(@"Persisted Data: %@",fetchedObjects);
                }
                 */
            }
        }];

    }
    else{
        //Create new document
        NSLog(@"Initial Save");
        [self.database saveToURL:self.database.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            if (success) {
                //Maybe do something the first time
                    //Example deck
                
            }
            
            
            
        }];
    }    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}
- (NSURL *)applicationDocumentsDirectory
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [searchPaths lastObject];
    
    return [NSURL fileURLWithPath:documentPath];
}

@end
