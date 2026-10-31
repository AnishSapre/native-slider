import React from 'react'
import { StyleSheet, type ColorValue, type StyleProp, type ViewStyle } from 'react-native'
import NativeSliderView from './NativeSliderNativeComponent'
import { isAvailable } from './platform'

export type SliderProps = {
  value: number
  minimumValue?: number
  maximumValue?: number
  /** Called continuously while the user drags. */
  onValueChange?: (value: number) => void
  onSlidingStart?: (value: number) => void
  /** Called once when the user lets go. */
  onSlidingComplete?: (value: number) => void
  minimumTrackTintColor?: ColorValue
  maximumTrackTintColor?: ColorValue
  disabled?: boolean
  style?: StyleProp<ViewStyle>
  testID?: string
}

/**
 * Apple's UISlider. On iOS 26 its thumb is the liquid glass knob that magnifies while
 * dragged. `value` is controlled, but the thumb is never moved out from under the user's
 * finger. Renders nothing on Android.
 */
export const Slider = ({ onValueChange, onSlidingStart, onSlidingComplete, style, ...props }: SliderProps) => {
  if (!isAvailable) return null
  return (
    <NativeSliderView
      {...props}
      style={[styles.slider, style]}
      onSliderStart={onSlidingStart ? e => onSlidingStart(e.nativeEvent.value) : undefined}
      onSliderChange={onValueChange ? e => onValueChange(e.nativeEvent.value) : undefined}
      onSliderComplete={onSlidingComplete ? e => onSlidingComplete(e.nativeEvent.value) : undefined}
    />
  )
}

const styles = StyleSheet.create({
  slider: { height: 40 },
})
