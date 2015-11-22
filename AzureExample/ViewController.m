//
//  ViewController.m
//  AzureExample
//
//  Created by Joan on 18/11/15.
//  Copyright © 2015 biscarri. All rights reserved.
//

#import "ViewController.h"
#import "AzureDefines.h"
#import "ABSManager.h"

@interface ViewController ()
@property (strong, nonatomic) ABSManager *manager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.manager = [[ABSManager alloc] init];

    //UPLOAD IMAGE
    
    UIImage *testImage = [UIImage imageNamed:@"test.png"];

    [self.manager giveMeSaSURLBlobName:@"test.png"
                         containerName:AZURE_CONTAINER
                      completionSaSURL:^(NSURL *sasURL) {
                          if (sasURL != nil) {
                              [self.manager handleImageToUploadAzureBlob:sasURL
                                                                 blobImg:testImage
                                                    completionUploadTask:^(BOOL result, NSError *error) {
                                                        //Completion block: Yes if all was correct
                              }];
                          } else {
                              NSLog(@"Error al obtener la SAS URL");
                          }
        
                      }];
    
    //DOWNLOAD IMAGE
   
  [self.manager handleSaSURLToDownload:[NSURL URLWithString:[ABSManager getCDNURLStringForblobName:@"test.png" ] ]
                   completionHandleSaS:^(UIImage *image, NSError *error) {
      //Completion block: here we have the image retrieved
                       if (image != nil) {
                       
                       }
  }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
