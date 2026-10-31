#import <React/RCTViewComponentView.h>
#import <UIKit/UIKit.h>

#ifndef NativeSliderView_h
#define NativeSliderView_h

NS_ASSUME_NONNULL_BEGIN

/// The system UISlider as a Fabric component. On iOS 26 its thumb is Apple's glass
/// knob that magnifies while dragged.
@interface NativeSliderView : RCTViewComponentView
@end

NS_ASSUME_NONNULL_END

#endif /* NativeSliderView_h */
