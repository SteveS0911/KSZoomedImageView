//
//  ViewController.m
//  KSZoomedImageView
//
//  Created by Steve on 2016-10-18.
//  Copyright © 2016 Steve. All rights reserved.
//

#import "KSZoomedImageViewDemoViewController.h"
#import "KSZoomedImageView.h"

@interface KSZoomedImageViewDemoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet KSZoomedImageView *KSZoomedImageView;

@end

@implementation KSZoomedImageViewDemoViewController

# pragma mark - Life Cycle -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self showImagePickerViewController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Private -

- (void)showImagePickerViewController {
    
    UIImagePickerController *picker = [UIImagePickerController new];
    
    picker.delegate = self;
    
    picker.allowsEditing = YES;
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

# pragma mark - ImagePicker ViewController Delegate -

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Set up image on scroll view
    
    [self.KSZoomedImageView setImageOnImageView:info[UIImagePickerControllerEditedImage] withContentMode:UIViewContentModeScaleAspectFit];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
