# KSZoomedImageView

An image view that can be zoomed in and out

## Getting Started

Copy KSZoomedImageView.h and .m file to your project and import to your view controller (Please see demo)

```
#import "KSZoomedImageView.h"
```

Put a scroll view on your view controller from the story board and set the class to KSZoomedImageView.
As an example project, once finished picking up an image from UIImagePickerViewController, you can set the image on the image view.

```
# pragma mark - ImagePicker ViewController Delegate -

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Set up image on scroll view
    
    [self.KSZoomedImageView setImageOnImageView:info[UIImagePickerControllerEditedImage] withContentMode:UIViewContentModeScaleAspectFit];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
```

You can also change your minimum scale and maximum scale on KSZoomedImageView.m

```
//Change zoomed scale
#define MIN_ZOOMED 1.0f
#define MAX_ZOOMED 4.0f
```


## Requirements
iOS 8, xcode 7

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
