import { codegenNativeComponent, type CodegenTypes, type ColorValue, type ViewProps } from 'react-native'

type ValueEvent = Readonly<{ value: CodegenTypes.Double }>

export interface NativeProps extends ViewProps {
  value: CodegenTypes.Double
  minimumValue?: CodegenTypes.WithDefault<CodegenTypes.Double, 0>
  maximumValue?: CodegenTypes.WithDefault<CodegenTypes.Double, 1>
  minimumTrackTintColor?: ColorValue
  maximumTrackTintColor?: ColorValue
  disabled?: boolean
  // Event names are global across native components; prefixed so they can't clash
  // with another component's (e.g. a bubbling topValueChange).
  onSliderStart?: CodegenTypes.DirectEventHandler<ValueEvent>
  onSliderChange?: CodegenTypes.DirectEventHandler<ValueEvent>
  onSliderComplete?: CodegenTypes.DirectEventHandler<ValueEvent>
}

export default codegenNativeComponent<NativeProps>('NativeSlider')
