#import "NativeSliderView.h"

#import <react/renderer/components/NativeSliderSpec/ComponentDescriptors.h>
#import <react/renderer/components/NativeSliderSpec/EventEmitters.h>
#import <react/renderer/components/NativeSliderSpec/Props.h>
#import <react/renderer/components/NativeSliderSpec/RCTComponentViewHelpers.h>

#import <React/RCTConversions.h>
#import <React/RCTFabricComponentsPlugins.h>

using namespace facebook::react;

@interface NativeSliderView () <RCTNativeSliderViewProtocol>
@end

@implementation NativeSliderView {
  UISlider *_slider;
}

+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<NativeSliderComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
  if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const NativeSliderProps>();
    _props = defaultProps;

    _slider = [[UISlider alloc] initWithFrame:CGRectZero];
    [_slider addTarget:self action:@selector(touchDown) forControlEvents:UIControlEventTouchDown];
    [_slider addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
    [_slider addTarget:self
                action:@selector(touchUp)
      forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside | UIControlEventTouchCancel];
    self.contentView = _slider;
  }
  return self;
}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<NativeSliderProps const>(_props);
  const auto &p = *std::static_pointer_cast<NativeSliderProps const>(props);

  _slider.minimumValue = p.minimumValue;
  _slider.maximumValue = p.maximumValue;
  // JS owns the value, but never move the thumb out from under the user's finger.
  if (!_slider.isTracking) {
    _slider.value = p.value;
  }
  _slider.enabled = !p.disabled;

  if (oldViewProps.minimumTrackTintColor != p.minimumTrackTintColor) {
    _slider.minimumTrackTintColor = RCTUIColorFromSharedColor(p.minimumTrackTintColor);
  }
  if (oldViewProps.maximumTrackTintColor != p.maximumTrackTintColor) {
    _slider.maximumTrackTintColor = RCTUIColorFromSharedColor(p.maximumTrackTintColor);
  }

  [super updateProps:props oldProps:oldProps];
}

- (std::shared_ptr<const NativeSliderEventEmitter>)emitter
{
  return _eventEmitter ? std::static_pointer_cast<const NativeSliderEventEmitter>(_eventEmitter) : nullptr;
}

- (void)touchDown
{
  if (auto emitter = [self emitter]) {
    emitter->onSliderStart(NativeSliderEventEmitter::OnSliderStart{.value = _slider.value});
  }
}

- (void)valueChanged
{
  if (auto emitter = [self emitter]) {
    emitter->onSliderChange(NativeSliderEventEmitter::OnSliderChange{.value = _slider.value});
  }
}

- (void)touchUp
{
  if (auto emitter = [self emitter]) {
    emitter->onSliderComplete(NativeSliderEventEmitter::OnSliderComplete{.value = _slider.value});
  }
}

@end
